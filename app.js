const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const express = require('express');
const app = express();
app.set('view engine', 'ejs');
app.engine('ejs', require('ejs').__express);
const bodyParser = require("body-parser");
const mysql = require('mysql');
const crypto = require('crypto');
var session = require('express-session');
const {connect} = require("mongoose");
var MySQLStore = require('express-mysql-session')(session);

const hostname = '127.0.0.60';
const port = 2000;
/*Mysql Express Session*/

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: new MySQLStore({
        host: "db4free.net",
        user: "nekodesu",
        port:3306,
        database: "skill_sharing_po",
        password: 'FYLRyCaDkUwDR54'

    }),
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 1000 * 60 * 60 * 24,

    }
}));

app.use(passport.initialize());
app.use(passport.session());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(express.static('public'));
app.set("view engine", "ejs");


/*Mysql Connection*/

var connection = mysql.createConnection({
    host: "db4free.net",
    user: "nekodesu",
    port:3306,
    database: "skill_sharing_po",
    password: 'FYLRyCaDkUwDR54',
    multipleStatements:true
});
connection.connect((err) => {
    if (!err) {
        console.log("Connected");
    } else {
        console.log("Conection Failed");
    }
});


const customFields = {
    usernameField: 'username',
    passwordField: 'password',
};


/*Passport JS*/
const verifyCallback = (username, password, done) => {

    connection.query('SELECT * FROM students WHERE std_email = ? ', [username], function (error, results, fields) {
        if (error)
            return done(error);

        if (results.length == 0) {
            return done(null, false);
        }
        const isValid = validPassword(password, results[0].hash, results[0].salt);
        user = {id: results[0].sid, username: results[0].username, hash: results[0].hash, salt: results[0].salt};
        if (isValid) {
            return done(null, user);
        } else {
            return done(null, false);
        }
    });
}

const strategy = new LocalStrategy(customFields, verifyCallback);
passport.use(strategy);


passport.serializeUser((user, done) => {
    console.log("inside serialize");
    console.log(user);
    done(null, user.id)

});

passport.serializeUser((user, done) => {
    console.log("inside serialize");
    console.log(user);
    done(null, user.id)

});

passport.deserializeUser(function (userId, done) {
    console.log('deserializeUser' + userId);

    connection.query('SELECT * FROM students where sid = ?', [userId], function (error, results) {
        if (error) {

            console.log("search error ");
        } else {

            done(null, results[0]);
        }


    });
});

/*middleware*/
function validPassword(password, hash, salt) {
    var hashVerify = crypto.pbkdf2Sync(password, salt, 10000, 60, 'sha512').toString('hex');
    return hash === hashVerify;
}

function genPassword(password) {
    var salt = crypto.randomBytes(32).toString('hex');
    var genhash = crypto.pbkdf2Sync(password, salt, 10000, 60, 'sha512').toString('hex');
    return {salt: salt, hash: genhash};
}


function isAuth(req, res, next) {
    if (req.isAuthenticated()) {
        next();
    } else {
        res.redirect('/notAuthorized');
    }
}


function userExists(req, res, next) {
    connection.query('Select * from students where std_email=? ', [req.body.email], function (error, results, fields) {
        if (error) {
            console.log("user exists error");
        } else if (results.length > 0) {
            res.redirect('/userAlreadyExists')
        } else {
            next();
        }

    });
}


app.use((req, res, next) => {

    console.log(req.session);
    console.log(req.user);
    next();
});


/*routes*/
app.get("/", function (req, res) {
    res.render("home");
});

app.get('/login', (req, res, next) => {
    res.render('login')
});
app.get('/logout', (req, res, next) => {
    req.logout(); //delets the user from the session
    res.redirect('/protected-route');
});
app.get('/login-success', (req, res, next) => {
    res.redirect('/data')
});

app.get('/login-failure', (req, res, next) => {
    res.send('You entered the wrong password.');
});


app.get('/register', (req, res, next) => {
    console.log("Inside get");
    res.render('register')

});




