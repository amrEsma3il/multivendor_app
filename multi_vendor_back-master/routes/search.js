const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const searchController=require('../controllers/search');


router.get('/',searchController.searchData);
router.all('/',searchController.notAllowedController);


  
module.exports=router;


