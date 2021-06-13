# Designing an HR Database

This project is about designing an HR Database, which was submitted for Udacity's Data Architect Nanodegree program.

## Files

### Presentation
[hr_db_design_presentation.pdf](hr_db_design_presentation.pdf): Project documentation outlining the business and technical requirements as well as ERD illustrations and scripts for DDL, ETL and CRUD exercises

### Data
[hr-dataset.csv](data/hr-dataset.csv): Input data provided by Udacity exported to csv-flat file

## ERD
See directory [erd/](erd/) for Conceptual, Logical and Physical ERD created using Lucidchart.

### SQL
* [001-create_hr_db](sql/001-create_hr_db.sql): DDL script to create empty normalized (3NF) database
* [002-load_stage_table_from_csv.sql](sql/002-load_stage_table_from_csv.sql): Script for loading data into temporary staging table from csv-flat file export provided
* [003-etl_stage_to_hr_db.sql](sql/003-etl_stage_to_hr_db.sql): Populate database from staging table
* [004-crud.sql](sql/004-crud.sql): Execute CRUD commands to answer Udacity`s questions
* [drop_hr_db.sql](sql/drop_hr_db.sql): Drop the created tables