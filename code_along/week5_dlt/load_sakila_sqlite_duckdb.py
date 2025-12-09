import dlt
from dlt.sources.sql_database import sql_database
from pathlib import Path

# --- paths ---
DATA_PATH = Path(__file__).parent / "data"
SQLITE_PATH = DATA_PATH / "sqlite-sakila.db"
DUCKDB_PATH = DATA_PATH / "sakila.duckdb"

# --- source ---
source = sql_database(
    credentials=f"sqlite:///{SQLITE_PATH}",
    schema="main"
)

# --- pipeline ---
pipeline = dlt.pipeline(
    pipeline_name="sakila_sqlite_duckdb",
    destination=dlt.destinations.duckdb(str(DUCKDB_PATH)),
    dataset_name="staging",
)

# --- run ---
load_info = pipeline.run(source, write_disposition="replace")

print(load_info)
print(f"DuckDB location: {DUCKDB_PATH}")
