-- ============================================================
-- F1 Racing Data Analytics & Management System
-- Advanced SQL Queries: DML & Analytical
-- ============================================================

USE f1_analytics;

-- ============================================================
-- QUERY 1: Driver Championship Standings
-- Total points per driver across all races, ranked
-- ============================================================
SELECT
    d.driver_name,
    d.team,
    d.nationality,
    SUM(rr.points_scored)   AS total_points,
    COUNT(CASE WHEN rr.finish_position = 1 THEN 1 END) AS wins,
    COUNT(CASE WHEN rr.finish_position <= 3 THEN 1 END) AS podiums,
    COUNT(rr.result_id)     AS races_entered,
    SUM(rr.fastest_lap)     AS fastest_laps
FROM Drivers d
JOIN RaceResults rr ON d.driver_id = rr.driver_id
GROUP BY d.driver_id, d.driver_name, d.team, d.nationality
ORDER BY total_points DESC, wins DESC;


-- ============================================================
-- QUERY 2: Race-by-Race Performance of a Specific Driver
-- Change driver_id value to query any driver
-- ============================================================
SELECT
    r.season_year,
    r.round,
    r.race_name,
    c.circuit_name,
    c.country,
    rr.grid_position,
    rr.finish_position,
    rr.points_scored,
    rr.status,
    rr.fastest_lap
FROM RaceResults rr
JOIN Races   r ON rr.race_id   = r.race_id
JOIN Circuits c ON r.circuit_id = c.circuit_id
WHERE rr.driver_id = 1                      -- Max Verstappen
ORDER BY r.season_year, r.round;


-- ============================================================
-- QUERY 3: Average Finishing Position per Driver (Performance Trend)
-- ============================================================
SELECT
    d.driver_name,
    d.team,
    ROUND(AVG(rr.finish_position), 2)   AS avg_finish_position,
    ROUND(AVG(rr.grid_position), 2)     AS avg_grid_position,
    ROUND(AVG(rr.grid_position - rr.finish_position), 2) AS avg_positions_gained,
    SUM(rr.points_scored)               AS total_points
FROM Drivers d
JOIN RaceResults rr ON d.driver_id = rr.driver_id
WHERE rr.status = 'Finished'
GROUP BY d.driver_id, d.driver_name, d.team
ORDER BY avg_finish_position ASC;


-- ============================================================
-- QUERY 4: Circuit-wise Race Statistics
-- Which circuits have the most overtakes (grid vs finish delta)
-- ============================================================
SELECT
    c.circuit_name,
    c.country,
    r.race_name,
    r.season_year,
    COUNT(rr.result_id)                                         AS finishers,
    SUM(ABS(rr.grid_position - rr.finish_position))            AS total_position_changes,
    ROUND(AVG(ABS(rr.grid_position - rr.finish_position)), 2)  AS avg_position_change
FROM Circuits c
JOIN Races r       ON c.circuit_id = r.circuit_id
JOIN RaceResults rr ON r.race_id   = rr.race_id
GROUP BY c.circuit_id, c.circuit_name, c.country, r.race_id, r.race_name, r.season_year
ORDER BY total_position_changes DESC;


-- ============================================================
-- QUERY 5: DNF (Did Not Finish) Analysis
-- Reliability breakdown per driver
-- ============================================================
SELECT
    d.driver_name,
    d.team,
    COUNT(rr.result_id)                                                 AS total_races,
    SUM(CASE WHEN rr.status != 'Finished' THEN 1 ELSE 0 END)          AS dnf_count,
    ROUND(SUM(CASE WHEN rr.status != 'Finished' THEN 1 ELSE 0 END)
          / COUNT(rr.result_id) * 100, 2)                              AS dnf_percentage
FROM Drivers d
JOIN RaceResults rr ON d.driver_id = rr.driver_id
GROUP BY d.driver_id, d.driver_name, d.team
ORDER BY dnf_percentage DESC;


-- ============================================================
-- QUERY 6: Points Progression Race by Race (Cumulative)
-- Useful for championship trend visualisation
-- ============================================================
SELECT
    d.driver_name,
    r.round,
    r.race_name,
    rr.points_scored                        AS race_points,
    SUM(rr.points_scored) OVER (
        PARTITION BY d.driver_id
        ORDER BY r.round
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )                                       AS cumulative_points
FROM Drivers d
JOIN RaceResults rr ON d.driver_id = rr.driver_id
JOIN Races r        ON rr.race_id  = r.race_id
ORDER BY d.driver_name, r.round;


-- ============================================================
-- QUERY 7: Head-to-Head Comparison (Two drivers)
-- Compare Verstappen (id=1) vs Norris (id=2)
-- ============================================================
SELECT
    r.race_name,
    r.round,
    MAX(CASE WHEN rr.driver_id = 1 THEN rr.finish_position END) AS verstappen_pos,
    MAX(CASE WHEN rr.driver_id = 2 THEN rr.finish_position END) AS norris_pos,
    MAX(CASE WHEN rr.driver_id = 1 THEN rr.points_scored  END)  AS verstappen_pts,
    MAX(CASE WHEN rr.driver_id = 2 THEN rr.points_scored  END)  AS norris_pts
FROM Races r
JOIN RaceResults rr ON r.race_id = rr.race_id
WHERE rr.driver_id IN (1, 2)
GROUP BY r.race_id, r.race_name, r.round
ORDER BY r.round;


-- ============================================================
-- QUERY 8: Race Outcome Prediction Score
-- Simple heuristic: lower avg_finish + more wins = stronger prediction
-- ============================================================
SELECT
    d.driver_name,
    d.team,
    ROUND(AVG(rr.finish_position), 2)                               AS avg_finish,
    SUM(CASE WHEN rr.finish_position = 1 THEN 1 ELSE 0 END)        AS wins,
    SUM(rr.points_scored)                                          AS total_points,
    ROUND(
        (1.0 / AVG(rr.finish_position)) * 10
        + SUM(CASE WHEN rr.finish_position = 1 THEN 1 ELSE 0 END) * 5
        + SUM(rr.points_scored) * 0.1,
    2)                                                             AS prediction_score
FROM Drivers d
JOIN RaceResults rr ON d.driver_id = rr.driver_id
GROUP BY d.driver_id, d.driver_name, d.team
ORDER BY prediction_score DESC;
