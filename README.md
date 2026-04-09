# 🏎️ F1 Racing Data Analytics & Management System

> A normalized relational database system built in **MySQL** to store, manage, and analyze Formula 1 racing data — including circuits, drivers, races, and race results.

---

## 📐 Schema Overview

The system comprises **4 normalized tables**:

| Table | Purpose |
|---|---|
| `Circuits` | Track metadata (name, location, length, lap record) |
| `Drivers` | Driver demographics (name, number, DOB, nationality, team) |
| `Races` | Race logistics (name, round, date, time, circuit, season) |
| `RaceResults` | Fact table linking races & drivers with performance data |

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
└── README.md           # Project documentation
```

---

## 🔍 Key SQL Queries

| # | Query | Technique Used |
|---|---|---|
| 1 | Driver Championship Standings | `GROUP BY`, `COUNT`, `SUM` |
| 2 | Race-by-Race Performance (per driver) | Multi-table `JOIN` |
| 3 | Average Finishing Position & Positions Gained | `AVG`, arithmetic expressions |
| 4 | Circuit-wise Overtake Statistics | Aggregate + `ABS()` |
| 5 | DNF Reliability Analysis | Conditional `SUM`, `CASE WHEN` |
| 6 | Cumulative Points Progression | Window function `SUM() OVER()` |
| 7 | Head-to-Head Driver Comparison | Pivot with `CASE WHEN` |
| 8 | Race Outcome Prediction Score | Heuristic scoring formula |

---

## 🗄️ Database Setup

### Prerequisites
- MySQL 8.0+ (or MariaDB 10.5+)
- MySQL CLI or MySQL Workbench

### Run in order

```bash
# 1. Create schema and tables
mysql -u root -p < schema.sql

# 2. Load sample data
mysql -u root -p < data_inserts.sql

# 3. Run analytical queries
mysql -u root -p f1_analytics < queries.sql

# 4. (Optional) Apply access control
mysql -u root -p < access_control.sql
```

---

## 🧠 Concepts Demonstrated

- **Relational Schema Design** – 3NF normalization, primary keys, foreign keys
- **DML** – `INSERT`, `SELECT`, `UPDATE`, aggregate functions
- **DCL** – `GRANT`, `REVOKE`, user role management
- **Window Functions** – `SUM() OVER (PARTITION BY ... ORDER BY ...)`
- **Analytical Queries** – Championship standings, head-to-head, prediction scoring
- **Data Integrity** – `UNIQUE`, `NOT NULL`, `ON DELETE CASCADE/RESTRICT`

---

## 📊 Sample Output: Championship Standings

| Driver | Team | Points | Wins | Podiums |
|---|---|---|---|---|
| Max Verstappen | Red Bull | 68 | 1 | 3 |
| Lando Norris | McLaren | 67 | 1 | 3 |
| Charles Leclerc | Ferrari | 55 | 1 | 2 |
| George Russell | Mercedes | 39 | 1 | 1 |

---

## 🛠️ Tech Stack

- **Database**: MySQL 8.0
- **Language**: SQL (DDL, DML, DCL)
- **Tools**: MySQL Workbench / CLI
- **Diagramming**: Mermaid (ERD)

---

## 👤 Author

**Your Name**  
B.Tech Computer Engineering | Feb 2026 – Present  
[LinkedIn](https://linkedin.com/in/yourprofile) · [GitHub](https://github.com/yourusername)
