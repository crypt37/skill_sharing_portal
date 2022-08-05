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
const {errors} = require("passport-local-mongoose");
var MySQLStore = require('express-mysql-session')(session);

const hostname = '127.0.0.124';
const port = 2000;
/*Mysql Express Session*/

// app.use(session({
//     key: 'session_cookie_name',
//     secret: 'session_cookie_secret',
//     store: new MySQLStore({
//         host: "localhost",
//         user: "nekodesu",
//         port:3306,
//         database: "skill_sharing_portal",
//         password: '123',
//
//     }),
//     resave: false,
//     saveUninitialized: false,
//
//     cookie: {
//         maxAge: 1000 * 60 * 60 * 24,
//         secure: false
//
//     }
// }));



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



// var connection = mysql.createConnection({
//     host: "localhost",
//     user: "nekodesu",
//     port:3306,
//     database: "skill_sharing_portal",
//     password: '123',
//     multipleStatements: true
// });


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

    connection.query('SELECT * FROM students WHERE  std_email= ? ', [username], function(error, results) {
        if (error)
            return done(error);

        if (results.length ===0) {
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

       done(null,results[0]);
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

    let flag = false ;
    connection.query('Select * from students where std_email=? ', [req.body.email], function(error, results) {
        if (error) {
            console.log(error, "user exists error");
        } else if (results.length > 0) {
            console.log("inside user already exists ");
            res.redirect('/userAlreadyExists');
        } else
        {
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

app.get('/login', (req, res) => {
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
        function(error) {
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


app.get('/login-success', (req, res) => {
    res.redirect('/data')
});

app.get('/login-failure', (req, res) => {
    res.send('<h1>wrong password or email is  not  registered  </h1>');
});

app.get('/register', async (req, res) => {
    console.log("Inside get");
    res.render('register');
})






app.get('/change', async (req, res) => {
    console.log("Inside change  get");

    let sid=req.user.sid


    let lang = async function (object) {
        return new Promise(function (resolve, reject) {
            connection.query('select distinct  skl_name , skl_level from skills inner  join skill_reference sr on skills.ref_id = sr.ref_id   where  sid=?',
                [object],
                async function (error, results, fields) {
                    if (error) {
                        console.log("error in searching for languages", error);
                    } else {
                        console.log("result in langs " + object + results);
                        resolve(results);
                    }
                })
        })

    }
    let    results = await lang(sid);


    let person = async function (object) {
        return new Promise(function (resolve, reject) {
            connection.query('select  std_name , std_about,std_email, std_image,age,  gender from students  where  sid=?',
                [object],
                async function (error, results, fields) {
                    if (error) {
                        console.log("error in searching for languages", error);
                    } else {
                        console.log("result in langs " + object + results);
                        resolve(results);
                    }
                })
        })

    }
    personal_info = await person(sid);

    if (results[0] === undefined) {
        res.redirect('/data');


    } else {

        console.log("ther results are ", results[0]);
        res.render('change', {
            username: personal_info[0].std_name,
            gender: personal_info[0].gender,
            email: personal_info[0].std_email,
            image: personal_info[0].std_image,
            About: personal_info[0].std_about,
            language: results,
            Age: personal_info[0].age,
        });
    }

})











app.post('/change' ,(req, res) =>
{
    console.log(req.body);
    const saltHash = genPassword(req.body.password);
    console.log(saltHash);
    const salt = saltHash.salt;
    const hash = saltHash.hash;
    const language_expert = req.body.expert;
    const lang_noob = req.body.noob;
    const language_intermediate = req.body.intermdiate;


    let sid;

connection.query('SET FOREIGN_KEY_CHECKS=0'),function (error ) {

    if (error) {
            res.sendStatus(404);

        }

    }


        connection.query('  replace into students(sid,std_email,hash,salt,gender,std_name,std_image,std_about,age) values(?,?,?,?,?,?,?,?,?) ',
        [req.user.sid,req.body.email, hash, salt, req.body.gender, req.body.username, req.body.image, req.body.About, req.body.age],
        function (error) {
            if (error) {
                console.log(error);
                console.log("Error ga okumaishita desu ");
            } else {
                console.log("Successfully Entered into students column ");
            }

        })



    connection.query('Select * from students where std_email=? ', [req.body.email], function (error, results) {
        if (error) {
            console.log("user  not found on sid search  ");
        } else if (results.length > 0) {
            sid = results[0].sid;
            console.log("inside sid ", sid);
        }
    });

    if (Array.isArray(language_expert)) {
        language_expert.forEach(function (lang) {
            insert_into(lang, 'Expert');
        });
    } else {
        insert_into(language_expert, 'Expert');
    }

    if (Array.isArray(language_intermediate)) {
        language_intermediate.forEach(function (lang) {
            insert_into(lang, 'Intermediate');
        });
    } else {
        insert_into(language_intermediate, 'Intermediate');
    }
    if (Array.isArray(lang_noob)) {
        lang_noob.forEach(function (noob) {
            insert_into(noob, "Beginner");

        });
    } else {
        insert_into(lang_noob, "Beginner");
    }


    function insert_into(lang_name, level) {
        connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function (error, results) {
            if (error) {
                console.log("skill  not found on  references ");
            } else if (results.length > 0) {
                const ref_id = results[0].ref_id;
                console.log("ref id ", ref_id);
                connection.query('replace into skills (sid,ref_id,skl_level) values (?,?,?)', [sid, ref_id, level], function (error, results, fields) {
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
        lang_noob.forEach(function (noob) {
            noob_insert(noob);

        });
    } else {
        noob_insert(lang_noob);
    }

    function noob_insert(lang_name) {
        connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function (error, results, fields) {
            if (error) {
                console.log(lang_name, "skill  not found on  references ");
            } else if (results.length > 0) {
                const ref_id = results[0].ref_id;
                console.log("ref id ", ref_id);
                console.log("inside sid ", sid);
                connection.query('replace into skill_wish  (sid,ref_id) values (?,?)', [sid, ref_id,], function (error, results, fields) {
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




app.post('/register', userExists, (req, res) => {

    console.log("inside register ", req.params.title)



    console.log(req.body);
    const saltHash = genPassword(req.body.password);
    console.log(saltHash);
    const salt = saltHash.salt;
    const hash = saltHash.hash;
    const language_expert = req.body.expert;
    const lang_noob = req.body.noob;
    const language_intermediate = req.body.intermdiate;


    let sid;


    connection.query('replace into students(std_email,hash,salt,gender,std_name,std_image,std_about,age) values(?,?,?,?,?,?,?,?) ',
        [req.body.email, hash, salt, req.body.gender, req.body.username, req.body.image, req.body.About, req.body.age],
        function(error) {
            if (error) {
                console.log(error);
                console.log("Error ga okumaishita desu ");
            } else {

                console.log("Successfully Entered into students column ");
            }

        });

    connection.query('Select * from students where std_email=? ', [req.body.email], function(error, results) {
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
        connection.query('Select * from skill_reference  where skl_name=? ', [lang_name], function(error, results) {
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
                connection.query('Insert into skill_wish  (sid,ref_id) values (?,?)', [sid, ref_id, ], function(error, results, fields) {
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

app.get('/no_workshop', (req, res, next) => {
    console.log("Inside  no workshop ");
    res.send('<h1>Sorry but no  teacher has assigned you to any of their workshops  </h1><p><a href="/tin:Users">find other users to learn with  </a></p>');

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

app.listen(process.env.PORT ||2000, function () {
    console.log(`Server running at http://${hostname}:${port}/`);
});


// var server_port = process.env.YOUR_PORT || process.env.PORT || 80;
// var server_host = process.env.YOUR_HOST || '0.0.0.0';
// server.listen(server_port, server_host, function() {
//     console.log('Listening on port %d', server_port);
// });

app.post('/data', userExists, (req, res, next) => {
    console.log("inside data");
    console.log(req.body);
});
app.get("/data", isAuth, async function (req, res)
{
    console.log('inside data ');
    let results = [],personal_info=[];
    let sid = req.user.sid;
    console.log("params", req.query);

    if (req.query.sid)
    {
        console.log("inside req sid ", req.query.sid)
        sid = req.query.sid;
    }




    let lang = async function (object)
    {
        return new Promise(function (resolve, reject)
        {
            connection.query('select distinct  skl_name , skl_level from skills inner  join skill_reference sr on skills.ref_id = sr.ref_id   where  sid=?',
                [object],
                async function (error, results, fields)
                {
                    if (error) {
                        console.log("error in searching for languages", error);
                    } else {
                        console.log("result in langs " + object + results);
                        resolve(results);
                    }
                })
        })

    }
    results = await lang(sid);
    let person = async function (object)
    {
        return new Promise(function (resolve, reject)
        {
            connection.query('select  std_name , std_about,std_email, std_image,age,  gender from students  where  sid=?',
                [object],
                async function (error, results, fields)
                {
                    if (error) {
                        console.log("error in searching for languages", error);
                    } else {
                        console.log("result in langs " + object + results);
                        resolve(results);
                    }
                })
        })

    }
    personal_info = await person(sid);

    if (results[0]===undefined)
    {
        res.redirect('/data');


    }
    else {

        console.log( "ther results are " , results[0]);
        res.render('data', {
            username: personal_info[0].std_name,
            gender: personal_info[0].gender,
            email: personal_info[0].std_email,
            image: personal_info[0].std_image,
            About: personal_info[0].std_about,
            language: results ,
            Age: personal_info[0].age,
        });
    }





});

app.get("/disliked_all" , isAuth , async  function (req,res){
    res.send('<h1> you seem to have disliked all  users :( good luck finding someone you little shit </h1><img src="https://i.kym-cdn.com/entries/icons/mobile/000/035/155/Screen_Shot_2020-09-03_at_1.37.58_PM.jpg" >  <p><a href="/login">Retry Login with new a  brain </a></p>');

})

app.get("/tin:title", isAuth, async function(req, res)
{


    let requesting_sid = req.query.sid;
    console.log("testing  tin  ");
    if (requesting_sid === 'undefined')
    {
        console.log('found undefinite');
        requesting_sid=0;
    }

    let langs = async function(level, sid)
    {
        console.log(level, sid);
        let str = "select  distinct skl_name  from skills join skill_reference sr on skills.ref_id = sr.ref_id     where skills.sid = ? and (  skills.skl_level = " + level + " )  "
        return new Promise(function(resolve, reject) {
            connection.query(str, [sid],
                async function(error, results, fields) {
                    if (error) {
                        console.log("error in searching for languages", error);
                    } else {
                        var result = results.map(d => `'${d.skl_name}'`).join('or skl_name=');
                        console.log("result in langs " + sid + result.skl_name);
                        resolve(result);
                    }
                })
        })
    }
    let lang_level, skill_name='';
    let str;
    let sid = req.user.sid;
    console.log("req params ", req.params);
    if (req.params.title === ":Users")
    {
        str = "select * from students where students.sid!=?  and sid not in  ( select sid_opponent from likes where sid_user = "+ req.user.sid + "  and state = 0 )  limit   10 "
    }
    else if (req.params.title === ":Teachers")
    {
        lang_level = "'Beginner'"
        skill_name = await langs(lang_level, sid);
        console.log("returned results ", skill_name);
        if (!skill_name ) return res.status(400).send('<h1>Sorry  you do not  have any skills   </h1><p><a href="/register"> resiter with some new learned skills  </a></p>');


        str = " select distinct * from student_data " +
            "where sid != ?  and sid not in  ( select sid_opponent from likes where sid_user = "+ req.user.sid + "  and state = 0 )"+
            "and   skl_level != 'Beginner ' " +
            "and  ( skl_name =" + skill_name + ")" + " LIMIT 10"  ;

    } else if (req.params.title === ":Learners")
    {
        lang_level = "'expert'";
        skill_name = await langs(lang_level, sid);
        console.log("returned results ", skill_name);
        if (!skill_name ) return res.status(400).send('<h1>Sorry  you do not  have any skills   </h1><p><a href="/register"> resiter with some new learned skills  </a></p>');

        str = " select distinct * from student_data " +
            " where sid != ?  and students.sid not in  ( select sid_opponent from likes where sid_user = "+ req.user.sid + "  and state = 0 )"+
            " and  ( skl_level = 'Beginner'  )" +
            " and  ( skl_name =" + skill_name + ")" + " LIMIT 10"  ;

    }
    else if ( req.params.title === ":MoreUsers")
    {
        sid = req.query.sid;

        str = "select * from students where (students.sid > ? and students.sid != " +req.user.sid+ " ) and sid not in  ( select sid_opponent from likes where sid_user = "+ req.user.sid + "  and state = 0 )  limit 10 "

        console.log("inputin in likes ");
        let obj = JSON.parse(req.query.val);
        obj.forEach(function (object) {
            let query ="replace into likes (sid_user, state, sid_opponent) values  ( " + req.user.sid + ", " + object.flag + "," + object.value + " )" ;
            connection.query(query
                ,
                function (error) {
                    if (error) {

                        console.log("Error in inputing preferences",error);
                    } else {

                        console.log(req.user.sid, object.flag,object.value);
                    }
                });
        });


    }
    else if ( req.params.title === ":NoMoreUsers")
    {
        sid = req.query.sid;

        str = "select * from students where (students.sid > ? and students.sid != " +req.user.sid+ " ) and sid not in  ( select sid_opponent from likes where sid_user = "+ req.user.sid + "  and state = 0 )  limit 10 "

        console.log("inputin in likes ");
        let obj = JSON.parse(req.query.val);
        obj.forEach(function (object) {
            let query ="replace into likes (sid_user, state, sid_opponent) values  ( " + req.user.sid + ", " + object.flag + "," + object.value + " )" ;
            connection.query(query
                ,
                function (error) {
                    if (error) {

                        console.log("Error in inputing preferences",error);
                    } else {

                        console.log(req.user.sid, object.flag,object.value);
                    }
                });
        });

        res.redirect('data');


    }





    else if (req.params.title===':Matches')
    {

        str=  "select  * from students where sid  in  (select  sid_opponent from likes where " +
            "sid_user = ?   and sid_opponent in (select distinct  sid_user from likes where sid_opponent = " + req.user.sid+")" +
            " and state = 1) limit 10  "


    }
    else
    {

        let language=req.params.title;
        console.log(language);
        let lang = "'"+ language.substring(1,language.length) +"'";

        str = " select distinct students.std_name, students.sid, students.std_image, students.gender,students.age,students.std_about " +
            "from students inner join skills on students.sid=skills.sid " +
            "inner  join skill_wish  on students.sid = skill_wish.sid " +
            "inner join skill_reference sr on skills.ref_id = sr.ref_id " +
            "where students.sid != ?  and students.sid not in  ( select sid_opponent from likes where sid_user = "+ req.user.sid + "  and state = 0 )"+
            "and  ( skills.skl_level = 'Beginner'  )" +
            "and ( sr.skl_name = "  + lang + ")  LIMIT 10"  ;



    }

    console.log("requested by ", req.user.sid);
    connection.query(str,
        [sid], async function(error, results, fields) {
            if (error) {
                console.log("no any users found   ", error);
            }
            else if (results.length > 0) {
                let lang_namesee = async function(object) {
                    return new Promise(function(resolve, reject) {
                        console.log(object);
                        connection.query('select skl_name , skl_level from skill_reference join skills on skills.ref_id = skill_reference.ref_id where sid=?',
                            [object],
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
                for (object of results)
                {
                    object.language = [];

                    let language = await
                        lang_namesee(object.sid);

                    if (language.length) {
                        language.forEach(function(lang) {
                            object.language.push(lang);
                        })
                    }

                }
            }
            console.log("the final results are ", results);
            res.render('tin', {
                user_info: results,
                sid: req.user.sid,
                tin_param:req.params.title
            });




        });
});

app.get("/Recommend", isAuth, async function(req, res)
{


    let query = "select * from lang_count where  ref_id not  in (select ref_id from skills where sid = ? ) limit 1 "



    let results = async function () {
        return new Promise(function (resolve, reject) {
            connection.query(query,[req.user.sid],
                function (err, rows) {
                    if (err) {
                        console.log("error in team",err);
                    } else if (rows === undefined) {
                        reject(new Error("Error rows is undefined"));
                    } else {
                        console.log("the  recommended language is  ", rows );
                        resolve(rows);

                    }
                }
            )
        });

    }
    let result=[];

    result = await results()
    if (result.length!==0)
    {
        res.render('recommendation_page', {
            result: result[0]
        })
    }


})
app.get("/workshop:title", isAuth, async function(req, res)
{

    let language=req.params.title;
    let lang = language.substring(1,language.length);

    let query = "select skl_name, sid , teacher_id from skill_wish " +
        "join skill_reference sr on sr.ref_id= skill_wish.ref_id " +
        "and sid= " + req.user.sid +
        " and skl_name = " +"'" + lang +"'" ;

    connection.query( query  , function (error,result)
    {
        if (error)
        {
            console.log("the errors are " , error )
        }

        else   if ( result[0]!==undefined )
        {

            if (result[0].teacher_id!=null && result[0].sid===req.user.sid)
            {
                res.redirect('team' + lang );
            }
            else {
                console.log("the workshop results are ", result);
                res.redirect('no_workshop');
            }


        }
        else {


            connection.query ("select *  from workshop where sid = ? and ws_name = ?  " , [req.user.sid,lang],
                function (errors, result) {
                    if (result.length!==0)
                    {
                        console.log("the result of workshop are " , result)

                        res.redirect('team' + lang );
                    }
                    else {

                        res.render('workshop', {
                            user:req.user,
                            language:lang

                        })

                    }

                }

            )


        }

    });



    console.log("inside worshop ",req.user.sid);



})




app.post('/tin',  (req, res, next) => {
    console.log("inside posted tin");
    console.log(req.body);
    res.redirect('/workshop');
});


app.post('/workshop',  (req, res, next) =>
{

    console.log(req.body);
    connection.query(' insert into workshop (ws_venue,ws_date,ws_name,sid) values (?,?,?,?)'
        , [ req.body.Venue, req.body.dob,req.body.work_lang,req.user.sid],
        function(error) {
            if (error)
            {
                console.log(error);
                console.log("Error in workshop details  ");
            } else {

                console.log("Successfully Entered into workshop details  ");
            }
        });


    let lang=req.body.work_lang;
    res.redirect('/tin:'+lang);

});

app.post('/team',async (req, res, next) =>
{

    let language=req.body.param;
    let workshop_title = language.substring(1,language.length);
    console.log("inside team post ");
    console.log(req.body);
    let lang ='';
    let obj = JSON.parse(req.body.val);
    console.log(obj);
    obj.forEach(function (object)
    {
        if (object.flag === true )
        {
            console.log("ther objects are " , object);
            console.log(object.value, object.flag);

            let str =    " update skill_wish  set teacher_id = " + req.user.sid +  " where sid = " + object.value +
                " and ref_id in  ( select ref_id from skill_reference where  skl_name = "  + " '"+workshop_title + "'" + " )"

            connection.query(str,
                function (error)
                {
                    if (error)
                    {
                        console.log("error occoured  on updating skill_wish's recommendation status ",error);
                    } else
                    {
                        console.log("sucessfully updated skills_wish ");
                    }
                })
        }

    })
    res.redirect("team" +workshop_title );

})

app.get('/team:title', async (req, res, next) => {


    let workshop_title = req.params.title;
    let sid = req.user.sid;
    console.log("the teams parameters are", workshop_title);

    console.log("inside teams get ");


    let teacher_id = "select  teacher_id  from skill_wish join skill_reference sr on sr.ref_id= skill_wish.ref_id where  skl_name = " +
        " '"+req.params.title +"'  " +
        "and sid = "+ req.user.sid;

    let teacher_results = async function ()
    {
        return new Promise(function (resolve, reject) {
            connection.query(teacher_id,
                function (err, rows) {
                    if (err) {
                        console.log("error in team",err);
                    }  else {
                        resolve(rows);

                    }
                }
            )
        });

    };

    let teachers_id = await teacher_results();

    if (teachers_id[0])
    {
        sid = teachers_id[0].teacher_id;
        console.log("the teachers id returned was " , sid);
    }

    console.log("inside teams get ");



    let results = async function () {
        return new Promise(function (resolve, reject) {
            connection.query('select * from student_data where skl_name =? and teacher_id = ?',[workshop_title,sid],
                function (err, rows) {
                    if (err) {
                        console.log("error in team",err);
                    } else if (rows === undefined) {
                        reject(new Error("Error rows is undefined"));
                    } else {
                        console.log("the  Learners are ", rows );
                        resolve(rows);


                    }
                }
            )
        });

    };

    let kek = await results();

    let str_teacher = "select * from   students  where sid=" + sid;
    let teacher = async function () {
        return new Promise(function (resolve, reject) {
            connection.query(str_teacher,
                function (err, rows) {
                    if (err) {
                        console.log("error in teacher ");
                    } else if (rows === undefined) {
                        reject(new Error("Error rows is undefined"));
                    } else {
                        resolve(rows);

                    }
                }
            )
        });

    };


    let work_string = "select * from   workshop  where sid=" + sid  + " and ws_name = ?" ;
    let workshop = async function () {
        return new Promise(function (resolve, reject) {
            connection.query(work_string, [workshop_title],
                function (err, rows) {
                    if (err) {
                        console.log("error in workshop  ", err );
                    } else if (rows === undefined) {
                        reject(new Error("Error rows is undefined"));
                    } else {
                        resolve(rows);

                    }
                }
            )
        });

    };



    let work_detail = await workshop();
    let teacher_info = await teacher();
    console.log("output results ", work_detail[0].ws_name);

    res.render('team',
        {
            teach: teacher_info,
            user: kek,
            lang:req.params.title,
            workshop:work_detail[0]
        });


});







