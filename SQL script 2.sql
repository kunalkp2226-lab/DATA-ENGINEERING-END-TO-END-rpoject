create DATABASE scoped credential cred_kunal
with 
IDENTITY = 'Managed Identity'
create external data source source_silver 
with ( location = 'https://datalake221297.blob.core.windows.net/silver',
CREDENTIAL = cred_kunal)
create external data source source_gold 
with ( location = 'https://datalake221297.blob.core.windows.net/gold',
CREDENTIAL = cred_kunal)
CREATE EXTERNAL FILE FORMAT format_parquet
with ( FORMAT_TYPE= PARQUET,
DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec')

create external table gold.extsales with
(location = 'extsales',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet)
as select * FROM gold.salesvisual