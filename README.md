# Ingenious Impala
<img src="[https://cdn.vox-cdn.com/thumbor/fmOaV4NnS2R8EjzA1BTk3VcQHuA=/0x0:4552x3033/1200x800/filters:focal(1912x1153:2640x1881)/cdn.vox-cdn.com/uploads/chorus_image/image/55035791/shutterstock_326732741.0.jpg](https://tradebrains.in/features/wp-content/uploads/2022/01/Renewable-energy-Cover-Image-1080x675.jpg)" width=500>

An analytics and data engineering experiment using Uber data. This project requires access to a Databricks worskpace with Unity Catalog enabled. In this project we will be downloading and segmenting data to simulate incremental batch ingestion of data (the most common use case). Data will be incrementally ingested using a Lakeflow Pipeline and run through an ETL pipeline for downstream analytics and featurization.

## Setup
1. Clone this repository into a git folder in Databricks
1. Create a catalog making note of the name (e.g., `development`)
1. Open `00_data_prep` and modify the variables declared in the first cell. These variables set the catalog name, database and storage volume labels.
1. Run the contents of `00_data_prep`. It is recommended to run this notebook in sequence for optimal compatability.
