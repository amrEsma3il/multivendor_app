const path=require('path')
const multer=require('multer')
const { randomInt } = require('crypto')



var storage=multer.diskStorage({
    destination:(req,file,callback)=>{

        callback(null,'/uploads')
        
    },

    filename:(req,file,callback)=>{

        let ext=path.extname(file.originalname)
        callback(null,Date.now()+ randomInt(999,92782)+ ext)

        
    }
})


var upload=multer({

    storage:storage,
    fileFilter:(req,file,callback)=>{

        if(
            file.mimetype=='image/png' || file.mimetype==='image/jpg'
        ){

            callback(null,true)
        }else{

            console.log()
            callback(null,false)
        }
        
    },
    limits:{
        fileSize:1024 * 1024 * 2
    }
})


module.exports=upload