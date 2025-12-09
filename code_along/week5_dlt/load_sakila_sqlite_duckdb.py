import dlt
from dlt.sources.sqlite import sql_database
from pathlib import Path

DATA_PATH = Path(__file__).parent / "data"
SQLITE_PATH = DATA_PATH / "sqlite-sakila.db"
DUCKDB_PATH = DATA_PATH / "sakila.duckdb"

source = sql_database(credentials=f"sqlite:///{SQLITE_PATH}", schema="main")

pipeline = dlt.pipeline(
    pipeline_name="sakila_sqlite_to_duckdb", 
    destination=dlt.destinations.duckdb(str(DUCKDB_PATH)), 
    dataset_name="staging",
)

load_info = pipeline.run(source, write_disposition="replace")