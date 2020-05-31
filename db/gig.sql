DROP TABLE IF EXISTS gigs;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS venues;


CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255),
  bio TEXT
);


CREATE TABLE venues (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255)
);

CREATE TABLE gigs(
  id SERIAL PRIMARY KEY,
  band_id INT REFERENCES bands(id),
  venue_id INT REFERENCES venues(id),
  date VARCHAR(255),
  time VARCHAR(255)
);
