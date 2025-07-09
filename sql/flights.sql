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
) VALUES ('Lima', 'New York', 455);

SELECT * FROM flights WHERE origin = "New York";