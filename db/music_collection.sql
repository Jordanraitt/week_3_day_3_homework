DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  name  VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL8 PRIMARY KEY,
  artists_id INT8 REFERENCES artists(id),
  name_title  VARCHAR(255),
  genre VARCHAR(255)
);
