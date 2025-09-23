# Lab 1: Extending the Pipeline
Now that we have our pipeline framework up and running, we need to consider how we'd extend it. Look at the pipeline graph and consider how the data can be leveraged at different points.
<br/><br/>
<hr/>

1. What kind of extension can we build off the silver tables? How would the silver tables be used for a different branch of downstream logic for our pipeline? Try creating a fork in the logic to create a different type of gold table and materialized view.<br/><br/>
1. We created a constraint on `FORECAST_DATE_LOCAL` essentially guaranteeing it's presence so CDC will maintain it's integrity. Try creating some constraints on the numeric fields to further improve data quality and reliability. Try quarantining violations to a different table rather than dropping them altogether. This might be useful for audits.<br/><br/>
1. Why might CDC data be useful to the business? What purpose can it serve? Try working with the CDC table to see how we can audit the changes over time.