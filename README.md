# Olist Store Analysis

End-to-end analysis of **99,441 Brazilian e-commerce orders** across 9 linked tables, built with **MySQL, Excel, Tableau and Power BI**.

> Team project (5 members) | Data Analytics Bootcamp | Sep 2026 – Oct 2026

## Problem Statement
When do customers pay, how fast do we deliver, and does delivery speed change how happy customers are?

## Dataset
- [Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce): 9 linked CSV files (orders, items, payments, reviews, products, category translation, customers, sellers, geolocation)
- Raw CSVs are not included here because of file size. Download them from the link above.

## Business KPIs
1. Weekday vs weekend payment value
2. Five-star reviews paid by credit card
3. Average delivery days for Pet Shop orders
4. Average price and payment value for São Paulo customers
5. Shipping days vs customer review score

## Tools Used
| Stage | Tool |
|---|---|
| Data loading and KPI queries | MySQL (`LOAD DATA LOCAL INFILE`, JOINs, CASE WHEN, DATEDIFF) |
| Executive summary dashboard | Excel (Power Query, KPI_Calc sheet) |
| Detailed exploration | Tableau |
| Interactive slicers | Power BI |

## Key Insights
- Weekdays bring **77.3%** of payment value (R$12.37M vs R$3.64M). Average order value is similar: R$161.48 vs R$159.36.
- **43,981** five-star orders were paid by credit card (**77.1%** of all five-star orders). Boleto is next with 11,283.
- Pet Shop orders arrive in about **11 days**, faster than the platform average of 12.6 days.
- Slower delivery goes with lower reviews: 5-star orders arrive in **10.7 days**, 1-star orders in **21.3 days** (correlation r = −0.33). This is a link, not proof of cause.

## Business Recommendations
- Fix the slowest deliveries first, since reviews drop as delivery time grows.
- Monitor delivery days by seller and courier, and flag outliers.
- Send early delivery updates on slow orders.
- Track the same 5 KPIs every month.

## Dashboard Previews
### Excel
<img width="1430" height="1105" alt="Olist_Excel_Dashboard" src="https://github.com/user-attachments/assets/5545eec8-5268-46d3-8efb-d1e983d557c5" />

### Tableau
<img width="1496" height="866" alt="Olist_Tableau_Dashboard" src="https://github.com/user-attachments/assets/8d4513e1-036e-494e-b569-ce6d4a6895e1" />

### Power BI
<img width="1708" height="932" alt="Olist_PowerBI_Dashboard" src="https://github.com/user-attachments/assets/db76818e-fcc4-40ef-a7bd-cef7fa0432a8" />

## Known Limitations
Some KPIs differ slightly between tools because of different filters and join definitions: Pet Shop delivery is 11.31 days (SQL), 11.4 (Excel), 11.37 (Power BI) and 10.91 (Tableau). Reconciling KPI definitions is the next step.

## Repository Files
| File | Description |
|---|---|
| `Olist Store SQL.sql` | MySQL queries for all 5 KPIs |
| `Olist_Store_Analysis.xlsx` | Excel analysis and dashboard |
| `Olist Store Tableau.twbx` | Tableau dashboard |
| `Olist Store Power BI.pbix` | Power BI dashboard |
| `Olist Store PPT.pptx` | Final presentation |
| `Olist_Dashboard.pdf` | Excel dashboard (PDF) |

## My Contribution
Excel analysis and dashboard.

## Team
Anne Saadhuri · Malepati Rajitha · **Jeeban Jyoti Das** · Sasmita Panigrahi · Bathala Siva Kumar
