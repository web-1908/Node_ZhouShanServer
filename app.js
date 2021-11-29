//功能：舟山服务器程序
//1:下载四个第三方模块
//express           web服务器
//mysql             mysql驱动
//express-session   会话对象
//cors              跨域
//[8080脚手架   4000服务器]
//npm i express mysql express-session cors
//2:引入第三方模块
const express = require("express");
const session = require("express-session");
const mysql = require("mysql");
const cors = require("cors");
//3:创建数据库连接池
var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root",
   password:"",
   port:3306,
   connectionLimit:15,
   database:"travel"
})
//4:创建web服务器
var server = express();
//5:配置跨域
//允许跨域程序端口
server.use(cors({
    //允许哪个程序列表 脚手架
    origin:["http://127.0.0.1:8080",
    "http://localhost:8080"],
    //每次请求验证
    credentials:true
}));
//6:配置session对象
server.use(session({
   secret:"128位安全字符串",//加密条件
   resave:true,            //每次请求更新服务器数据
   saveUninitialized:true  //保存初始化数据
}))
//7:指定静态目录  public
server.use(express.static("public")); 
//8:启动监听端口  4000
server.listen(4000);


// 获取轮播图片
server.get("/banImg",(req,res)=>{
    //创建sql语句
    var sql="select * from banner"
    //发送sql并且结果返回脚手架
    pool.query(sql,(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})

//获取views中的所有数据
server.get("/views",(req,res)=>{
    //创建sql语句
    var sql="select * from views"
    //发送sql并且结果返回脚手架
    pool.query(sql,(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})
//获取views中的单个数据
server.get("/view",(req,res)=>{
    //创建sql语句
    var sql="select * from views where vid=?"
    //发送sql并且结果返回脚手架
    pool.query(sql,[req.query.vid],(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})

//获取path中的图片
server.get("/pathImg",(req,res)=>{
    //创建sql语句
    var sql="select pic from path"
    //发送sql并且结果返回脚手架
    pool.query(sql,(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})


//添加收藏数据
server.get("/addCollect",(req,res)=>{

    //创建sql语句
    var sql="INSERT INTO collect VALUES(null,?,?,?)";
    //发送sql并且结果返回脚手架
    pool.query(sql,[req.query.vid,req.query.count,req.query.selected],(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,Msg:"收藏数据插入成功"});
        };
        
    })
})
//删除收藏数据
server.get("/delCollect",(req,res)=>{
    //创建sql语句
    var sql="delete from collect where vid=?"
    //发送sql并且结果返回脚手架
    pool.query(sql,[req.query.vid],(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,Msg:"删除收藏数据成功"});
        };
        
    })
})
//获取收藏数据
server.get("/getCollect",(req,res)=>{
    //创建sql语句
    var sql="select * from collect"
    //发送sql并且结果返回脚手架
    pool.query(sql,[req.query.vid],(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})
// 根据collect中存储的vid去查找views表中的数据
server.get("/getViews",(req,res)=>{
    //创建sql语句
    var sql="select vid,title,img from views where vid=?"
    //发送sql并且结果返回脚手架
    pool.query(sql,[req.query.vid],(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})
//查询Collect表中的selected的状态
server.get("/getSelected",(req,res)=>{
    //创建sql语句
    var sql="select selected from collect where vid=?"
    //发送sql并且结果返回脚手架
    pool.query(sql,[req.query.vid],(err,result)=>{
        if(err){
            throw err;
        }else{
            res.send({code:1,data:result});
        };
        
    })
})



//登陆
server.get("/login",(req,res)=>{
    //1:获取参数 uname upwd
   var uname=req.query.uname;
   var upwd=req.query.upwd;
   console.log(uname,upwd);
     //2:创建sql
   var sql="select bid from user where uname=? and upwd=?";
   //3:发送sql并且结果返回脚手架
   pool.query(sql,[uname,upwd],(err,result)=>{
       //4:如果发生严重错误抛出
       if(err) throw err;
       //5:登录成功用户名密码有错
       if(result.length==0){
           res.send({code:-1,msg:"用户名或密码错误"});
       }else{
       //获取当前登录用户的lid,并保存到session对象中
       req.session.bid=result[0].bid;
       console.log(result[0].bid);
       res.send({code:1,msg:"登陆成功"})    
       }
   })
})

//用户注册
server.get("/reg",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var phone=req.query.phone;
    var i='http://localhost:4000/panda.png';
    var v=req.query.vid;
    var c=req.query.count;
    console.log(uname);
    var sql="INSERT INTO user VALUES(NULL,?,?,?,?,?,?)";
    pool.query(sql,[uname,upwd,phone,i,v,c],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
    res.send({code:1,msg:"注册成功!"});
    }else{
    res.send({code:-1,msg:"注册失败!"})
    }
    })
    })
    //判断用户名是否存在
    server.get("/ver",(req,res)=>{
    var uname=req.query.uname;
    console.log(uname);
    var sql="select * from user where uname = ?";
    pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    console.log(result)
    if(result.length>0){
    res.send({code:-1,msg:"该用户名已存在!"})
    }else{
    res.send({code:1})
    }
    })
    })

    //查询用户session数据
    server.get("/session",(req,res)=>{
        //2:获取当前登录用户uid
        var uid = req.session.bid;
        //3:如果用户没登录返回错误信息
        //  并且返回此函数
        if(!uid){
            res.send({code:-1,msg:"请登录"});
            return;
        }else{
            res.send({code:1,msg:"已登录"});
            return;
        }
    })



    //根据用户vid查询某个用户数据
    server.get("/getperson",(req,res)=>{
    var vid=req.session.bid;
    console.log(vid);
    var sql="select * from user where bid=?";
    pool.query(sql,[vid],(err,result)=>{
    if(err)
    { 
    throw err;
    }else{
    res.send({code:1,data:result})
    }
    })
    })
    //根据用户搜索去search表中模糊查找title中带有模糊词的所有信息
    server.get("/search",(req,res)=>{
        var title=req.query.title;
        var sql=`select * from search where title like '%${title}%'`;
        pool.query(sql,(err,result)=>{
        if(err)
        { 
        throw err;
        }else{
        res.send({code:1,data:result})
        }
        })
        })



    //顾玉萍
        //滚动列表
server.get("/serv",(req,res)=>{
    //2:创建sql
    var sql ="select title,simg from travel_serv";
    pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length==0){
    res.send({code:-1,msg:"查询失败!"})
    }else{
    res.send(result) 
    }
    })
    })

    //韩

    //图片上传和留言
