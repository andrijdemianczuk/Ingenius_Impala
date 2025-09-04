-- Please edit the sample below

CREATE STREAMING TABLE
    2_merge_updates
AS SELECT
    customer_name,
    order_number
FROM STREAM READ_FILES(
    "/databricks-datasets/retail-org/sales_orders/",
    format => "json",
    header => true
)