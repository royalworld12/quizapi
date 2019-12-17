const express = require(`express`)
const router  = express()

const QuestionController = require(`../controller/QuestionController`)

router.get(`/test` , (req,res,next) => {
    console.log(`testing`)
    res.send(`Testing`)
})

router.post(`/createQuiz`     , QuestionController.createQuiz)
router.post(`/updateQuiz`     , QuestionController.UpdateQuiz)
router.post('/updateScore',QuestionController.UpdateScore)
router.get(`/getallquiz`      , QuestionController.getAllQuiz)
router.get(`/getallcategory`  , QuestionController.getAllCategory)
router.get(`/getquizbyid/:id` , QuestionController.getQuizById)

module.exports = router