const express = require('express');
const bodyParser = require('body-parser');
const instructorsModule = require('./InstructorConfig.js');
const coursesModule = require('./CourseConfig.js');
const leadCommentsModule = require('./LeadCommentConfig.js');
const registrationModule = require('./CourseRegistrationConfig.js');

const app = express();

app.use(bodyParser.json()); // Apply body-parser middleware

// Define route handler for the root URL
app.get('/', (req, res) => {
    // Redirect to the '/instructors' route
    res.redirect('/instructors');
});


// Mounting the modules
app.use('/Instructors', instructorsModule);
app.use('/Courses', coursesModule);
app.use('/LeadComment', leadCommentsModule);
app.use('/CourseRegistration', registrationModule);

// Start the Express server
const PORT = 8000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});