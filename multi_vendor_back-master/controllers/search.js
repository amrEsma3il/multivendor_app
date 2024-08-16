
const searchModel = require("./../models/search");
const { validationResult } = require("express-validator");
const helper = require("./../helpers/helpers");


class searchController{
    
    static async searchData(req, res) {
    const userId= req.body.userId;
    const catId= req.body.catId;
    const search= req.body.search;

    try {

  
      var itemsSearch = await searchModel.searchData(userId,catId,search);
  
      if (itemsSearch == false) {
        return res.status(404).json({ msg: `process not found items contain ${search}` , field: "search" });
      } else {
        return res.status(200).json({ items: itemsSearch });
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

  module.exports = searchController;