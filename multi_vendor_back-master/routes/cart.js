const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const cartController=require('../controllers/cart');

// add to cart 
router.post('/',cartController.addCart);
// router.all('/',cartController.notAllowedController);

// delete from cart 
router.delete('/:userId',cartController.deleteCart)
router.delete('/itemcart/item',cartController.deleteItem);
router.delete('/item/quantity',cartController.deleteAllQuantity);
// router.all('/',cartController.notAllowedController);

// view cart 
router.get('/',cartController.viewCart);
router.get('/quantity',cartController.getQuantity);
// router.all('/',cartController.notAllowedController);




module.exports=router;


