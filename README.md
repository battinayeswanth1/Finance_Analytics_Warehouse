# Motor Vehicle Insurance Portfolio & Risk Analytics Pipeline

An end-to-end data engineering and business intelligence project optimizing multi-year snapshot insurance data. This repository showcases a full three-tier data pipeline alongside an executive-ready portfolio dashboard built to evaluate underwriting margins and asset risk exposure.

---

## 🛠️ Tech Stack & Skills
* **Database Management System:** MySQL
* **Data Engineering Framework:** Medallion Architecture (Bronze -> Silver -> Gold Layers)
* **ETL / Data Transformations:** Advanced SQL (Data Type Inferences, String-to-Date Parsing, Multi-Row Business Logic Mapping)
* **Business Intelligence:** Power BI Desktop (DAX Modeling, Star Schema Data Warehousing, UI/UX App Layout Design)

---

## 📊 Executive Business Intelligence Dashboard

To translate the engineered Gold Layer database tables into strategic business value, an enterprise-ready dashboard was developed in Power BI Desktop. The design focuses heavily on high data scannability, interactive navigation, and deep portfolio analysis.

### 🎨 UI/UX Design & Data Scannability
* **Modern Interface Layout:** Built using a custom dark slate theme to reduce cognitive load and highlight critical numerical metrics.
* **App-Style Navigation:** Features a high-impact **Tile Slicer** in the top-left corner (the primary optical focus point) allowing stakeholders to instantly toggle between "Urban" and "Rural" portfolios.
* **Containers & Shapes:** Every visualization card utilizes consistent rounded corners (12px radius) and soft drop-shadow effects, elevating the project from a basic chart collection to a sleek web-application interface.

### 📸 Dashboard Interface
<img width="1430" height="797" alt="MC_cliam_dashboard" src="https://github.com/user-attachments/assets/333ecb0e-44d7-465a-b3c7-5ac38a3f88a8" />

--- 

### 📐 Data Modeling & Core DAX Measures

Due to the multi-year contract snapshots present in the underlying tables, a standard bi-directional relationship would cause severe data bloat. To safeguard the integrity of the data and ensure crisp performance, a **Star Schema** was enforced with strict **Many-to-Many Relationships constrained to a Single Cross-Filter Direction (Dimension filters Fact)**. 

The following key metrics were engineered to drive the analytical engine of the dashboard:

---

## 📜 License

This project is licensed under the MIT License. You are free to use, modify, and share this project with proper attribution.

---

## 👨‍💻 About Me

Hi there! I'm Yeswanth Battina, I’m a Data-driven professional with a focus on turning complex datasets into actionable business insights.
Check out my profile to know more about my work and connect with me on (https://www.linkedin.com/in/yeswanth-battina-519622266/)
