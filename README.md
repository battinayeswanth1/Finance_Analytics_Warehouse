# Motor Vehicle Insurance Portfolio & Risk Analytics Pipeline

An end-to-end data engineering and business intelligence project optimizing multi-year snapshot insurance data. This repository showcases a full three-tier data pipeline alongside an executive-ready portfolio dashboard built to evaluate underwriting margins and asset risk exposure.

---

## 🛠️ Tech Stack & Skills
* **Database Management System:** MySQL
* **Data Engineering Framework:** Medallion Architecture (Bronze -> Silver -> Gold Layers)
* **ETL / Data Transformations:** Advanced SQL (Data Type Inferences, String-to-Date Parsing, Multi-Row Business Logic Mapping)
* **Business Intelligence:** Power BI Desktop (DAX Modeling, Star Schema Data Warehousing, UI/UX App Layout Design)

---

## 🏗️ Medallion Architecture Implementation

This project implements a structured Medallion Architecture pipeline to safely process, transform, and model 105k+ transactional and snapshot metrics.

### 🥉 Bronze Layer (Raw Ingestion / Staging)
* **Objective:** Mirror and ingest unstructured raw CSV data files (`Motor vehicle insurance data.csv` and `sample type claim.csv`) safely into the database environment.
* **Engineering Strategy:** Implemented a high-performance bulk-loading approach utilizing `LOAD DATA LOCAL INFILE` preceded by explicit table `TRUNCATE` operations. All incoming dates, categorical codes, and mixed float strings were stored strictly as `VARCHAR(50)` fields to insulate the initial ingestion framework from syntax-level type failures.
