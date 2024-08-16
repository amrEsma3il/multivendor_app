const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const userController=require('../controllers/user');


router.post('/signin',userController.signIn);
router.all('/signin',userController.notAllowedController);

router.post('/signup',userController.signUp);
router.all('/signup',userController.notAllowedController);

router.patch('/signup/verify',userController.signUpVerfication);
router.all('/signup/verify',userController.notAllowedController);

router.patch('/forgetpassword',userController.forgetPassword);
router.all('/forgetpassword',userController.notAllowedController);

router.get('/forgetpassword/verify',userController.forgetPasswordVerfication);
router.all('/forgetpassword/verify',userController.notAllowedController);

router.patch('/forgetpassword/resetpassword',userController.resetPassword);
router.all('/forgetpassword/resetpassword',userController.notAllowedController);


router.patch('/resendVerify',userController.resendVerify);
router.all('/resendVerify',userController.notAllowedController);


// router.patch('/home',userController.home);
// router.all('/home',userController.notAllowedController);

// router.get('/signin', (req, res) => {
//     // Handle the GET request logic here
//     res.status(405).json({  mesg: 'method not allowed', field: 'GET' });
//   });
  
module.exports=router;


