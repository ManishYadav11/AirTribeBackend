-- Create the Instructors table
CREATE TABLE Instructors (
    instructor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create the Courses table
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    instructor_id INT,
    name VARCHAR(100) NOT NULL,
    max_seats INT NOT NULL,
    start_date DATE NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- Create the CourseRegistration table
CREATE TABLE CourseRegistration (
    courseRegistration_id SERIAL PRIMARY KEY,
    course_id INT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    linkedin_profile VARCHAR(200),
    status VARCHAR(20) DEFAULT 'Applied',
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create the LeadComments table
CREATE TABLE LeadComments (
    comment_id SERIAL PRIMARY KEY,
    lead_id INT,
    instructor_id INT,
    comment TEXT NOT NULL,
    FOREIGN KEY (lead_id) REFERENCES Leads(lead_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);


-- for inserting values in table

-- Sample data for Instructors table
INSERT INTO Instructors (name, email) 
VALUES 
    ('Suresh Kumar', 'suresh.kumar@gmail.com'),
    ('Ananya Mishra', 'ananya.mishra@gmail.com'),
    ('Rajesh Singh', 'rajesh.singh@gmail.com'),
    ('Neha Sharma', 'neha.sharma@gmail.com'),
    ('Vikram Patel', 'vikram.patel@gmail.com');

-- Sample data for Courses table
INSERT INTO Courses (instructor_id, name, max_seats, start_date) 
VALUES 
    (1, 'Web Development Basics', 20, '2024-03-20'),
    (2, 'Introduction to Machine Learning', 25, '2024-04-05'),
    (3, 'Digital Marketing Fundamentals', 30, '2024-04-15'),
    (4, 'Graphic Design Essentials', 15, '2024-03-25'),
    (5, 'Financial Planning 101', 20, '2024-04-10');

-- Sample data for CourseRegistration table
INSERT INTO CourseRegistration (course_id, name, email, phone, linkedin_profile, status) 
VALUES 
    (1, 'Arun Kumar', 'arun.kumar@gmail.com', '9876543210', 'https://www.linkedin.com/in/arunkumar', 'Applied'),
    (2, 'Priya Sharma', 'priya.sharma@gmail.com', '1234567890', 'https://www.linkedin.com/in/priyasharma', 'Applied'),
    (3, 'Rajesh Verma', 'rajesh.verma@gmail.com', '9998887776', 'https://www.linkedin.com/in/rajeshverma', 'Applied'),
    (4, 'Sneha Kapoor', 'sneha.kapoor@gmail.com', '9876543210', 'https://www.linkedin.com/in/snehakapoor', 'Applied'),
    (5, 'Vivek Singh', 'vivek.singh@gmail.com', '1234567890', 'https://www.linkedin.com/in/viveksingh', 'Applied');

-- Sample data for LeadComments table
INSERT INTO LeadComments (lead_id, instructor_id, comment) 
VALUES 
    (1, 1, 'Arun seems quite interested in web development.'),
    (2, 2, 'Priya shows a strong inclination towards machine learning concepts.'),
    (3, 3, 'Rajesh has a good understanding of digital marketing strategies.'),
    (4, 4, 'Sneha has a creative approach to graphic design.'),
    (5, 5, 'Vivek demonstrates a keen interest in financial planning.');
