const express = require('express');
const actions = require('../methods/actions');
const router = express.Router()

router.get('/', (req, res) => {
    res.send('bustle is on the way!');
})

router.get('/dashboard', (req, res) => {
    res.send('dashboard');
})

//@desc Adding a new user
//@route POST /adduser
router.post('/adduser', actions.addNew);
//@desc Authenticate user
//@route POST /authenticate
router.post('/authenticate', actions.authenticate);
//@desc Get info on a user user
//@route GET /getinfo
router.get('/getinfo', actions.getinfo);

module.exports = router