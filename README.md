# 🏎️ F1 Racing Data Analytics & Management System

> A normalized relational database system built in **MySQL** to store, manage, and analyze Formula 1 racing data — covering circuits, drivers, races, and real race results.

I built this project out of a genuine interest in combining two things I enjoy — **Formula 1** and **data**. The goal was to go beyond simple CRUD operations and design something that could actually answer meaningful questions: *Who's leading the championship? Which circuit sees the most overtakes? How reliable is each driver?* All answered through SQL.

---

## 📐 Schema Overview

The system is built around **4 normalized tables** that reflect how F1 data actually relates in the real world:

| Table | Purpose |
|---|---|
| `Circuits` | Track metadata — name, location, country, length, lap record |
| `Drivers` | Driver profiles — name, number, date of birth, nationality, team |
| `Races` | Race logistics — name, round number, date, time, circuit, season |
| `RaceResults` | The core fact table linking each driver to each race with full performance data |

### Entity-Relationship Diagram

See [`ER_diagram.md`](./ER_diagram.md) for the full Mermaid ERD.

```
Circuits ──< Races ──< RaceResults >── Drivers
```

---

## 📂 Project Structure

```
f1_analytics/
├── schema.sql          # DDL – Table definitions & constraints
├── data_inserts.sql    # DML – Sample data (circuits, drivers, races, results)
├── queries.sql         # Advanced analytical SQL queries
├── access_control.sql  # DCL – User roles & GRANT/REVOKE statements
├── ER_diagram.md       # Entity-Relationship diagram (Mermaid)
└── README.md           # You're reading it!
```

---

## 🔍 Key SQL Queries

These are the eight analytical queries I wrote — each one targeting a different aspect of race performance:

| # | Query | Technique Used |
|---|---|---|
| 1 | Driver Championship Standings | `GROUP BY`, `COUNT`, `SUM` |
| 2 | Race-by-Race Performance (per driver) | Multi-table `JOIN` |
| 3 | Average Finishing Position & Positions Gained | `AVG`, arithmetic expressions |
| 4 | Circuit-wise Overtake Statistics | Aggregate functions + `ABS()` |
| 5 | DNF Reliability Analysis | Conditional `SUM`, `CASE WHEN` |
| 6 | Cumulative Points Progression | Window function `SUM() OVER()` |
| 7 | Head-to-Head Driver Comparison | Pivot with `CASE WHEN` |
| 8 | Race Outcome Prediction Score | Custom heuristic scoring formula |

Query 8 was probably the most fun to write — it's a simple but satisfying formula that combines finishing average, win count, and points into a single "prediction score" per driver.

---

## 🗄️ Getting It Running Locally

### Prerequisites
- MySQL 8.0+ (or MariaDB 10.5+)
- MySQL CLI or MySQL Workbench

### Run the files in this order

```bash
# 1. Create the schema and all tables
mysql -u root -p < schema.sql

# 2. Load sample data
mysql -u root -p < data_inserts.sql

# 3. Run the analytical queries
mysql -u root -p f1_analytics < queries.sql

# 4. (Optional) Set up user roles and access control
mysql -u root -p < access_control.sql
```

---

## 🧠 Concepts Covered

- **Relational Schema Design** — 3NF normalization, primary keys, foreign keys, referential integrity
- **DML** — `INSERT`, `SELECT`, `UPDATE`, aggregate functions across multiple tables
- **DCL** — `GRANT`, `REVOKE`, three-tier user role management (analyst / operator / admin)
- **Window Functions** — `SUM() OVER (PARTITION BY ... ORDER BY ...)` for cumulative standings
- **Analytical Queries** — Championship standings, head-to-head comparison, prediction scoring
- **Data Integrity** — `UNIQUE`, `NOT NULL`, `ON DELETE CASCADE / RESTRICT` constraints

---

## 📊 Sample Output: Championship Standings

| Driver | Team | Points | Wins | Podiums |
|---|---|---|---|---|
| Max Verstappen | Red Bull Racing | 68 | 1 | 3 |
| Lando Norris | McLaren | 67 | 1 | 3 |
| Charles Leclerc | Ferrari | 55 | 1 | 2 |
| George Russell | Mercedes | 39 | 1 | 1 |

---

## 🛠️ Tech Stack

- **Database** — MySQL 8.0
- **Language** — SQL (DDL, DML, DCL)
- **Tools** — MySQL Workbench / CLI
- **Diagramming** — Mermaid (ERD renders natively on GitHub)

---

## 👤 About Me

**Yuvraj Anand Wagh**  
B.Tech Information Technology Engineering | Feb 2026 – Present

I'm currently in my undergrad, building projects that sit at the intersection of data engineering and real-world domains I care about. F1 felt like the perfect dataset — structured, rich, and seasonal — to explore relational database design properly.

[LinkedIn](https://linkedin.com/in/yuvrajwagh) · [GitHub](https://github.com/yuvitiger3331)
