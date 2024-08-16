const cuponModel = require("./../models/cupon");
const { validationResult } = require("express-validator");
const helper = require("./../helpers/helpers");

class cuponController {
  static async validCupon(req, res) {
    var cuponName = req.body.cuponName;
    var userId = req.body.userId
    try {
      if (cuponName === undefined) {
        return res.status(400).json({ msg: "field missed", field: "cuponName" });
      }

      var result = await cuponModel.validCupon(userId,cuponName);

      if (result['msg'] === undefined) {
        return res.status(200).json({ msg: `you can take this order with ${result['cupon_discount']}% discount now`,
      coupon:result,
      });
      } else {
        const { msg } = result;

          res.status(403).json({ msg: msg ,
         
          });
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





  static async addCupon(req, res) {
    const CuponData = req.body;
    try {
      if (userId === undefined || cuponId === undefined) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "userId or cuponId " });
      }

      var result = await cuponModel.addCupon(CuponData);

      if (result == true)
        res.status(200).json({ msg: "add new cupon successfully" });
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
 


  static async editCupon(req, res) {
    const cuponId = req.params.cuponId;
    const CuponData = req.body;
    try {
      if (cuponId === undefined ) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "cuponId " });
      }

      var result = await cuponModel.editCupon(cuponId,CuponData);

      if (result == true)
        res.status(200).json({ msg: "update cupon successfully" });
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




  static async deleteCupon(req, res) {
    const cuponId = req.params.cuponId;
    try {
      if (cuponId === undefined ) {
        return res
          .status(400)
          .json({ msg: "field missed", field: "cuponId " });
      }

      var result = await cuponModel.deleteCupon(cuponId);

      if (result == true)
        res.status(200).json({ msg: "delete cupon successfully" });
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

module.exports = cuponController;
