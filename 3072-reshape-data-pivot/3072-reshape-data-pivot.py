import pandas as pd

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    pivot = weather.pivot_table(index = 'month',
                            columns = 'city', 
                            values = 'temperature')
    return pivot