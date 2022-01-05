const express = require('express');
const server = express();
const port = 3000;

const cors = require('cors');

const CORS_OPTIONS = {
    origin : 'http://localhost:4200',
    optionSuccessStatus:200
}

server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(CORS_OPTIONS));

const USERS = [
    {
    id:1,
    userName:"Shweta"
    },
    {
    id:2,
    userName:"Sachin"
    },
    {
    id:3,
    userName:"Cletus"
    },
]


server.get('/',(req,resp)=> {
  resp.send("Express is workng");
});

server.get('/users',(req,resp)=>{
    resp.setHeader("Content-type","application/json");
    resp.send(USERS);
});

server.listen(port,()=>{
    console.log("http://localhost:3000 is started");
})