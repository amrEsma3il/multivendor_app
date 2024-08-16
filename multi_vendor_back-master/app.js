const express=require('express');
const bodyParser=require('body-parser')
const app=express();
const userRouter=require('./routes/auth_router');
const itemRouter=require('./routes/items_router');
const catRouter=require('./routes/category_router');
const homeRouter=require('./routes/home_router');
const favouriteRouter=require('./routes/favourite');
const searchRouter=require('./routes/search');
const cartRouter=require('./routes/cart');
const cuponRouter=require('./routes/cupon');



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use('/auth',userRouter);
app.use('/categories',catRouter);
app.use('/items',itemRouter);
app.use('/home',homeRouter);
app.use('/favourite',favouriteRouter);
app.use('/cart',cartRouter);
app.use('/search',searchRouter);
app.use('/cupon',cuponRouter);
// app.use('/address',addressRouter);


app.use('/uploads',express.static('uploads'));

app.all('*',(req,res)=>{

    const err=new Error(`${req.path} not found`)
    res.status(404).json({msg:err.message,field:"url"})
});



app.listen(300,()=>{

console.log("server is running !!");
});