# E-Commerce Inventory Management Database
## Project Overview
A relational database built in MySQL to manage e-commerce inventory, 
shipments, and courier billing for an online business.

---

## Database: proj_no1

## Tables
| Table | Description | Rows |
|---|---|---|
| sku_master | Product catalog with SKU and weight | 65 |
| order_report | Customer orders per SKU | 393 |
| courier_invoice | Shipment and billing details | 124 |
| pincode_zone | Delivery zone mapping by pincode | 108 |
| courier_rates | Fixed and additional courier rates | 1 |
| stock_levels | Derived stock levels and reorder points | 65 |

---

## Relationships
- order_report.sku → sku_master.sku
- courier_invoice.order_id → order_report.extern_order_no
- courier_invoice.warehouse_pincode → pincode_zone.warehouse_pincode
- stock_levels.sku → sku_master.sku

---

## Queries
| Query | Description |
|---|---|
| Query 1 | Retrieve current stock levels for all products |
| Query 2 | Identify products below reorder point |
| Query 3 | Total billing amount per delivery zone |
| Query 4 | Total weight shipped per SKU |
| Query 5 | Order history for a specific SKU |

---

## Files
| File | Description |
|---|---|
| database.sql | Full database export |
| queries.sql | All SQL queries |
| data_dictionary.xlsx | Column descriptions and data types |
| er_diagram.png | Entity Relationship Diagram |
| README.md | Project documentation |

---

## Tools Used
- MySQL 8.0
- MySQL Workbench 8.0

---

## Steps Taken
1. Checked dataset headers and values
2. Corrected headers — replaced spaces with _ and changed to lowercase
3. Corrected data field types (TEXT, DOUBLE, VARCHAR)
4. Imported tables into MySQL
5. Verified row counts
6. Created data dictionary
7. Changed all table contents to lowercase for uniformity
8. Checked and deleted duplicate rows
9. Assigned primary keys
10. Assigned foreign keys
11. Verified and removed duplicate foreign keys
12. Created indexes
13. Removed redundant indexes
14. Created stock_levels table derived from order data
15. Wrote 5 SQL queries
16. Created inventory_alerts view