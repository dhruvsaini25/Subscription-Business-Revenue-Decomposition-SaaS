# SaaS-Subscription-Business-Revenue-Decomposition

## 📌 Project Overview
This project analyzes **why subscription revenue (ARR/MRR) changes over time** in a SaaS business by decomposing revenue movements into clear, actionable drivers.  
Instead of focusing only on total revenue, the analysis explains *what caused* revenue to grow or decline.

The project converts raw transaction-level SaaS sales data into a **monthly subscription revenue model** and applies revenue bridge logic commonly used by SaaS and growth analytics teams.

---

## 🎯 Business Problem
For subscription-based businesses, tracking total ARR alone is insufficient.  
Revenue changes must be explained through:

- New customer acquisition
- Expansion from existing customers
- Contraction due to downgrades
- Churned customers
- Reactivated customers

This project answers:
> *Why did ARR increase or decrease in a given month?*

---

## 🧠 Methodology

### 1. Data Transformation
- Raw [AWS SaaS sales transaction data](https://www.kaggle.com/datasets/nnthanh101/aws-saas-sales/data?select=SaaS-Sales.csv)  were aggregated into **monthly customer-level revenue (MRR)**.
- Missing customer-month combinations were filled with zero revenue to accurately capture churn behavior.
- A clean monthly subscription snapshot was created for each customer.

### 2. Revenue Decomposition Logic
Month-over-month revenue movements were categorized into:
- **New MRR**
- **Expansion MRR**
- **Contraction MRR**
- **Churned MRR**
- **Reactivation MRR**

Using the core relationship:

Ending MRR = Starting MRR + New MRR + Expansion MRR + Reactivation MRR - Contraction MRR - Churned MRR

### 3. Analysis & Visualization
- SQL window functions were used to compare customer revenue across months.
- An interactive Tableau dashboard was built to visualize ARR trends, revenue bridges, and segment-level patterns.

---

## 📊 Key Findings
- ARR growth in recent years is largely acquisition-led rather than expansion-led.
- Although ARR is growing, churn has increased year-over-year, offsetting a large share of new revenue.
- Existing customers are not significantly increasing spend, indicating limited upsell or seat expansion.
- Revenue loss is driven more by full customer churn than by partial downgrades.
- SMB customers contribute disproportionately to churn while generating limited expansion value.
  - SMB acquisition may look good on paper, but it weakens ARR quality and predictability.
- ARR is geographically concentrated, increasing exposure to region-specific churn or slowdown.

![SaaS-Revenue-Decomposition-Dashboard](/tableau/dashboard-images/Dashboard.png)

---

## 🛠️ Tools & Technologies
- **Python (pandas, numpy)** – data cleaning & monthly subscription modeling
- **SQL** – revenue decomposition using window functions
- **Tableau** – interactive dashboards & revenue storytelling

---

## 📂 Project Structure

```
├── data/
│ ├── cleaned_sales.csv
│ ├── monthly_mrr.csv
│ ├── raw_amazon_saas_sales_.csv
│
├── notebooks/
│ ├── 01_data_cleaning.ipynb
│ ├── 02_mrr_monthly_build.ipynb
│
├── sql/
│ ├── mrr_decomposition.sql
│
├── tableau/
│ ├── dashboard-images/
│ ├── SaaS-revenue-decomposition-dashboard.twbx
│
├── saas_mrr.csv
├── saas_mrr.db
├── saas_mrr_customer_month.csv
└── README.md
```

## 🚀 Outcome
This project demonstrates how transaction-level SaaS data can be transformed into **decision-ready revenue insights**, enabling stakeholders to understand not just *how much* revenue changed, but *why* it changed.

---

## 👤 Author
[Dhruv Saini](https://www.linkedin.com/in/dhruv-saini-09287529a/)

Data Analytics | SQL • Python • Tableau


