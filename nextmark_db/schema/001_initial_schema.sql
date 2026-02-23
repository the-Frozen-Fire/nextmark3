CREATE TABLE users_account (
    id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rubric_template (
    id INT PRIMARY KEY,
    course_id INT,
    template_name VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE assignment_rubric (
    id INT PRIMARY KEY,
    rubric_template_id INT,
    criteria VARCHAR(255) NOT NULL,
    points INT NOT NULL,
    FOREIGN KEY (rubric_template_id) REFERENCES rubric_template(id)
);

CREATE TABLE assignment (
    id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(255) NOT NULL,
    due_date DATETIME,
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE test_case (
    id INT PRIMARY KEY,
    assignment_id INT,
    input_data TEXT NOT NULL,
    expected_output TEXT NOT NULL,
    FOREIGN KEY (assignment_id) REFERENCES assignment(id)
);

CREATE TABLE submission (
    id INT PRIMARY KEY,
    assignment_id INT,
    user_account_id INT,
    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assignment_id) REFERENCES assignment(id),
    FOREIGN KEY (user_account_id) REFERENCES users_account(id)
);

CREATE TABLE grading_result (
    id INT PRIMARY KEY,
    submission_id INT,
    score INT NOT NULL,
    feedback TEXT,
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE flag (
    id INT PRIMARY KEY,
    submission_id INT,
    reason VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE feedback (
    id INT PRIMARY KEY,
    submission_id INT,
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE notification (
    id INT PRIMARY KEY,
    user_account_id INT,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_account_id) REFERENCES users_account(id)
);

CREATE TABLE system_log (
    id INT PRIMARY KEY,
    action VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_history (
    id INT PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    action VARCHAR(50) NOT NULL,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP
);