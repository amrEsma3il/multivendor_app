const favouriteModel = require("./../models/favourite");
const { validationResult } = require("express-validator");
const helper = require("./../helpers/helpers");

class FavouriteController {
  static async viewFavourite(req, res) {
    var userId = req.query.userId;
    try {
      if (userId === undefined) {
        return res.status(400).json({ msg: "field missed", field: "userId" });
      }

      var result = await favouriteModel.viewFavourite(userId);

      if (result == false) {
        return res.status(404).json({ msg: "is empty", field: "favourites" });
      } else {
        return res.status(200).json({ items: result });
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

  static async addFavourite(req, res) {
    const { userId, itemId } = req.body;
    try {
      if (userId === undefined || itemId === undefined) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId or itemId " });
      }

      var result = await favouriteModel.addFavourite(userId, itemId);

      if (result == true)
        res.status(200).json({ msg: "add to favourite successfully" });
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

      var result = await favouriteModel.deleteItem(userId, itemId);

      if (result == true)
        res.status(200).json({ msg: "delete item from favourite successfully" });
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



  static async deleteFavourite(req, res) {
    const userId = req.params.userId;
    try {
      if (userId === undefined ) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId " });
      }

      var result = await favouriteModel.deleteFavourite(userId);

      if (result == true)
        res.status(200).json({ msg: "delete all items in favourite successfully" });
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

module.exports = FavouriteController;
