const connection = require(`../config/config`)

module.exports = {
    createQuiz : (req,res,next) => {
        console.log(req.body)
        const quiz = {
            "category_id" : req.body.category_id,
            "ques"        : req.body.ques,
            "option 1"    : req.body.option1,
            "option 2"    : req.body.option1,
            "option 3"    : req.body.option1,
            "option 4"    : req.body.option1,
            "ans"         : req.body.ans,
            "createdby"   : req.body.userid
        }

        connection.query(`Insert into quiz SET ?`,quiz,(err,results,field) => {
            if(err) {
                res.json({
                    status : false,
                    message : `There are some error with query`
                })
            } else {
                res.json({
                    status  : true,
                    data    : results,
                    message : `question added successfully`
                })
            }
        })
    },

    UpdateQuiz : (req,res,next) => {
        console.log(req.body)
        
        const quiz = [
            req.body.category_id,
            req.body.ques,
            req.body.option1,
            req.body.option2,
            req.body.option3,
            req.body.option4,
            req.body.ans,
            req.body.userid,
            req.body.quesid
        ]

        connection.query('Update table quiz SET category_id = ?,ques = ?,`option 1`= ?,`option 2`= ?,`option 3`= ?,`option 4`= ?,`ans`= ?,modified_by = ? WHERE id = ',(err,results,field) => {
            if(err) {
                res.json({
                    status  : false,
                    message : `There are some error with query`
                })
            } else {
                res.json({
                    status  : true,
                    data    : results,
                    message : `question updated successfully`
                })
            }
        })
    },

    UpdateScore : function(req,res,next){
        console.log(req.body)
        
        var quiz = {
            
            "userid":req.body.userid,
            "score":req.body.score
        }

        connection.query('Insert into submittedans SET ?',quiz,function(err,results,field){
            if(err){
                res.json({
                    status : false,
                    message : 'There are some error with query'
                })
            }else{
                res.json({
                    status:true,
                    data:results,
                    message:'score updated successfully'
                })
            }
        })
    },

    getAllQuiz : (req,res,next) => {
        connection.query(`Select * from quiz WHERE  isaactive = "Y"`,(err,results,field) => {
            if(err) {
                res.json({
                    message : `Something went wrong while fetching in getAllQuiz`
                })
            } else {
                res.json({
                    status:true,
                    data:results
                    
                })
            }
        })
    },

    getAllCategory : (req,res,next) => {
        connection.query(`Select * from quizcategory WHERE  isactive = "Y"`,(err,results,field) => {
            if(err) {
                res.json({
                    message : `Something went wrong while fetching in getAllCategory`
                })
            } else {
                res.json({
                    status : true,
                    data   : results
                })
            }
        })
    },

    getQuizById : (req,res,next) => {
        connection.query(`Select * from quiz WHERE  category_id = ${req.params.id}`,(err,results,field) => {
            if(err) {
                res.json({
                    message : `Something went wrong while fetching in getquizbyid`
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