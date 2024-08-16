
const mydb = require("./../config/db");
const helper = require("./../helpers/helpers");


class searchModel{

    static async searchData(userId,catId,search) {
        return new Promise((resolve,reject) => {
    
          // Construct the update query dynamically based on the provided fields
         let updateQuery = `SELECT * FROM (${helper.itemTble(userId)}) AS item_detail WHERE`;
          let updateValues = [];
    
        
          
         
        
          if (catId) {
            updateQuery += " item_detail.item_category=? AND";
            updateValues.push(catId);
          }

          if (search) {
            updateQuery +=  ` (item_detail.item_name_en LIKE '%${search}%' OR item_detail.item_name_ar LIKE '%${search}%') AND`;
           } 
        
       updateQuery =  (search||catId)?updateQuery.slice(0, -4): updateQuery.slice(0, -6);
    
         
          mydb.query(updateQuery,updateValues, (error, result) => {
            if (!error) {
    
    
            if(result.length > 0)  resolve(result)
            else  resolve(false)
            
            }
         
            else{reject(error)}
          });
          
        });
      }
}



module.exports = searchModel;