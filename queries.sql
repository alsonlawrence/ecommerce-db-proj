-- ================================================
-- Project: E-Commerce Inventory Management
-- Database: proj_no1
-- Description: SQL Queries for Inventory Analysis
-- ================================================

-- Query 1: Retrieve current stock levels for all products
-- Shows all SKUs with their available quantity and reorder point
SELECT 
    s.sku,
    sl.quantity_available,
    sl.reorder_point
FROM sku_master s
JOIN stock_levels sl ON s.sku = sl.sku
ORDER BY sl.quantity_available DESC;

-- ------------------------------------------------

-- Query 2: Identify products below reorder point
-- Shows SKUs that need immediate reordering
SELECT 
    s.sku,
    sl.quantity_available,
    sl.reorder_point
FROM sku_master s
JOIN stock_levels sl ON s.sku = sl.sku
WHERE sl.quantity_available <= sl.reorder_point
ORDER BY sl.quantity_available ASC;

-- ------------------------------------------------

-- Query 3: Total billing amount per delivery zone
-- Shows shipment count and total billing per zone
SELECT 
    pz.zone,
    COUNT(ci.awb_code) as total_shipments,
    SUM(ci.billing_amount_php) as total_billing_amount
FROM courier_invoice ci
JOIN pincode_zone pz 
    ON ci.warehouse_pincode = pz.warehouse_pincode
    AND ci.customer_pincode = pz.customer_pincode
GROUP BY pz.zone
ORDER BY total_billing_amount DESC;

-- ------------------------------------------------

-- Query 4: Total weight shipped per SKU
-- Shows total quantity ordered and total weight per SKU
SELECT 
    o.sku,
    SUM(o.order_qty) as total_qty_ordered,
    SUM(o.order_qty * s.weight_in_grams) as total_weight_grams
FROM order_report o
JOIN sku_master s ON o.sku = s.sku
GROUP BY o.sku
ORDER BY total_weight_grams DESC;

-- ------------------------------------------------

-- Query 5: Order history for a specific SKU
-- Shows all orders, shipments and billing for a given SKU
-- Change the SKU value in WHERE clause to query different products
SELECT 
    o.extern_order_no,
    o.sku,
    o.order_qty,
    ci.awb_code,
    ci.zone,
    ci.type_of_shipment,
    ci.billing_amount_php
FROM order_report o
JOIN courier_invoice ci ON o.extern_order_no = ci.order_id
WHERE o.sku = '8904223818850'
ORDER BY ci.billing_amount_php DESC;

-- ------------------------------------------------

-- Inventory Alert View
-- Shows stock status for all SKUs
SELECT * FROM inventory_alerts;