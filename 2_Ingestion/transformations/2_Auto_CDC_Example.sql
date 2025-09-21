CREATE OR REFRESH STREAMING TABLE main.{YOUR_UNIQUE_DB}.s_updated_wind
TBLPROPERTIES ("quality" = "silver");

CREATE FLOW flow -- A 'flow' is a description of a pipeline. We use this to 'declare' what we want to happen in a pipeline.
AS AUTO CDC INTO -- What we want to happen, and where it's going into.
  main.{YOUR_UNIQUE_DB}.s_updated_wind
FROM STREAM(main.{YOUR_UNIQUE_DB}.b_wind_data)
  KEYS (FORECAST_DATE_LOCAL) -- The key refers to our 'merge' identifier. There can be several keys chained together.
  SEQUENCE BY FORECAST_DATE_LOCAL -- This is a required field. It defines the 'order' or sequence to which the data is being ingested.
  STORED AS SCD TYPE 1; -- Whether or not to handle updates as UPSERTs or append a new row with a start/end time for the old values.