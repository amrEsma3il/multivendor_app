const mysql=require('mysql');

const db=mysql.createPool({
    host:"localhost",
    user:"root",
    password:"",
    database:"multivendor_db",
    
});


db.getConnection(()=>{
    "connected to db successfully"
}

);

module.exports=db;