from pathlib import Path
import duckdb
import os

# 👉 Samma logik som i din pipeline-fil
BASE_DIR = Path(os.getcwd())
DATA_PATH = BASE_DIR / "data"
DUCKDB_PATH = DATA_PATH / "sakila.duckdb"

print("🔗 Ansluter till:", DUCKDB_PATH)

con = duckdb.connect(str(DUCKDB_PATH))

print("\n🔍 Tabeller i DuckDB:")
print(con.sql("SHOW TABLES;").df())

print("\n🎥 Antal filmer:")
print(con.sql("SELECT COUNT(*) AS film_count FROM film;").df())

print("\n🧑‍🎤 Antal skådespelare:")
print(con.sql("SELECT COUNT(*) AS actor_count FROM actor;").df())

print("\n📄 Exempelrader från film:")
print(con.sql("SELECT * FROM film LIMIT 5;").df())