app.post('/register', userExists, (req, res, next) => {



    console.log(req.body.expert);
    console.log(req.body);
    const username = req.body.email;
    const saltHash = genPassword(req.body.password);
    console.log(saltHash);
    const salt = saltHash.salt;
    const hash = saltHash.hash;
    const language_expert = req.body.expert;
    const lang_noob= req.body.noob;
    const   lang_intermediate= req.body.intermediate;
    const image = req.body.image;


    connection.query('Insert into students(std_email,hash,salt,gender,std_name,std_image) values(?,?,?,?,?,?) ',
        [req.body.email, hash, salt,req.body.gender,req.body.username,req.body.image], function (error, results, fields) {
        if (error) {
            console.log(error);
            console.log("Error ga okumaishita desu ");
        } else {

            console.log("Successfully Entered");
        }

    });

    connection.query('Select * from students where std_email=? ', [req.body.email], function (error, results, fields)
    {
        if (error) {
            console.log("user  not found on sid search  ");
        } else if (results.length > 0)
        {
            const sid=results[0].sid;
            console.log("inside sid " , sid);


                language_expert.forEach(function (lang_name)
                    {
                    const  skill_level='expert';


                                        connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function (error, results, fields) {
                                      if (error)
                                      {
                                            console.log("skill  not found on  references ");
                                        }
                                              else if (results.length > 0)
                                            {
                                                const ref_id = results[0].ref_id;
                                                console.log("ref id ",ref_id);
                                                  connection.query('Insert into skills (sid,ref_id,skl_level) values (?,?,?)', [sid, ref_id, skill_level], function (error, results, fields) {
                                                      if (error) {
                                                          console.log("Error  in skills ");
                                                          console.log(error);

                                                      } else {

                                                          console.log("Successfully Entered into skills ");
                                                      }
                                                  });
                                            }
                                    });



                    });
            lang_noob.forEach(function (lang_name)
            {
                const  skill_level='noob';


                connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function (error, results, fields) {
                    if (error)
                    {
                        console.log("skill  not found on  references ");
                    }
                    else if (results.length > 0)
                    {
                        const ref_id = results[0].ref_id;
                        console.log("ref id ",ref_id);
                        connection.query('Insert into skill_wish  (sid,skl_id) values (?,?)', [sid, ref_id,], function (error, results, fields) {
                            if (error) {
                                console.log("Error  in skill_wish ");
                                console.log(error);

                            } else {

                                console.log("Successfully Entered into skills_wish");
                            }
                        });
                    }
                });



            });



        }
    });





    res.redirect('/login');
});

app.post('/login', passport.authenticate('local', {
    failureRedirect: '/login-failure',
    successRedirect: '/login-success'
}));


app.get('/notAuthorized', (req, res, next) => {
    console.log("Inside get");
    res.send('<h1>You are not authorized to view the resource </h1><p><a href="/login">Retry Login</a></p>');

});

app.get('/userAlreadyExists', (req, res, next) => {
    console.log("Inside get");
    res.send('<h1>Sorry This email  is taken </h1><p><a href="/register">Register with different  email </a></p>');

});


app.post("/login", function (req, res) {
    const user = new User({
        username: req.body.username,
        password: req.body.password
    });

    req.login(user, function (error) {
        if (error) {
            res.redirect("/");
        } else {
            passport.authenticate('local')(req, res, function () {
                res.redirect("/data");
            });
        }

    })
});
app.get("/logout", function (req, res) {
    req.logout();
    res.redirect("/");
});


// app.listen(port, hostname, () => {
//     console.log(`Server running at http://${hostname}:${port}/`);
// });


app.listen(process.env.PORT ||3489, function () {
    console.log("listening");
});

app.post('/data', userExists, (req, res, next) => {
    console.log("inside data");
    console.log(req.body);


});
app.get("/data", function (req, res) {
    console.log('inside data ');
    console.log(req.user);

    res.render('data', {
        username: req.user.std_name,
        gender: req.user.gender,
        name: req.user.std_email,
        image : req.user.std_image

    });

});
app.get("/tin", function (req, res) {
    console.log("testing  tin  ");
    connection.query('Select * from students where std_email!=? ', [req.user.std_email], function (error, results, fields)
    {
        if (error) {
            console.log("no any users found   ");
        } else if (results.length > 0) {
            console.log(results);
            res.render('tin', {
             user_info:results
            });
        }
});





});
