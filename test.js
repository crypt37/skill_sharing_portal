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
const {
    connect
} = require("mongoose");
const conn = require("bcrypt/promises");
const {
    promise
} = require("bcrypt/promises");
const async = require("async");
var MySQLStore = require('express-mysql-session')(session);

const hostname = '127.0.0.2';
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
        password: 'Mfy4mkV5sMfCZhW',

    }),
    resave: false,
    saveUninitialized: false,

    cookie: {
        maxAge: 1000 * 60 * 60 * 24,
        secure: false

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
    password: 'Mfy4mkV5sMfCZhW',
    multipleStatements: true
});
connection.connect((err) => {
    if (!err) {
        console.log("Connected");
    } else {
        console.log(err, "Conection Failed");
    }
});


const customFields = {
    usernameField: 'username',
    passwordField: 'password',
};


/*Passport JS*/
const verifyCallback = (username, password, done) => {

    connection.query('SELECT * FROM students WHERE  std_email= ? ', [username], function(error, results, fields) {
        if (error)
            return done(error);

        if (results.length == 0) {
            return done(null, false);
        }
        const isValid = validPassword(password, results[0].hash, results[0].salt);
        user = {
            id: results[0].sid,
            username: results[0].username,
            hash: results[0].hash,
            salt: results[0].salt
        };
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

    done(null, user.id)

});

passport.serializeUser((user, done) => {
    console.log("inside serialize");
    done(null, user.id)

});

passport.deserializeUser(function(userId, done) {
    console.log('deserializeUser' + userId);

    connection.query('SELECT * FROM students where sid = ?', [userId], function(error, results) {
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
    return {
        salt: salt,
        hash: genhash
    };
}


function isAuth(req, res, next) {
    if (req.isAuthenticated()) {
        next();
    } else {
        res.redirect('/notAuthorized');
    }
}



function userExists(req, res, next) {
    connection.query('Select * from students where std_email=? ', [req.body.email], function(error, results, fields) {
        if (error) {
            console.log(error, "user exists error");
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


app.get("/", function(req, res) {
    res.render("home");
});

app.get('/login', (req, res, next) => {
    res.render('login')
});
app.get("/logout", (req, res) => {
    req.logout(req.user, err => {
        if (err) return next(err);
        res.redirect("/");
    });
});

app.get("/delete", (req, res) => {
    console.log("delete user ", req.user.sid);
    connection.query(' delete  stu , skill_wish,skills  from  students as stu  left join skill_wish on stu.sid = skill_wish.sid left join skills on stu.sid=skills.sid where stu.sid =?', [req.user.sid],
        function(error, results, fields) {
            if (error) {
                console.log(error, "couldn't delete user ");
            } else {
                console.log("user deleted");
                req.logout(req.user, err => {
                    if (err) return next(err);
                    res.redirect("/");
                });
            }




        });

});


app.get('/login-success', (req, res, next) => {
    res.redirect('/data')
});

app.get('/login-failure', (req, res, next) => {
    res.send('<h1>wrong password or email is  not  registered  </h1>');
});


app.get('/register', (req, res, next) => {
    console.log("Inside get");
    res.render('register')

});




app.post('/register', userExists, (req, res, next) => {

    console.log(req.body);
    const username = req.body.email;
    const saltHash = genPassword(req.body.password);
    console.log(saltHash);
    const salt = saltHash.salt;
    const hash = saltHash.hash;
    const language_expert = req.body.expert;
    const lang_noob = req.body.noob;
    const language_intermediate = req.body.intermdiate;


    const image = req.body.image;
    let sid;


    connection.query('Insert into students(std_email,hash,salt,gender,std_name,std_image,std_about,age) values(?,?,?,?,?,?,?,?) ',
        [req.body.email, hash, salt, req.body.gender, req.body.username, req.body.image, req.body.About, req.body.age],
        function(error, results, fields) {
            if (error) {
                console.log(error);
                console.log("Error ga okumaishita desu ");
            } else {

                console.log("Successfully Entered into students column ");
            }

        });

    connection.query('Select * from students where std_email=? ', [req.body.email], function(error, results, fields) {
        if (error) {
            console.log("user  not found on sid search  ");
        } else if (results.length > 0) {
            sid = results[0].sid;
            console.log("inside sid ", sid);
        }
    });

    if (Array.isArray(language_expert)) {
        language_expert.forEach(function(lang) {
            insert_into(lang, 'Expert');
        });
    } else {
        insert_into(language_expert, 'Expert');
    }

    if (Array.isArray(language_intermediate)) {
        language_intermediate.forEach(function(lang) {
            insert_into(lang, 'Intermediate');
        });
    } else {
        insert_into(language_intermediate, 'Intermediate');
    }
    if (Array.isArray(lang_noob)) {
        lang_noob.forEach(function(noob) {
            insert_into(noob, "Beginner");

        });
    } else {
        insert_into(lang_noob, "Beginner");
    }



    function insert_into(lang_name, level) {
        connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function(error, results, fields) {
            if (error) {
                console.log("skill  not found on  references ");
            } else if (results.length > 0) {
                const ref_id = results[0].ref_id;
                console.log("ref id ", ref_id);
                connection.query('Insert into skills (sid,ref_id,skl_level) values (?,?,?)', [sid, ref_id, level], function(error, results, fields) {
                    if (error) {
                        console.log("Error  in skills ");
                        console.log(error);

                    } else {

                        console.log("Successfully Entered into skills ");
                    }
                });
            }
        });
    }

    if (Array.isArray(lang_noob)) {
        lang_noob.forEach(function(noob) {
            noob_insert(noob);

        });
    } else {
        noob_insert(lang_noob);
    }

    function noob_insert(lang_name) {
        connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function(error, results, fields) {
            if (error) {
                console.log(lang_name, "skill  not found on  references ");
            } else if (results.length > 0) {
                const ref_id = results[0].ref_id;
                console.log("ref id ", ref_id);
                console.log("inside sid ", sid);
                connection.query('Insert into skill_wish  (sid,skl_id) values (?,?)', [sid, ref_id, ], function(error, results, fields) {
                    if (error) {
                        console.log("Error  in skill_wish ");
                        console.log(error);
                    } else {
                        console.log("Successfully Entered into skills_wish");
                    }
                });
            }
        });

    }
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


app.post("/login", function(req, res) {
    const user = new User({
        username: req.body.username,
        password: req.body.password
    });

    req.login(user, function(error) {
        if (error) {
            res.redirect("/");
        } else {
            passport.authenticate('local')(req, res, function() {
                res.redirect("/data");
            });
        }

    })
});
app.get("/logout", function(req, res) {
    req.logout();
    res.redirect("/");
});


// app.listen(port, hostname, () => {
//     console.log(`Server running at http://${hostname}:${port}/`);
// });


app.listen(process.env.PORT ||5000, function () {
    console.log("listening");
});

app.post('/data', userExists, (req, res, next) => {
    console.log("inside data");
    console.log(req.body);
});
app.get("/data", isAuth, function(req, res) {
    console.log('inside data ');
    let results = [];

    connection.query('select distinct skl_name,skl_level  from (skills  join skill_wish on skills.sid = skill_wish.sid  ) join skill_reference on skills.ref_id=skill_reference.ref_id where skills.sid=?',
        [req.user.sid],
        function(error, result, fields) {
            results = result;
            console.log(results);

            res.render('data', {
                username: req.user.std_name,
                gender: req.user.gender,
                email: req.user.std_email,
                image: req.user.std_image,
                About: req.user.std_about,
                language: results,
                Age: req.user.age,


            });
            console.log("connection query ", results);
        });

    console.log("results", results);


});
app.get("/tin:title", isAuth, async function(req, res) {
    console.log("testing  tin  ");

    let langs = async function(level, sid) {
        console.log(level, sid);
        let str = "select  distinct skl_name  from skills join skill_reference sr on skills.ref_id = sr.ref_id where  skills.skl_level = " + level + " and  skills.sid = ?"
        return new Promise(function(resolve, reject) {
            connection.query(str, [sid],
                async function(error, results, fields) {
                    if (error) {
                        console.log("error in searching for languages", error);
                    } else {

                        var result = results.map(d => `'${d.skl_name}'`).join('or sr.skl_name=');

                        console.log("result in langs " + sid + result.skl_name);
                        resolve(result);
                    }

                })
        })
    }


    let lang_level, skill_name;
    let str;
    let sid = req.user.sid;
    console.log("req params ", req.params.title);
    if (req.params.title === ":Users") {
        str = "select * from students where students.sid!=?"
    } else if (req.params.title === ":Teachers") {

        // lang_level = "'expert' or skills.skl_level='Intermediate'";
        lang_level = "'Beginner'"
        skill_name = await langs(lang_level, sid);
        console.log("returned results ", skill_name);


        str = " select distinct students.std_name, students.sid, students.std_image, students.gender,students.age,students.std_about " +
            "from students inner join skills on students.sid=skills.sid " +
            "inner  join skill_wish  on students.sid = skill_wish.sid " +
            "inner join skill_reference sr on skills.ref_id = sr.ref_id " +
            "where students.sid != ? " +
            "and   skills.skl_level != 'Beginner ' " +
            "and  ( sr.skl_name =" + skill_name + ")";

    } else if (req.params.title === ":Learners")
    {
        lang_level = "'expert' or skills.skl_level='Intermediate'";
        skill_name = await langs(lang_level, sid);
        console.log("returned results ", skill_name);


        str = " select unique students.std_name, students.sid, students.std_image, students.gender,students.age,students.std_about " +
            "from students inner join skills on students.sid=skills.sid " +
            "inner  join skill_wish  on students.sid = skill_wish.sid " +
            "inner join skill_reference sr on skills.ref_id = sr.ref_id " +
            "where students.sid != ? " +
            "and  ( skills.skl_level = 'Beginner' or skills.skl_level='Intermediate' )" +
            "and  ( sr.skl_name =" + skill_name + ")";

    }




    console.log("requested by ", req.user);
    connection.query(str,
        [sid], async function(error, results, fields) {
            if (error) {
                console.log("no any users found   ", error);
            }
            else if (results.length > 0) {


                let lang_namesee = async function(object) {
                    return new Promise(function(resolve, reject) {
                        console.log(object);
                        connection.query('select skl_name , skl_level from skill_reference join skills on skills.ref_id = skill_reference.ref_id where sid=?', [object],
                            function(err, rows) {
                                if (error) {
                                    console.log(object, err, "query error ");
                                } else if (rows === undefined) {
                                    reject(new Error("Error rows is undefined"));
                                } else {
                                    resolve(rows);

                                }
                            }
                        )
                    });

                };
                for (object of results) {
                    object.language = [];

                    let language = await
                        lang_namesee(object.sid);

                    if (language.length) {
                        language.forEach(function(lang) {
                            console.log(lang);
                            object.language.push(lang);
                        })
                    }

                }
            }
            console.log("the final results are ", results);
            res.render('tin', {
                user_info: results,
                sid: req.user.sid

            });


        });
});