server.get("/addissue", (req,res) => { 
    //    var uid = req.session.uid;
    //   if (!uid) {
    //     res.send({ code: -2, msg: "请登录" });
    //     return;
    //   }
       var imgurl=req.query.imgurl;
       // var comment=req.query.comment;
       var sql = "update user set imgurl=? where bid=1";
       pool.query(sql, [imgurl], (err, result) => {
         if (err) throw err;
         res.send({ code: 1, msg: "添加成功", data: result })
       })
     })
    // 去处
     server.get("/go",(req,res)=>{
       var sql="select * from whither"
       pool.query(sql,(err,result)=>{
          if(err){
              throw err;
          }else{
              res.send({code:1,data:result});
          };
          
      })
    })

    // 获取路线图片
    server.get("/items",(req,res)=>{
       //创建sql语句
       var sql="select * from course"
       //发送sql并且结果返回脚手架
       pool.query(sql,(err,result)=>{
           if(err){
               throw err;
           }else{
               res.send({code:1,data:result});
           };
           
       })
    })
    // 获取路线地图图片
    server.get("/item",(req,res)=>{
       var id=req.query.id;
       //创建sql语句
       var sql="select img2 from course where id=?"
       //发送sql并且结果返回脚手架
       pool.query(sql,[id],(err,result)=>{
           if(err){
               throw err;
           }else{
               res.send({code:1,data:result});
           };
           
       })
    })
    // 获取游客
    server.get("/youke",(req,res)=>{
        
        //创建sql语句
        var sql="select * from youke"
        //发送sql并且结果返回脚手架
        pool.query(sql,(err,result)=>{
            if(err){
                throw err;
            }else{
                res.send({code:1,data:result});
            };
            
        })
     })
     // 获取城事
    server.get("/chengshi",(req,res)=>{
        //创建sql语句
        var sql="select * from chengshi"
        //发送sql并且结果返回脚手架
        pool.query(sql,(err,result)=>{
            if(err){
                throw err;
            }else{
                res.send({code:1,data:result});
            };
            
        })
    })

    // 明岳
    server.get("/update",(req,res)=>{
        //1:获取参数 uname upwd
        var n = req.query.uname;
        var p =req.query.phone;
        var u=req.query.upwd
        //2:创建sql
        
        var sql =" UPDATE user SET upwd=? WHERE uname=? AND phone=?";
        
        //3:发送sql并且结果返回脚手架
        pool.query(sql,[u,n,p],(err,result)=>{
           //4:如果发生严重错误抛出
           if(err)throw err;
          
           if(result.affectedRows>0){
             res.send({code:1,msg:"修改成功"})
           }else{
             res.send({code:-1,msg:"此用户不存在"})  
           }
        })
      })