
const catModel = require("./../models/cat");
const { validationResult } = require("express-validator");
const helper = require("./../helpers/helpers");


class catController{
    
    static async getAllCategories(req, res) {
    var userData = req.body;
    try {

    //   if (userData.id === undefined || userData.email === undefined ) {
        
    //     return res.status(400).json({ msg:"field missed", field: "password or email" });
    
    //   }
    //   var validationResult = helper.requestVlidation(req, 'GET');
    //   if (validationResult) {
    //     return res
    //       .status(validationResult.status)
    //       .json({ msg: validationResult.message, field: validationResult.field });
    //   }
  
      var categories = await catModel.getAllCategories(userData);
  
      if (categories == false) {
        return res.status(404).json({ msg: "not found", field: "categories" });
      } else {
        return res.status(200).json({ categories: categories });
      }
    } catch (error) {
      var isErrorMessageSql=( error.sqlMessage===undefined ||error.sqlMessage==null||error.sqlMessage.length<=0 )
      return res.status(500).json({ 
        msg:isErrorMessageSql?error.message.length<=0?"internal server error":error.
        message:error.sqlMessage, field: isErrorMessageSql?"server":"database"});
    }
  }

  static notAllowedController(req,res){


    res.status(405).json({  msg: 'method not allowed', field: req.method });
}

}

  module.exports = catController;