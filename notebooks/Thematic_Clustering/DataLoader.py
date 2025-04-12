import duckdb
import pandas as pd


class DataLoader:
    def __init__(self, db_path):
        if not db_path:
            raise ValueError("Database path cannot be None")
        self.db_path = db_path 

    def load_data(self, filename) -> pd.DataFrame:
        con = duckdb.connect(self.db_path)
        query = f"SELECT * FROM {filename}"
        df = con.execute(query).fetchdf()
        con.close()
        return df
