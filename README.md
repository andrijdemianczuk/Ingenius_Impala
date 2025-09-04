# Ingenious Impala
<img src="Images/Renewable-energy-Cover-Image-1080x675.jpg" width=500>

An analytics and data engineering experiment using data from AESO (Alberta Electric System Operator). This project requires access to a Databricks worskpace with Unity Catalog enabled. In this project we will be downloading and segmenting data to simulate incremental batch ingestion of data (the most common use case). Data will be incrementally ingested using a Lakeflow Pipeline and run through an ETL pipeline for downstream analytics and featurization.

## Setup
1. Clone this repository into a git folder in Databricks
1. Create a catalog making note of the name (e.g., `development`)
1. Open `00_data_prep` and modify the variables declared in the first cell. These variables set the catalog name, database and storage volume labels.
1. Run the contents of `00_data_prep`. It is recommended to run this notebook in sequence for optimal compatability.

## Terminology
* "MCR" refers to the Maximum Continuous Rating in the context of the AESO (Alberta Electric System Operator), which is the maximum net power output an import source asset can sustain. The AESO uses MCR, or maximum capability, to understand the available power from assets and operate Alberta's power grid safely and reliably
* "MW" refers to megawatts, a unit of power that the AESO uses for market operations, managing electricity demand, and planning the transmission system. 
