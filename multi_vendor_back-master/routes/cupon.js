const express=require('express');
const {check}=require('express-validator');
const router=express.Router();

const cuponController=require('../controllers/cupon');

// add to Cupon 
router.post('/',cuponController.addCupon);
// router.all('/',cuponController.notAllowedController);

// delete from Cupon 
router.delete('/:cuponId',cuponController.deleteCupon)

// router.all('/',cuponController.notAllowedController);

// view Cupon 
router.get('/:userId',cuponController.validCupon);

router.patch('/:cuponId',cuponController.editCupon);

// router.all('/',cuponController.notAllowedController);




module.exports=router;


