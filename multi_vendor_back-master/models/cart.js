const mydb = require("./../config/db");

class cartModel {


  static async viewCart(userId) {
    return new Promise((resolve, reject) => {
 
      // Construct the update query dynamically based on the provided fields
      let updateQuery =
      `SELECT item_id, item_name_en, item_name_ar, item_description_en, item_description_ar, item_img, item_price,item_quantity, item_discount,
      item_active, item_craeted, item_category,price_after_discount,COUNT(cart.cart_id) as quantity,SUM(item_cat.price_after_discount) as cost from cart 
      INNER JOIN item_cat ON cart.cart_itemsid = item_cat.item_id AND cart.cart_usersid=?
      GROUP BY cart.cart_usersid,cart.cart_itemsid order by cart_id DESC `;

      let updateValues = [userId];

      mydb.query(updateQuery, updateValues, (error, result) => {
        if (!error) {
          if (result.length > 0) resolve(result);
          else resolve(false);
        } else {
          reject(error);
        }
      });
    });
  }


  static async getQuantity(userId, itemId) {
    return new Promise((resolve, reject) => {
  
      let updateQuery =`SELECT COUNT(cart_id) as quantity from cart WHERE cart_usersid=? AND cart_itemsid=? GROUP BY cart_usersid,cart_itemsid `;
      let updateValues = [userId, itemId];

      mydb.query(updateQuery, updateValues, (error, result) => {
        if (!error) {
          if (result.length > 0) resolve(result);
          else {
            console.log(result)
            resolve(false)};
        } else {
          reject(error);
        }
      });
    });
  }



  static async addCart(userId, itemId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "INSERT INTO `cart`( `cart_usersid`, `cart_itemsid`) VALUES (?,?)",
        [userId, itemId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }


  static async deleteAllQuantity(userId, itemId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "DELETE FROM `cart` WHERE `cart_usersid` = ? AND `cart_itemsid` =?",
        [userId, itemId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }


  static async deleteItem(userId, itemId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        `DELETE FROM cart WHERE cart_id = ( SELECT cart.cart_id from cart 
            INNER JOIN items ON cart.cart_itemsid = items.item_id AND cart.cart_usersid=? AND cart.cart_itemsid=? 
            ORDER BY cart.cart_id DESC
            LIMIT 1 )`,
        [userId, itemId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }



  static async deleteCart(userId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "DELETE FROM `cart` WHERE `cart_usersid` = ?",
        [userId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }

}

module.exports = cartModel;
