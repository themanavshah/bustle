const express = require('express');
//const actions = require('../methods/actions');
const router = express.Router()

router.get('/', (req, res) => {
    res.send('bustle is on the way!');
})

router.get('/dashboard', (req, res) => {
    res.send('dashboard');
})

module.exports = router