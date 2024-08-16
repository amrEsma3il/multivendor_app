const cartModel = require("./../models/cart");
const { validationResult } = require("express-validator");
const helper = require("./../helpers/helpers");

class cartController {
  static async viewCart(req, res) {
    var userId = req.query.userId;
    try {
      if (userId === undefined) {
        return res.status(400).json({ msg: "field missed", field: "userId" });
      }

      var result = await cartModel.viewCart(userId);

      if (result == false) {
        return res.status(404).json({ msg: "is empty", field: "cart" });
      } else {
        let count =result.length
        let cost =0;
for (let item of result) {
  cost += item['cost'];
}

    //  var cost=   sum(result.map((item)=>{item['cost']}))
        return res.status(200).json({ items: result ,cartCount:count,cartPrice:cost});
      }
    } catch (error) {
      var isErrorMessageSql =
        error.sqlMessage === undefined ||
        error.sqlMessage == null ||
        error.sqlMessage.length <= 0;
      return res.status(500).json({
        msg: isErrorMessageSql
          ? error.message.length <= 0
            ? "internal server error"
            : error.message
          : error.sqlMessage,
        field: isErrorMessageSql ? "server" : "database",
      });
    }
  }



  static async getQuantity(req, res) {
    var userId = req.body.userId;
    var itemId = req.body.itemId;
    try {
      if (userId === undefined ||  itemId === undefined) {
        return res.status(400).json({ msg: "field(s) missed", field: "userId or itemId" });
      }

      var result = await cartModel.getQuantity(userId,itemId);

      if (result == false) {
        return res.status(404).json({ msg: "have not added this product to the cart", field: "You" });
      } else {
        return res.status(200).json(result[0]);
      }
    } catch (error) {
      var isErrorMessageSql =
        error.sqlMessage === undefined ||
        error.sqlMessage == null ||
        error.sqlMessage.length <= 0;
      return res.status(500).json({
        msg: isErrorMessageSql
          ? error.message.length <= 0
            ? "internal server error"
            : error.message
          : error.sqlMessage,
        field: isErrorMessageSql ? "server" : "database",
      });
    }
  }



  static async addCart(req, res) {
    const { userId, itemId } = req.body;
    try {
      if (userId === undefined || itemId === undefined) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId or itemId " });
      }

      var result = await cartModel.addCart(userId, itemId);

      if (result == true)
        res.status(200).json({ msg: "add to cart successfully" });
    } catch (error) {
      var isErrorMessageSql =
        error.sqlMessage === undefined ||
        error.sqlMessage == null ||
        error.sqlMessage.length <= 0;
      return res.status(500).json({
        msg: isErrorMessageSql
          ? error.message.length <= 0
            ? "internal server error"
            : error.message
          : error.sqlMessage,
        field: isErrorMessageSql ? "server" : "database",
      });
    }
  }

  static async deleteCart(req, res) {
    const userId = req.params.userId;
    try {
      if (userId === undefined ) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId " });
      }

      var result = await cartModel.deleteCart(userId);

      if (result == true)
        res.status(200).json({ msg: "delete all items in cart successfully" });
    } catch (error) {
      var isErrorMessageSql =
        error.sqlMessage === undefined ||
        error.sqlMessage == null ||
        error.sqlMessage.length <= 0;
      return res.status(500).json({
        msg: isErrorMessageSql
          ? error.message.length <= 0
            ? "internal server error"
            : error.message
          : error.sqlMessage,
        field: isErrorMessageSql ? "server" : "database",
      });
    }
  }



  static async deleteItem(req, res) {
    const { userId, itemId } = req.body;
    try {
      if (userId === undefined || itemId === undefined) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId or itemId " });
      }

      var result = await cartModel.deleteItem(userId, itemId);

      if (result == true)
        res.status(200).json({ msg: "delete item from cart successfully" });
    } catch (error) {
      var isErrorMessageSql =
        error.sqlMessage === undefined ||
        error.sqlMessage == null ||
        error.sqlMessage.length <= 0;
      return res.status(500).json({
        msg: isErrorMessageSql
          ? error.message.length <= 0
            ? "internal server error"
            : error.message
          : error.sqlMessage,
        field: isErrorMessageSql ? "server" : "database",
      });
    }
  }



  static async deleteAllQuantity(req, res) {
    const { userId, itemId } = req.body;
    try {
      if (userId === undefined || itemId === undefined) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId or itemId " });
      }

      var result = await cartModel.deleteAllQuantity(userId, itemId);

      if (result == true)
        res.status(200).json({ msg: "delete all item's quantity from cart successfully" });
    } catch (error) {
      var isErrorMessageSql =
        error.sqlMessage === undefined ||
        error.sqlMessage == null ||
        error.sqlMessage.length <= 0;
      return res.status(500).json({
        msg: isErrorMessageSql
          ? error.message.length <= 0
            ? "internal server error"
            : error.message
          : error.sqlMessage,
        field: isErrorMessageSql ? "server" : "database",
      });
    }
  }

  static notAllowedController(req, res) {
    res.status(405).json({ msg: "method not allowed", field: req.method });
  }
}

module.exports = cartController;
