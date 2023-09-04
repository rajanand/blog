# Introduction to Azure data factory for SSIS developers
Azure data factory is a cloud based ETL and data integration service. It helps you to create a data driven workflow to 
- transform data
- orchestrate data movement.


- Serverless - You do not have to install any software.
- Managed Cloud Service - 

It helps you with ETL/ELT, and data-ingestion project.

Multiple data sources ⇒ Ingest the data using ADF ⇒ Azure data lake storage ⇒ Analysis services to analyze the data ⇒ Power BI/Tableau to visualize the data.

Azure data factory
- If you are a SSIS user and you have been using SSIS packages to extract, transform and load data, ADF has an ability to run the SSIS packages on cloud.
- If you are a BIG data user and you want to manage a large amount of data and do ETL on thema and use other cloud services like Azure Synapse Analytics, data lake, azure analysis services, Azure databricks.

In both the cases, you can use on-prem and cloud services.

Azure data factor is a single cloud service from Microsoft for data integration. This ADF service uses multiple cloud services internally to make the data integration.

## How ADF works

### ADF functions:
#### Connect and collect
####  Transform and enrich data
####  CI/CD and publish the data
####  Monitoring

### ADF components:

#### Pipelines
This is similar to the control flow in SSIS. This defines how the data execution happens.
#### Activity
There are three types activities in ADF.
- data movement
- data transformation
- control activity
#### Datasets
This is similar to a source or destination task in data flow. Basically, you need to connect to some data to read or write to a destination data.
#### Linked Services
This is similar to a connection manager in SSIS where you will have the connection information of various source / destination tasks.
#### Data flows
- Data transformation logic without code. This data flow run as activity.
#### Integration runtimes
Integration run time is a bridge between activity and linked service.
For example, If you have an on-premises SQL Server, the connection information is stored in the linked service. The self-hosted integration runtime is installed in the on-prem. So that the activity in data pipeline, can connect to the on-prem SQL Server.

If the data flow needs to connect to other Azure services, then Azure integration runtime will be used.

## When to use Azure Data Factory?

- It's a graphical tool. So you need a coding experience to start using ADF.
- If you are dealing with big data systems or the traditional relational data warehouse, you might be interested in a data integration solution like ADF.
- If you have been using SSIS for the data integration, you will be benefit by moving to ADF to run your SSIS packages. You can use both cloud and on-prem sources.
- If you are having a trouble in maintaining servers for the data integration, you might to interested in ADF as it is a serverless infrastructure meaning you don't manage the servers but Microsoft manages it for you. 
- If you have been maintaining a custom solution for data integration, the chances are that it involves lot of discrete components and maintaining them could be a nightmare when more and more customization is required. You might be interested in ADF service as it is a single cloud service for data integration.
