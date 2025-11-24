# actuarial-loss-ratio-sql-powerbi
An actuarial portfolio project exploring medical insurance data. Focuses on calculating Loss Ratios and analyzing risk segments using SQL and Power BI for practice.
Tamam, emojileri temizledim. GitHub için kopyalayıp yapıştırabileceğin saf hali aşağıdadır:
Insurance Portfolio Analysis: Profitability & Risk Segmentation
Executive Summary
This project presents a comprehensive actuarial analysis of a medical insurance portfolio. The primary objective is to evaluate portfolio profitability by calculating the Loss Ratio across various demographic segments.
By leveraging T-SQL for data manipulation and Power BI for interactive visualization, this study identifies high-risk policyholder groups—specifically focusing on the correlation between smoking status, age, and claim severity—to propose data-driven pricing adjustments.
Business Problem
In health insurance, maintaining a balanced Loss Ratio (Total Claims / Total Premiums) is critical for solvency. This project addresses the following key questions:
 * Which demographic segments are generating technical losses (Loss Ratio > 100%)?
 * How does smoking status impact the pure premium requirements?
 * Are the current premiums sufficient to cover the risk for the "Young & Smoker" cohort?
Repository Structure
├── data/
│   └── medical_insurance.csv    # Raw dataset used for analysis
├── scripts/
│   └── Pricing_Analysis.sql # SQL scripts for data cleaning & KPI calculation
├── dashboard/
│   └── Medical_Insurance_Loss_Ratio_Dashboard.p-bix # Power BI interactive report file
├── images/
│   └── 1.png & 2.png   # Screenshots of the final dashboard
└── README.md                    # Project documentation

Methodology & Technical Approach
1. Data Processing (SQL Server)
The core logic was built using T-SQL. Key techniques included:
 * CTEs (Common Table Expressions): Used to structure the analysis by creating temporary, readable datasets for intermediate calculations (e.g., grouping ages into buckets before aggregation).
 * Conditional Logic (CASE WHEN): Applied to segment continuous variables (Age) into categorical cohorts (Young, Adult, Senior).
 * Aggregations: Calculated total exposure, total claims, and average premiums grouped by multiple dimensions.
2. Key Performance Indicators (KPIs)
The following actuarial metrics were calculated:
 * Loss Ratio: Total Claims Paid / Total Premium Earned
 * Pure Premium: Average claim cost per policyholder.
 * Risk Exposure: Frequency and severity analysis per segment.
3. Visualization (Power BI)
Designed an interactive dashboard to allow stakeholders to filter risk profiles dynamically. Features include:
 * Heatmaps for regional risk distribution.
 * Matrix tables comparing Smoker vs. Non-Smoker Loss Ratios.
Key Insights
> Critical Finding: The "Smoker" segment exhibits a Loss Ratio significantly higher than the portfolio average, indicating underpricing in this specific category.
> 
 * Smoker Impact: Policyholders who smoke have a claim severity roughly higher than non-smokers, necessitating a premium loading review.
 * Demographic Risk: While older groups have higher claim frequency, the young smoker demographic poses a unique profitability challenge due to lower base premiums but unexpectedly high claim spikes.
Authors
 * [kuurtali] - Data Engineering & SQL Analysis
 * [mirhankardes] - Visualization & BI Development
Disclaimer: This project is for academic/portfolio purposes and uses a sample dataset.
