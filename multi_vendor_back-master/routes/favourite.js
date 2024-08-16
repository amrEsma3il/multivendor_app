const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const favouriteController=require('../controllers/favourite');

// add to favorite 
router.post('/',favouriteController.addFavourite);
// router.all('/',favouriteController.notAllowedController);

// delete from favorite 
router.delete('/',favouriteController.deleteItem);
router.delete('/:userId',favouriteController.deleteFavourite);

// router.all('/',favouriteController.notAllowedController);

// view favorite 
router.get('/',favouriteController.viewFavourite);
// router.all('/',favouriteController.notAllowedController);




module.exports=router;


