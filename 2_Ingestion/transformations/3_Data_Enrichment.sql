CREATE STREAMING TABLE ademianczuk.ncr.s_wind_pred_details
SELECT
  *,
  ((OPT - ACTUAL)) as pred_diff,
  (OPT / MCR) * 100 as pred_perc,
  (ACTUAL / MCR) * 100 as actual_perc
FROM STREAM ademianczuk.ncr.s_updated_wind;



CREATE STREAMING TABLE ademianczuk.ncr.g_wind_stats
WITH per_day_stats AS (
  SELECT
    DATE(FORECAST_DATE_LOCAL) AS day,
    COUNT(*) AS n,
    AVG(ACTUAL) AS mean_value,
    STDDEV_SAMP(ACTUAL) AS stddev_value,
    VAR_SAMP(ACTUAL) AS variance_value,
    MIN(ACTUAL) AS min_value,
    MAX(ACTUAL) AS max_value,
    (MAX(ACTUAL) - MIN(ACTUAL)) AS range_value,
    percentile_approx(ACTUAL, 0.25) AS p25,
    percentile_approx(ACTUAL, 0.5) AS median_value,
    percentile_approx(ACTUAL, 0.75) AS p75,
    mode() WITHIN GROUP (ORDER BY ACTUAL) AS mode_value
  FROM STREAM ademianczuk.ncr.s_wind_pred_details
  GROUP BY DATE(FORECAST_DATE_LOCAL)
)
SELECT
  day,
  n,
  min_value,
  p25,
  median_value,
  mean_value,
  p75,
  max_value,
  (p75 - p25) AS iqr_value,
  stddev_value,
  variance_value,
  range_value,
  mode_value
FROM per_day_stats;
