module.exports=(app)=>{

    const express=require('express');

    const ROUTER=express.Router();

    const BookController=require('./book.controller');

    ROUTER.get('/books',BookController.findAll);

    ROUTER.get('/books/:id',BookController.findByPk);

    ROUTER.post('/books/add',BookController.create);
    //PUT url: http://localhost:3500/app/users/update/:id
    ROUTER.put('/books/update/:id',BookController.update);
    //DELETE url: http://localhost:3500/app/users/delete/:id
    ROUTER.delete('/books/delete/:id',BookController.delete);  
    //Main url: http://localhost:3500/app/
      



    app.use('/app',ROUTER);

}