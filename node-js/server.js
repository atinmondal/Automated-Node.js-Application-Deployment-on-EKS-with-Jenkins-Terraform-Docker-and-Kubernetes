const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 8000 ;

//public static path
const static_path = path.join(__dirname, "./public");
const views_path = path.join(__dirname, "./views");


app.set('view engine', 'hbs');
app.set('views', views_path);

app.use(express.static(static_path));

//routing
app.get("/", (req, res) => {
    res.render('login')
})

app.listen(port, () => {
    console.log(`listening to the port at ${port}`)
})