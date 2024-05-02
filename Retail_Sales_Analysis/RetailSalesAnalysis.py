import pandas as pd
class RetailSalesAnalyzer:
  def __init__(self):
    self.data = pd.read_csv("retail_sales.csv")
