const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const catController=require('../controllers/cat');


router.get('/allCat',catController.getAllCategories);
router.all('/allCat',catController.notAllowedController);


// router.get('/signin', (req, res) => {
//     // Handle the GET request logic here
//     res.status(405).json({  mesg: 'method not allowed', field: 'GET' });
//   });
  
module.exports=router;