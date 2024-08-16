const mydb = require("./../config/db");

class cuponModel {


  static async validCupon(userId,cuponName) {
  try{  
    return new Promise((resolve, reject) => {
 
      // queries
      let oneQuery ="SELECT * FROM `users` WHERE `u_id`=? AND `feature_ban`=0";
      let twoQuery ="SELECT * FROM `cupon` WHERE `cupon_name`=? AND `cupon_count` >0 AND `cupon_expired` > CURRENT_TIMESTAMP()";
      let threeQuery ="SELECT COUNT(user_cupon_id) AS count FROM user_cupon WHERE user_cupon_userid=? AND user_cupon_cuponid =? GROUP BY user_cupon_userid ,user_cupon_cuponid ";
      //
    

      mydb.query(oneQuery, [userId], (error, firstresult) => {
        if (!error) {
         
          if (firstresult.length > 0){


            //second query


            mydb.query(twoQuery, [cuponName], (error, secondresult) => {
              if (!error) {
            
                if (secondresult.length > 0){
            
                  var cuponId=secondresult[0].cupon_id

                  // third query

                  mydb.query(threeQuery, [userId,cuponId], async(error, thirdresult) => {
                    if (!error) {
                  var count_real=secondresult[0].count_per_user
                  var count_used=thirdresult[0]===undefined?null:thirdresult[0].count
                  
                  var cuponCount=secondresult[0].cupon_count


                      if (count_used==null||thirdresult.length == 0|| count_used<count_real ){
                  
                        await  this.editCupon(cuponId,{count:(cuponCount==1?0:cuponCount-1)})
                        await this.addUserCupon(userId,cuponId)
                        resolve(secondresult[0]);
                        
              } else if(count_used>=count_real ){ resolve({msg:"You've exceeded your limit in using this cupon"});}

                      else{resolve({msg:"You've exceeded limit in using this cupon"});}

                    } else {
                      reject(error);
                    }
                  });

                  
                  
                  
                } 
                else {resolve({msg:" this cupon is expired"});}
              } else {
                reject(error);
              }
            });
            


            


          }

          else {resolve({msg:" your account baned from any extra feature"});}
        } else {
          reject(error);
        }
      });
    });}catch(error){
      throw new Error(error.sqlMessage)

    }
  }




  static async addCupon(CuponData) {
    return new Promise((resolve, reject) => {
        const { name, count, expired, discount, countPerUser} = CuponData;
      mydb.query(
        "INSERT INTO `cupon`( `cupon_name`, `cupon_count`, `cupon_expired`, `cupon_discount`, `count_per_user`) VALUES (?,?,?,?,?)",
        [name, count, expired, discount, countPerUser],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }



  

  static async editCupon(cuponId, CuponData) {
  
     return new Promise((resolve,reject) => {
 
     
          const { name, count, expired, discount, countPerUser} =CuponData;
  
       // Construct the update query dynamically based on the provided fields
       let updateQuery = "UPDATE cupon SET";
       let updateValues = [];
 
       if (name) {
         updateQuery += " cupon_name=?,";
         updateValues.push(name);
       }
       if (count>=0) {
         updateQuery += " cupon_count=?,";
         updateValues.push(count);
       }
       if (expired) {
         updateQuery += " cupon_expired=?,";
         updateValues.push(expired);
       }
       if (discount) {
         updateQuery += " cupon_discount=?,";
         updateValues.push(discount);
       }
       if (countPerUser) {
         updateQuery += " count_per_user=?,";
         updateValues.push(countPerUser);
       }
 
       // Remove the trailing comma and add the WHERE clause
       updateQuery = updateQuery.slice(0, -1) + " WHERE cupon_id=?";
 
       // Add the user ID to the update values array
       updateValues.push(cuponId);
 
       mydb.query(updateQuery, updateValues, (error, result) => {
         if (!error) {
   
           resolve(true);
         } else {
           reject(error)
         }
       });
        
 
     });
   }



  static async deleteCupon(cuponId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "DELETE FROM `cupon` WHERE `cupon_id`=?",
        [cuponId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }





    static async addUserCupon(userId,cuponId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "INSERT INTO `user_cupon`( `user_cupon_userid`, `user_cupon_cuponid`) VALUES (?,?)",
        [userId,cuponId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }


}

module.exports = cuponModel;
