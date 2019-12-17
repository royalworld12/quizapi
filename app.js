const express    = require(`express`)
const app        = express()
const userRoute  = require(`./route/user`)
const quizRoute  = require(`./route/quiz`)
const bodyParser = require(`body-parser`)
const cors       = require(`cors`)

app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended : false}))
app.use(`/user` , userRoute)
app.use(`/quiz` , quizRoute)

module.exports = app