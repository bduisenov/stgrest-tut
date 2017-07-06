CREATE SCHEMA api;
CREATE TABLE api.actors (
  id         SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name  VARCHAR(255)
);
CREATE TABLE api.directors (
  id         SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name  VARCHAR(255)
);
CREATE TABLE api.films (
  id          SERIAL NOT NULL PRIMARY KEY,
  director_id BIGINT REFERENCES api.directors (id),
  title       VARCHAR(255),
  year        INT,
  rating      INT,
  language    INT
);
CREATE TABLE api.roles (
  film_id   BIGINT NOT NULL REFERENCES api.films (id),
  actor_id  BIGINT NOT NULL REFERENCES api.actors (id),
  character VARCHAR(255),
  PRIMARY KEY (film_id, actor_id)
);
CREATE TABLE api.competitions (
  id   SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  year INT
);
CREATE TABLE api.nominations (
  competition_id BIGINT NOT NULL REFERENCES api.competitions (id),
  film_id        BIGINT NOT NULL REFERENCES api.films (id),
  rank           INT,
  PRIMARY KEY (competition_id, film_id)
);
