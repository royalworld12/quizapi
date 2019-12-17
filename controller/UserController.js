const connection = require(`../config/config`)
const crypto     = require(`crypto`)

module.exports = {

    userRegistration : (req,res,next) => {
        
        const hashedpassword = crypto.createHash(`sha256`).update((req.body.password).trim()).digest(`hex`)
        const users = {
            "name"     : req.body.name,
            "email"    : req.body.email,
            "password" : hashedpassword,
            "isadmin"  : req.body.isadmin
        }

        connection.query(`Insert into users SET ?`,users,(err,results,field) => {
            if(err) {
                res.json({
                    status  : false,
                    message : `There are some error with query`
                })
            } else {
                res.json({
                    status  :true,
                    data    :results,
                    message :`user registered sucessfully`
                })
            }
        })
    },

    userLogin : (req,res,next) => {
       
        const email          = req.body.email
        const password       = (req.body.password).trim()
        const hashedpassword = crypto.createHash(`sha256`).update(password).digest(`hex`)
        console.log(email,hashedpassword)
        connection.query(`Select id,email,name,isadmin from users WHERE email = '${email}' AND password = '${hashedpassword}' AND isactive = "Y"`,(err,results,field) => {
            if(err) {
                res.json({
                    status : false,
                    message : `Something went wrong while fetching in login`
                })
            } else {
                
                if(results.length > 0){
                    res.json({
                        status : true,
                        data   : results
                        
                    })
                }else{
                    res.json({
                        status : false,
                        message : `Please enter proper login credentials`
                    })
                }
               
            }
        })
    },

    allUsers : (req,res,next) => {
        connection.query(`SELECT userid,name,email,score FROM users INNER JOIN submittedans ON users.id = submittedans.userid 
        WHERE users.isadmin = "N" `,(err,results,field) => {
            if(err) {
                res.json({
                    message : `Something went wrong while fetching in login`
                })
            } else {
                res.json({
                    status : true,
                    data   : results 
                })
            }
        })
    },

    getUser : (req,res,next) => {
        connection.query(`Select id,name,email,isadmin from users WHERE  id = ${req.params.id}`,(err,results,field) => {
            if(err) {
                res.json({
                    message : `Something went wrong while fetching in login`
                })
            } else {
                res.json({
                    status : true,
                    data   : results
                })
            }
        })
    }
}