const express = require('express');
const _ = require('lodash'); // Vulnerable dependency loaded
const app = express();

app.use(express.json());

// A simple API that merges user-submitted profile settings
app.post('/api/profile', (req, res) => {
    let userProfile = {};
    const userInput = req.body; // e.g., { "theme": "dark" }

    // CRITICAL: lodash.defaultsDeep in version 4.17.11 is susceptible 
    // to Prototype Pollution.
    _.defaultsDeep(userProfile, userInput);

    res.send({ status: "success", profile: userProfile });
});

app.listen(3000, () => console.log('Server running...'));
