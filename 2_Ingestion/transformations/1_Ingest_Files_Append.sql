-- Create our bronze (raw table)
CREATE OR REFRESH STREAMING TABLE ademianczuk.ncr.b_wind_data
AS SELECT * FROM STREAM read_files(
  "/Volumes/ademianczuk/ncr/data/loader/",
  format => "csv"
)