
const mydb = require("./../config/db");

class catModel{

    static async getAllCategories(userData) {
        return new Promise((resolve,reject) => {
          const {id,nameEn,nameAr} = userData;
    
          // Construct the update query dynamically based on the provided fields
          let updateQuery = "SELECT * From categories WHERE";
          let updateValues = [];
    
          if (id) {
            updateQuery += " cat_id=? AND";
            updateValues.push(id);
          }
          
          if (nameEn) {
            updateQuery += " cat_name_en=? AND";
            updateValues.push(nameEn);
          }
          if (nameAr) {
            updateQuery += " cat_name_ar=? AND";
            updateValues.push(nameAr);
          }
       updateQuery =  (id||nameEn||nameAr) ?updateQuery.slice(0, -4): updateQuery.slice(0, -6);
    
         
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



module.exports = catModel;