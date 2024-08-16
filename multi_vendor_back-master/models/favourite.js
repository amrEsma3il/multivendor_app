const mydb = require("./../config/db");

class FavourieModel {
  static async viewFavourite(userId) {
    return new Promise((resolve, reject) => {
  const  fields=" cat_id,`cat_name_en` ,`cat_name_ar`, `item_id`, `item_name_en`, `item_name_ar`, `item_description_en`, `item_description_ar`, `item_img`, `item_price`,`item_quantity`, `item_discount`,`item_active`, `item_craeted`, `item_category`,`price_after_discount`"
      // Construct the update query dynamically based on the provided fields
      let updateQuery =
        "SELECT" + fields + "from favourite INNER JOIN item_cat ON favourite.`favourite_itemsid` = item_cat.item_id AND favourite.favourite_usersid=?";
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

  static async addFavourite(userId, itemId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "INSERT INTO favourite ( `favourite_usersid`, `favourite_itemsid`) VALUES (?,?)",
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
        "DELETE FROM favourite WHERE `favourite_usersid` = ? AND `favourite_itemsid` = ?",
        [userId, itemId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }



  static async deleteFavourite(userId) {
    return new Promise((resolve, reject) => {
      mydb.query(
        "DELETE FROM `favourite` WHERE `favourite_usersid` =?",
        [userId],
        (error, result) => {
          if (!error) resolve(true);
          else reject(error);
        }
      );
    });
  }

}

module.exports = FavourieModel;
