from pathlib import Path
import pandas as pd


def get_data_path(file_name: str) -> str:
    return Path(__file__).parent / ".." / "data" / file_name


def process_data() -> None:
    df = pd.read_csv(get_data_path("temperatures_state_year.csv"), sep=";", index_col=0)
    df["temp_c"] = (df["temp"]-32)*5/9
    df.to_parquet(get_data_path("out_temperatures.parquet"))


if __name__ == "__main__":
    process_data()
