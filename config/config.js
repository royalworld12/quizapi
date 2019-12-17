const mysql      = require(`mysql`)

const connection = mysql.createConnection({
    host     : `localhost`,
    user     : `root`,
    password : ``,
    database : `quizweb`
})

connection.connect((err) => {
    if(err){
        console.log(`Error While Connecting To Database`)
    }else{
        console.log(`Successfully connected to database`)
    }
})

module.exports = connection