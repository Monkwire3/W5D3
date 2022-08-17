PRAGMA foreign_keys = ON;

DROP TABLE if exists question_follows;
DROP TABLE if exists replies;
DROP TABLE if exists question_likes;
DROP TABLE if exists questions;
DROP TABLE if exists users;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT,
    user_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_id INTEGER,
    body TEXT,
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    like_count INTEGER,
    question_id,

    FOREIGN KEY (question_id) REFERENCES questions(id)
);