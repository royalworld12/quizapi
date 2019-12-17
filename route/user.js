const express = require(`express`)
const router  = express()

const UserController = require(`../controller/UserController`)

router.get(`/test` , (req,res,next) => {
    console.log(`testing`)
    res.send(`Testing`)
})

router.post(`/registration`, UserController.userRegistration)
router.post(`/login`       , UserController.userLogin)
router.get(`/allusers`     , UserController.allUsers)
router.get(`/getuser/:id`  , UserController.getUser)

module.exports = router