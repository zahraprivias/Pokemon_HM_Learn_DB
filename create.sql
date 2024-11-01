CREATE DATABASE pokemon_hm;

CREATE TABLE pokemon(
    dex VARCHAR PRIMARY KEY,
    natl VARCHAR NOT NULL UNIQUE,
    name VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
    cut VARCHAR NOT NULL,
    fly VARCHAR NOT NULL,
    surf VARCHAR NOT NULL,
    strength VARCHAR NOT NULL,
    waterfall VARCHAR NOT NULL,
    dive VARCHAR NOT NULL,
    total int
);