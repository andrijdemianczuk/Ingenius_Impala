SET catalog = "main";
SET database = "{YOUR_UNIQUE_DB}";

CREATE MATERIALIZED VIEW main.{YOUR_UNIQUE_DB}.g_month_stats_vw AS
SELECT 
    month, year,
    MEAN(ACTUAL) as mean_actual,
    MEAN(OPT)as mean_opt,
    MEDIAN(ACTUAL) as med_actual,
    MEDIAN(OPT) as med_opt,
    MODE(ACTUAL) as mode_actual,
    MODE(OPT) as mode_opt
FROM main.{YOUR_UNIQUE_DB}.s_wind_pred_details
GROUP BY month, year