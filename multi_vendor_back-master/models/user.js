
const mydb = require("./../config/db");

class UserModel {
  static async getUser(userData) {
    return new Promise((resolve,reject) => {
      const {id,email,password,verify_code,approval,phone} = userData;

      // Construct the update query dynamically based on the provided fields
      let updateQuery = "SELECT * From users WHERE";
      let updateValues = [];

      if (id) {
        updateQuery += " u_id=? AND";
        updateValues.push(id);
      }
      if (email) {
        updateQuery += " email=? AND";
        updateValues.push(email);
      }
      if (password) {
        updateQuery += " password=? AND";
        updateValues.push(password);
      }
      if (verify_code) {
        updateQuery += " verify_code=? AND";
        updateValues.push(verify_code);
      }
      if (approval) {
        updateQuery += " user_approval=? AND";
        updateValues.push(approval);
      }
      if (phone) {
        updateQuery += " phone=? AND";
        updateValues.push(approval);
      }
    
    
      updateQuery =  (id||email|| password|| phone|| verify_code||approval) ?updateQuery.slice(0, -4): updateQuery.slice(0, -6);

     
      mydb.query(updateQuery,updateValues, (error, result) => {
        if (!error) {


        if(result.length > 0)  resolve(result)
        else  resolve(false)
        
        }
     
        else{reject(error)}
      });
      
    });
  }
//Math.floor(Math.random() * (max - min)
  static async addUser(email, username, password, phone, img_profile=null,verify_code) {
    
try{    var userExisit = await this.getUser({email:email,});
    
    return new Promise((resolve,reject) => {

    
          if (userExisit == false){
            mydb.query(
              "insert into users(email,username,password,phone,img_profile,verify_code,user_approval) values(?,?,?,?,?,?,?)",
              [email, username, password, phone, img_profile,verify_code,"0"],
              (error, result) => {
                if (!error) resolve(true);
              else reject(error);
                
              }
            );
          }
          else {
            resolve({msg:"email already exisit"});
          }
          
        })}catch(error){
          throw new Error(error.sqlMessage)
        }
      
    }
  

  static async deleteUser(id) {
try{    var userExisit = await this.getUser({ id: id });
    
      return new Promise((resolve,reject) => {
        if (userExisit ) {
          mydb.query(
            "delete from users where u_id=?",
            [id],
            (error, result) => {
              if (!error) {resolve(true);}
              else {reject(error);}
            }
          )
        } else {
          resolve({msg:"user not found"});
        }
      });}catch(error){

        throw new Error(error.sqlMessage)
      }
    
  }

  static async updateUser(id, userData) {
   try{ var userExisit = await this.getUser({ id: id });
    return new Promise((resolve,reject) => {

      if (userExisit ){   
         const { email, username, password, phone, verify_code, img_profile ,approval} =
        userData;

      // Construct the update query dynamically based on the provided fields
      let updateQuery = "UPDATE users SET";
      let updateValues = [];

      if (email) {
        updateQuery += " email=?,";
        updateValues.push(email);
      }
      if (username) {
        updateQuery += " username=?,";
        updateValues.push(username);
      }
      if (password) {
        updateQuery += " password=?,";
        updateValues.push(password);
      }
      if (phone) {
        updateQuery += " phone=?,";
        updateValues.push(phone);
      }
      if (verify_code) {
        updateQuery += " verify_code=?,";
        updateValues.push(verify_code);
      }
      if (img_profile) {
        updateQuery += " img_profile=?,";
        updateValues.push(img_profile);
      }
      if (approval) {
        updateQuery += " user_approval=?,";
        updateValues.push(approval);
      }

      // Remove the trailing comma and add the WHERE clause
      updateQuery = updateQuery.slice(0, -1) + " WHERE u_id=?";

      // Add the user ID to the update values array
      updateValues.push(id);

      mydb.query(updateQuery, updateValues, (error, result) => {
        if (!error) {
          console.log(result)
          resolve(true);
        } else {
          console.log(result)
          reject(error)
        }
      });}else {
        resolve({msg:"user not found"});
      }

    });}catch(error){

      throw new Error(error.sqlMessage)
    }
  }
}

module.exports = UserModel;
