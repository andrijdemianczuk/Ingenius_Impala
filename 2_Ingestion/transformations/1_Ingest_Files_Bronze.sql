-- Create our bronze (raw table)
-- This is a streaming table basically represents a copy of our original data, in it's orginal state. Note that we're not doing any type of merge logic at this point, but rather just bringing in the data 'as-is'. We do this with the intention of preserving the integrity of the source data.

-- The standard pattern to ingest data is to stage it first before applying any sort of changes or ETL. We see this pattern in managed connectors as well.

CREATE OR REFRESH STREAMING TABLE main.{YOUR_UNIQUE_DB}.b_wind_data (
    CONSTRAINT no_sequence EXPECT (FORECAST_DATE_LOCAL IS NOT NULL) ON VIOLATION DROP ROW,
    CONSTRAINT no_gmt EXPECT (FORECAST_DATE_GMT IS NOT NULL) ON VIOLATION DROP ROW
)
TBLPROPERTIES ("quality" = "bronze", "pipelines.schema.autoMerge" = "false")
AS SELECT * FROM STREAM read_files(
  "/Volumes/main/{YOUR_UNIQUE_DB}/data/loader/",
  format => "csv"
)