var User = require('../models/user');
var jwt = require('jwt-simple');
var config = require('../config/dbconfig');

var functions = {
    addNew: function (req, res) {
        if ((!req.body.name) || (!req.body.password)) {
            res.json({ success: false, msg: 'Enter all the fields' })
        } else {
            var newUser = User({
                name: req.body.name,
                password: req.body.password,
            });
            newUser.save(function (err, newUser) {
                if (err) {
                    res.json({ success: false, msg: 'Failed to save' })
                } else {
                    res.json({ success: true, msg: 'Succesfully saved!' })
                }
            })
        }
    },
    authenticate: function (req, res) {
        User.findOne({
            name: req.body.name
        }, function (err, user) {
            if (err) throw err;
            if (!user) {
                res.status(403).send({ success: false, msg: 'User not found!' })
            } else {
                user.comparePassword(req.body.password, function (err, isMatch) {
                    if (isMatch && !err) {
                        var token = jwt.encode(user, config.secret);
                        res.json({ success: true, token: token })
                    } else {
                        res.status(403).send({ success: false, msg: 'Authetication failed, wrong password!' })
                    }
                })
            }
        })
    },
    getinfo: function (req, res) {
        if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken = jwt.decode(token, config.secret)
            return res.json({ success: true, msg: `hello ${decodedtoken.name}` })
        } else {
            return res.json({ success: false, msg: 'No headers' })
        }
    }
}

module.exports = functions;