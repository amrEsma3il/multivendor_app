
const mydb = require("./../config/db");
const helper = require("./../helpers/helpers");


class itemModel{

    static async getAllItems(userData) {
        return new Promise((resolve,reject) => {
  const {userId,id,nameEn,nameAr,price,quantity,discount,active,itemCategory,discount_price,inCart,inFavourite} = userData;
    
          // Construct the update query dynamically based on the provided fields
         let updateQuery = `
         SELECT * FROM (${helper.itemTble(userId)}) AS item_detail WHERE`;
          let updateValues = [];
    
          if (id) {
            updateQuery += " item_detail.item_id=? AND";
            updateValues.push(id);
          }
          
          if (nameEn) {
            updateQuery += " item_detail.item_name_en=? AND";
            updateValues.push(nameEn);
          }
          if (nameAr) {
            updateQuery += " item_detail.item_name_ar=? AND";
            updateValues.push(nameAr);
          }
          if (price) {
            updateQuery += " item_detail.item_price=? AND";
            updateValues.push(price);
          }
          if (quantity) {
            updateQuery += " item_detail.item_quantity=? AND";
            updateValues.push(quantity);
          }
          if (discount) {
            updateQuery += " item_detail.item_discount>=? AND";
            updateValues.push(discount);
            
          }
          if (active) {
            updateQuery += " item_detail.item_active=? AND";
            updateValues.push(active);
          }
          if (itemCategory) {
            updateQuery += " item_detail.item_category=? AND";
            updateValues.push(itemCategory);
          }
          
          if (discount_price) {
            updateQuery += " item_detail.price_after_discount=? AND";
            updateValues.push(itemCategory);
          }
          if (inCart) {
            updateQuery += " item_detail.cart=? AND";
            updateValues.push(itemCategory);
          }
          if (inFavourite) {
            updateQuery += " item_detail.favourite=? AND";
            updateValues.push(itemCategory);
          }
       updateQuery =  (id||nameEn||nameAr||price||quantity||discount||active||itemCategory)?updateQuery.slice(0, -4): updateQuery.slice(0, -6);
    
         
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



module.exports = itemModel;