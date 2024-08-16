const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const itemsController=require('../controllers/items');


router.post('/allItems',itemsController.getAllItems);
router.all('/allItems',itemsController.notAllowedController);


// router.get('/signin', (req, res) => {
//     // Handle the GET request logic here
//     res.status(405).json({  mesg: 'method not allowed', field: 'GET' });
//   });
  
module.exports=router;