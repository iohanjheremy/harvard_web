CREATE TABLE flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origin TEXT NOT NULL,
    destination TEXT NOT NULL,
    duration INTEGER NOT NULL,
);

INSERT INTO flights (
    origin, destination, duration
) VALUES ("New York", "London", 415);

INSERT INTO flights(
    origin, destination, duration
) VALUES ('Shangai', 'Paris', 760);

INSERT INTO flights(
    origin, destination, duration
) VALUES 
    ('Istanbul', 'Tokyo', 760),
    ('New York', 'Paris', 435),
    ('Moscow', 'Paris', 245),


INSERT INTO flights(
    origin, destination, duration
) VALUES ('Lima', 'New York', 455);

SELECT * FROM flights WHERE origin = "New York";

UPDATE flights
    SET duration = 430
    WHERE origin = "New York"
    AND destination = "London";


CREATE TABLE airport(
    id  INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL,
    city TEXT NOT NULL
);

INSERT INTO airport (
    code, city
) VALUES ('JFK', 'New York');

INSERT INTO airport (
    code, city
) VALUES ('PVG', 'Shangai');


INSERT INTO airport (
    code, city
) VALUES ('IST', 'Istanbul');

INSERT INTO airport (
    code, city
) VALUES ('LHR', 'London');

INSERT INTO airport (
    code, city
) VALUES ('SVO', 'Moscow');

INSERT INTO airport (
    code, city
) VALUES ('LIM', 'Lima');

INSERT INTO airport (
    code, city
) VALUES ('CDG', 'Paris');

INSERT INTO airport (
    code, city
) VALUES ('NTR', 'Tokyo');


CREATE TABLE people(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO people (
    name, last_name
) VALUES 
    ('Harry', 'Potter'),
    ('Ron', 'Weasley'),
    ('Hermione', 'Granger'),
    ('Draco', 'Malfoy'),
    ('Luna', 'Lovegood'),
    ('Ginny', 'Weasley');


CREATE TABLE passengers(
    person_id INTEGER,
    flight_id INTEGER,
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (flight_id) REFERENCES flights(id)
);

INSERT INTO passengers(
    person_id, flight_id
) VALUES 
    (1, 1),
    (2, 1),
    (2, 4),
    (3, 2),
    (4, 4),
    (5, 6),
    (6, 6);

/*vídeo / resultado: erro
SELECT name, origin, destination FROM flights 
JOIN passengers 
ON passengers.flight_id = flights.id;*/

--meu / resultado: funcionou
SELECT name, origin, destination 
FROM passengers
JOIN people ON passengers.person_id = people.id
JOIN flights ON passengers.flight_id = flights.id;

--CREATE INDEX name_index ON passengers (last_name);