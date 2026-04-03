CREATE view gold.subcatogries
 as 
 SELECT* from OPENROWSET(bulk'https://datalake221297.blob.core.windows.net/silver/subcatogries/',FORMAT='parquet')
 as quer1
 select * from gold.products