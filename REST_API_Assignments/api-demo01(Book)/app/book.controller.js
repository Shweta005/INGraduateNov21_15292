const db=require('../db/models');//index.js=>db

const Book=db.Book;

// 1. select * from users => findAll

exports.findAll=(req,resp)=>{

    Book.findAll()

        .then(data=>resp.json(data))

        .catch(err=>{

            resp.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

// 2. seelct * from users where id=?=>findByPK

exports.findByPk=(req,resp)=>{

    const id=parseInt(req.params.id);

    Book.findByPk(id)

        .then(data=>resp.json(data))

        .catch(err=>{

            resp.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

//  INSERT INTO public."People"(
// id, "firstName", "lastName", "createdAt", "updatedAt")
// VALUES (?, ?, ?, ?, ?);
exports.create = (req, resp) => {
    if(!req.body.bookName){
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }
    const newBook={
        
        bookName: req.body.bookName,
        authorName: req.body.authorName,
        publicationDate:req.body.publicationDate,
        createdAt:new Date(),
        updatedAt:new Date()
    }
    Book.create(newBook)
        .then(data=>{resp.send(data);})
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Some error Creating new Person data"
            })
        })
}
// UPDATE public."People"
// 	SET id=?, "firstName"=?, "lastName"=?, "createdAt"=?, "updatedAt"=?
// 	WHERE <condition>;
exports.update = (req, resp) => {
    const id = req.params.id;

    Book.update(req.body, { where: { id: id } })
        .then(num => {
            if (num == 1) {
            resp.send({
                message: `User with id ${id} updated successfully.`
            });
            } else {
            resp.send({
                message: `Cannot update Person with id=${id}. Maybe Person was not found or req.body is empty!`
            });
            }
        })
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Some error retriving People data"
            })
        })
}
// DELETE FROM public."People"
// 	WHERE <condition>;
exports.delete = (req, resp) => {
    const id = req.params.id;
    Book.destroy({ where: { id: id } })
        .then(num => {
            if (num == 1) {
                resp.send({ message: `User with id=${id} deleted successfully!` });
            } else {
                resp.send({ message: `Cannot delete User with id=${id}. Maybe User was not found!` });
            }
        })
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Could not delete User with id=" + id
            })
        })
}