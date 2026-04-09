-- ============================================================
-- F1 Racing Data Analytics & Management System
-- Schema: DDL (Data Definition Language)
-- Author: Your Name
-- Date: February 2026
-- ============================================================

CREATE DATABASE IF NOT EXISTS f1_analytics;
USE f1_analytics;

-- ============================================================
-- TABLE 1: Circuits
-- ============================================================
CREATE TABLE IF NOT EXISTS Circuits (
    circuit_id      INT             NOT NULL AUTO_INCREMENT,
    circuit_name    VARCHAR(100)    NOT NULL,
    location        VARCHAR(100)    NOT NULL,
    country         VARCHAR(60)     NOT NULL,
    city            VARCHAR(60),
    length_km       DECIMAL(5, 3),
    lap_record_sec  DECIMAL(6, 3),
    PRIMARY KEY (circuit_id)
);

-- ============================================================
-- TABLE 2: Drivers
-- ============================================================
CREATE TABLE IF NOT EXISTS Drivers (
    driver_id       INT             NOT NULL AUTO_INCREMENT,
    driver_name     VARCHAR(100)    NOT NULL,
    driver_number   INT             NOT NULL UNIQUE,
    dob             DATE            NOT NULL,
    nationality     VARCHAR(60)     NOT NULL,
    team            VARCHAR(100),
    PRIMARY KEY (driver_id)
);

-- ============================================================
-- TABLE 3: Races
-- ============================================================
CREATE TABLE IF NOT EXISTS Races (
    race_id         INT             NOT NULL AUTO_INCREMENT,
    race_name       VARCHAR(100)    NOT NULL,
    round           INT             NOT NULL,
    race_date       DATE            NOT NULL,
    race_time       TIME,
    circuit_id      INT             NOT NULL,
    season_year     YEAR            NOT NULL,
    PRIMARY KEY (race_id),
    FOREIGN KEY (circuit_id) REFERENCES Circuits(circuit_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================================
-- TABLE 4: RaceResults (Junction / Fact Table)
-- ============================================================
CREATE TABLE IF NOT EXISTS RaceResults (
    result_id       INT             NOT NULL AUTO_INCREMENT,
    race_id         INT             NOT NULL,
    driver_id       INT             NOT NULL,
    grid_position   INT,
    finish_position INT,
    points_scored   DECIMAL(4, 1)   DEFAULT 0,
    laps_completed  INT,
    status          VARCHAR(50)     DEFAULT 'Finished',   -- e.g. Finished, DNF, DSQ
    fastest_lap     BOOLEAN         DEFAULT FALSE,
    PRIMARY KEY (result_id),
    FOREIGN KEY (race_id)   REFERENCES Races(race_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY uq_race_driver (race_id, driver_id)
);
