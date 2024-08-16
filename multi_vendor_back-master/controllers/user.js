const UserModel = require("./../models/user");
const { validationResult } = require("express-validator");
const helper = require("./../helpers/helpers");

class UserController {
  static async signIn(req, res) {
    var userData = req.body;
    try {

      if (userData.password === undefined || userData.email === undefined) {

        return res.status(400).json({ msg: "field missed", field: "password or email" });

      }
      var validationResult = helper.requestVlidation(req, 'POST');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }

      var result = await UserModel.getUser(userData);

      if (result == false) {
        return res.status(401).json({ msg: "not valid", field: "email or password" });
      } else {
    if (result[0]['user_approval'] == '0')
     return res.status(401).json({ msg: "not Approval or Unauthorized", field: "user" });

       else 
       return res.status(200).json({ msg: "registered successfully",userInfo:result[0] });
      }
    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }
  static async signUp(req, res) {
    var verify_code = Math.floor(Math.random() * (99334 - 11476) + 11476);
    const { email, username, password, phone, img_profile } = req.body;
    try {



      if (password === undefined || email === undefined || username === undefined || phone === undefined) {

        return res.status(400).json({ msg: "field missed", field: "email or phone or username or passwotd" });

      }
      var validationResult = helper.requestVlidation(req, 'POST');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }


      var result = await UserModel.addUser(
        email,
        username,
        password,
        phone,
        img_profile,
        verify_code
      );

      if (result == true) {
        helper.sendMail(
          email,
          "Rocket🚀🚀",
          `your verfication code : ${verify_code}`
        );

        res.status(200).json({ msg: "account created successfully" });
      } else {
        const { msg } = result;

        res.status(409).json({ msg: msg });

      }
    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }



  static async signUpVerfication(req, res) {
    var userData = req.body;

    try {

      if (userData.verify_code === undefined || userData.email === undefined) {

        return res.status(400).json({ msg: "field missed", field: "email or verfication code" });

      }
      var validationResult = helper.requestVlidation(req, 'PATCH');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }

      var result = await UserModel.getUser(userData);

      if (result != false || result.length > 0) {
        var approval = await UserModel.updateUser(result[0].u_id, {
          approval: "1",
        });

        if (approval == true) res.status(200).json({ msg: "sucsses code" });
        else {
          const { msg } = approval;

          res.status(401).json({ msg: msg });

        }
      } else {
        res.status(401).json({ msg: "not valid" ,field:"verify code"});
      }
    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }

  static async forgetPassword(req, res) {
    var userData = req.body;
    var email = userData.email;
    try {

      if (userData.email === undefined) {

        return res.status(400).json({ msg: "field missed", field: "email" });

      }
      var validationResult = helper.requestVlidation(req, 'PATCH');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }

      var result = await UserModel.getUser(userData);

      if (result == false) {
        res.status(401).json({ msg: "email not found" });
      } else {
        var verify_code = Math.floor(Math.random() * (99334 - 11476) + 11476);
        var isUpdated = await UserModel.updateUser(result[0].u_id, {
          verify_code: verify_code,
        });

        if (isUpdated == true) {
          helper.sendMail(
            email,
            "Rocket🚀🚀",
            `your verfication code : ${verify_code}`
          );
          res.status(200).json({ msg: "code_verfiy send successfullu" });
        } else {
          const { msg } = isUpdated;

          res.status(401).json({ msg: msg });

        }
      }
    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }

  static async forgetPasswordVerfication(req, res) {
    var userData = req.body;
    try {
      if (userData.verify_code === undefined || userData.email === undefined) {

        return res.status(400).json({ msg: "field missed", field: "email or verfication code" });

      }
      var validationResult = helper.requestVlidation(req, 'GET');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }

      var result = await UserModel.getUser(userData);

      if (result == false) res.status(403).json({ msg: "not valid code" });
      else res.status(200).json({ msg: "sucess code" });


    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }

  static async resetPassword(req, res) {
    var userData = { email: req.body.email };
    var password = req.body.password

    try {
      if (password === undefined || userData.email === undefined) {

        return res.status(400).json({ msg: "field missed", field: "email or password" });

      }
      var validationResult = helper.requestVlidation(req, 'PATCH');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }

      var result = await UserModel.getUser(userData);

      if (result != false || result.length > 0) {
        var resetPassword = await UserModel.updateUser(result[0].u_id, {
          password: password,
        });

        if (resetPassword == true) res.status(200).json({ msg: "re-password success" });
        else {
          const { msg } = resetPassword;

          res.status(401).json({ msg: msg });

        }
      } else {
        res.status(401).json({ msg: "user not found" });
      }
    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }



  static async resendVerify(req, res) {
    var userData = req.body;
    var email = userData.email;
    try {

      if (userData.email === undefined) {

        return res.status(400).json({ msg: "field missed", field: "email" });

      }
      var validationResult = helper.requestVlidation(req, 'PATCH');
      if (validationResult) {
        return res
          .status(validationResult.status)
          .json({ msg: validationResult.message, field: validationResult.field });
      }

      var result = await UserModel.getUser(userData);

      if (result == false) {
        res.status(401).json({ msg: "email not found" });
      } else {
        var verify_code = Math.floor(Math.random() * (99334 - 11476) + 11476);
        var isUpdated = await UserModel.updateUser(result[0].u_id, {
          verify_code: verify_code,
        });

        if (isUpdated == true) {
          helper.sendMail(
            email,
            "Rocket🚀🚀",
            `your verfication code : ${verify_code}`
          );
          res.status(200).json({ msg: "code_verfiy send successfully" });
        } else {
          const { msg } = isUpdated;

          res.status(401).json({ msg: msg });

        }
      }
    } catch (error) {
      var isErrorMessageSql = (error.sqlMessage === undefined || error.sqlMessage == null || error.sqlMessage.length <= 0)
      return res.status(500).json({
        msg: isErrorMessageSql ? error.message.length <= 0 ? "internal server error" : error.
          message : error.sqlMessage, field: isErrorMessageSql ? "server" : "database"
      });
    }
  }


  static notAllowedController(req, res) {


    res.status(405).json({ msg: 'method not allowed', field: req.method });
  }
}



module.exports = UserController;
