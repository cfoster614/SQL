DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(15) NOT NULL,
    city VARCHAR(10) NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    CONSTRAINT fk_team1
        FOREIGN KEY(team1)
        REFERENCES teams(id),
    CONSTRAINT fk_team2
        FOREIGN KEY(team2)
        REFERENCES teams(id),
    location VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    start_time TIMESTAMP NOT NULL,
    CONSTRAINT fk_referee
        FOREIGN KEY(referee_id)
        REFERENCES referees(id),
    CONSTRAINT fk_season
        FOREIGN KEY(season_id)
        REFERENCES season(id)
        NOT NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    CONSTRAINT fk_player
        FOREIGN KEY(player_id)
        REFERENCES players(id),
    CONSTRAINT fk_game
        FOREIGN KEY(game_id)
        REFERENCES game(id)
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    CONSTRAINT fk_team
        FOREIGN KEY(team_id)
        REFERENCES teams(id),
    CONSTRAINT fk_game
        FOREIGN KEY(game_id)
        REFERENCES games(id)
);