-- ============================================================
-- F1 Racing Data Analytics & Management System
-- Sample Data: DML INSERT Statements
-- ============================================================

USE f1_analytics;

-- ============================================================
-- Circuits
-- ============================================================
INSERT INTO Circuits (circuit_name, location, country, city, length_km, lap_record_sec) VALUES
('Circuit de Monaco',           'Monte Carlo',      'Monaco',           'Monte Carlo',  3.337, 71.382),
('Silverstone Circuit',         'Northamptonshire', 'United Kingdom',   'Silverstone',  5.891, 85.010),
('Monza Circuit',               'Monza',            'Italy',            'Monza',        5.793, 79.905),
('Suzuka International Circuit','Suzuka',           'Japan',            'Suzuka',       5.807, 88.221),
('Circuit of the Americas',     'Austin',           'USA',              'Austin',       5.513, 95.270),
('Spa-Francorchamps',           'Stavelot',         'Belgium',          'Spa',          7.004, 103.585),
('Bahrain International Circuit','Sakhir',          'Bahrain',          'Sakhir',       5.412, 91.447),
('Yas Marina Circuit',          'Abu Dhabi',        'UAE',              'Abu Dhabi',    5.281, 93.018);

-- ============================================================
-- Drivers
-- ============================================================
INSERT INTO Drivers (driver_name, driver_number, dob, nationality, team) VALUES
('Max Verstappen',   1,  '1997-09-30', 'Dutch',       'Red Bull Racing'),
('Lando Norris',     4,  '1999-11-13', 'British',     'McLaren'),
('Charles Leclerc',  16, '1997-10-16', 'Monegasque',  'Ferrari'),
('Carlos Sainz',     55, '1994-09-01', 'Spanish',     'Williams'),
('Lewis Hamilton',   44, '1985-01-07', 'British',     'Ferrari'),
('George Russell',   63, '1998-02-15', 'British',     'Mercedes'),
('Fernando Alonso',  14, '1981-07-29', 'Spanish',     'Aston Martin'),
('Oscar Piastri',    81, '2001-04-06', 'Australian',  'McLaren'),
('Sergio Perez',     11, '1990-01-26', 'Mexican',     'Red Bull Racing'),
('Lance Stroll',     18, '1998-10-29', 'Canadian',    'Aston Martin');

-- ============================================================
-- Races  (Season 2025)
-- ============================================================
INSERT INTO Races (race_name, round, race_date, race_time, circuit_id, season_year) VALUES
('Bahrain Grand Prix',          1,  '2025-03-02', '15:00:00', 7, 2025),
('Japanese Grand Prix',         2,  '2025-04-06', '14:00:00', 4, 2025),
('Monaco Grand Prix',           3,  '2025-05-25', '15:00:00', 1, 2025),
('British Grand Prix',          4,  '2025-07-06', '15:00:00', 2, 2025),
('Belgian Grand Prix',          5,  '2025-07-27', '15:00:00', 6, 2025),
('Italian Grand Prix',          6,  '2025-09-07', '15:00:00', 3, 2025),
('United States Grand Prix',    7,  '2025-10-19', '14:00:00', 5, 2025),
('Abu Dhabi Grand Prix',        8,  '2025-11-23', '17:00:00', 8, 2025);

-- ============================================================
-- Race Results (Sample data for first 4 races)
-- ============================================================
-- Race 1: Bahrain GP
INSERT INTO RaceResults (race_id, driver_id, grid_position, finish_position, points_scored, laps_completed, status, fastest_lap) VALUES
(1, 1, 1, 1, 25, 57, 'Finished', TRUE),
(1, 3, 2, 2, 18, 57, 'Finished', FALSE),
(1, 5, 4, 3, 15, 57, 'Finished', FALSE),
(1, 2, 3, 4, 12, 57, 'Finished', FALSE),
(1, 8, 5, 5, 10, 57, 'Finished', FALSE),
(1, 6, 6, 6,  8, 57, 'Finished', FALSE),
(1, 9, 7, 7,  6, 57, 'Finished', FALSE),
(1, 4, 8, 8,  4, 57, 'Finished', FALSE),
(1, 7, 9, 9,  2, 57, 'Finished', FALSE),
(1,10,10,10,  1, 57, 'Finished', FALSE);

-- Race 2: Japanese GP
INSERT INTO RaceResults (race_id, driver_id, grid_position, finish_position, points_scored, laps_completed, status, fastest_lap) VALUES
(2, 2, 1, 1, 25, 53, 'Finished', TRUE),
(2, 8, 2, 2, 18, 53, 'Finished', FALSE),
(2, 1, 3, 3, 15, 53, 'Finished', FALSE),
(2, 3, 4, 4, 12, 53, 'Finished', FALSE),
(2, 6, 5, 5, 10, 53, 'Finished', FALSE),
(2, 5, 6, 6,  8, 53, 'Finished', FALSE),
(2, 4, 7, 7,  6, 53, 'Finished', FALSE),
(2, 7, 8, 8,  4, 53, 'Finished', FALSE),
(2, 9, 9, 9,  2, 53, 'Finished', FALSE),
(2,10,10,10,  1, 53, 'Finished', FALSE);

-- Race 3: Monaco GP
INSERT INTO RaceResults (race_id, driver_id, grid_position, finish_position, points_scored, laps_completed, status, fastest_lap) VALUES
(3, 3, 1, 1, 25, 78, 'Finished', FALSE),
(3, 1, 2, 2, 18, 78, 'Finished', TRUE),
(3, 2, 3, 3, 15, 78, 'Finished', FALSE),
(3, 5, 4, 4, 12, 78, 'Finished', FALSE),
(3, 7, 5, 5, 10, 78, 'Finished', FALSE),
(3, 8, 6, 6,  8, 78, 'Finished', FALSE),
(3, 6, 7, 7,  6, 78, 'Finished', FALSE),
(3, 4, 8, 8,  4, 78, 'Finished', FALSE),
(3, 9,10, 9,  2, 60, 'DNF',      FALSE),
(3,10, 9,10,  1, 78, 'Finished', FALSE);

-- Race 4: British GP
INSERT INTO RaceResults (race_id, driver_id, grid_position, finish_position, points_scored, laps_completed, status, fastest_lap) VALUES
(4, 6, 1, 1, 25, 52, 'Finished', FALSE),
(4, 5, 2, 2, 18, 52, 'Finished', FALSE),
(4, 2, 3, 3, 15, 52, 'Finished', TRUE),
(4, 8, 4, 4, 12, 52, 'Finished', FALSE),
(4, 1, 5, 5, 10, 52, 'Finished', FALSE),
(4, 3, 6, 6,  8, 52, 'Finished', FALSE),
(4, 7, 7, 7,  6, 52, 'Finished', FALSE),
(4, 4, 8, 8,  4, 52, 'Finished', FALSE),
(4, 9, 9, 9,  2, 52, 'Finished', FALSE),
(4,10,10,10,  1, 52, 'Finished', FALSE);
