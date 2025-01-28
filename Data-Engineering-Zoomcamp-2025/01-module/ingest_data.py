from sqlalchemy import create_engine
import pandas as pd
from time import time
import argparse
import os 

#user 
#password
#host 
#port 
#db
#table name
#url of the csv
#zurl of the csv

def main(params):

    # passing parameters
    user = params.user
    password = params.password
    host = params.host 
    port = params.port
    db = params.db
    table_name = params.table_name
    url = params.url 

    if url.endswith('.csv.gz'):
        csv_name = 'output.csv.gz'
    else:
        csv_name = 'output.csv'
    
    zone_name = 'taxi_zone_lookup.csv'

  
    parquet_name = 'filename.parquet'

    # download the csv 
    os.system(f"wget {url} -O {csv_name}")
    os.system(f"wget {zurl} -O {zone_name}")

    # To Convert parquet file to CSV file 
    # df = pd.read_parquet('filename.parquet', engine='fastparquet')
    # df.to_csv(csv_name)
    

    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{db}')

    df_iter = pd.read_csv(csv_name, iterator=True, chunksize=100000)


    df = next(df_iter)

    df['lpep_pickup_datetime'] = pd.to_datetime(df.lpep_pickup_datetime)
    df['lpep_dropoff_datetime'] = pd.to_datetime(df.lpep_dropoff_datetime)

    df.head(n=0).to_sql(name=table_name , con=engine, if_exists='replace' )

    while True:
      
        s_time = time()
        
        df = next(df_iter)
        
        df['lpep_pickup_datetime'] = pd.to_datetime(df.lpep_pickup_datetime)
        df['lpep_dropoff_datetime'] = pd.to_datetime(df.lpep_dropoff_datetime)

        df.to_sql(name=table_name , con=engine, if_exists='append' )    

        e_time = time()
        
        print('addded another chunks.., took %.3f second '%(e_time - s_time))
        
    df_zones = pd.read_csv(zone_name)
    
    df_zones.to_sql(name='zones', con=engine, if_exists='replace')



if __name__=='__main__':

    parser = argparse.ArgumentParser(description='Ingest CSV data to Postgres')

    parser.add_argument('--user', help = 'user name for postgres')
    parser.add_argument('--password', help='password for postgres')
    parser.add_argument('--host',help = 'host for postgres')
    parser.add_argument('--port', help = 'port for postgres')
    parser.add_argument('--db', help ='databse name for postgres')
    parser.add_argument('--table_name', help='name of the table where we will write the results to')
    parser.add_argument('--url',help='url of the csv file')
    parser.add_argument('--zurl',help='url of the zone csv file')

    args = parser.parse_args()

    main(args)
  
