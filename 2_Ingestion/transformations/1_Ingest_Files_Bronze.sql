-- Create our bronze (raw table)
-- This is a streaming table basically represents a copy of our original data, in it's orginal state. Note that we're not doing any type of merge logic at this point, but rather just bringing in the data 'as-is'. We do this with the intention of preserving the integrity of the source data.

CREATE OR REFRESH STREAMING TABLE ademianczuk.ncr.b_wind_data
AS SELECT * FROM STREAM read_files(
  "/Volumes/ademianczuk/ncr/data/loader/",
  format => "csv"
)