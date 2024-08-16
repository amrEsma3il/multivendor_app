const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const homeController=require('../controllers/home');


router.post('/',homeController.homeView);
router.all('/',homeController.notAllowedController);



// router.patch('/home',userController.home);
// router.all('/home',userController.notAllowedController);

// router.get('/signin', (req, res) => {
//     // Handle the GET request logic here
//     res.status(405).json({  mesg: 'method not allowed', field: 'GET' });
//   });
  
module.exports=router;


