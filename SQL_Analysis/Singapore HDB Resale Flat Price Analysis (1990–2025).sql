USE sg_resale_flat_prices;

#Trend of average resale price overtime:
SELECT 
	date_type, 
	LEFT(month,4) AS year,
	ROUND(AVG(resale_price),0) AS avg_price, 
	COUNT(*) AS tx_count
FROM ResaleFlatPrices
GROUP BY date_type, LEFT(month,4)
ORDER BY date_type, year;


#Most Expensive vs. Most Affordable Towns (Latest Year)
SELECT
	town,
	ROUND(AVG(resale_price),2) AS average_resaleprices
FROM resaleflatprices
WHERE 
	LEFT(month,4) = (SELECT MAX(LEFT(month,4)) 
					FROM resaleflatprices)
GROUP BY town
ORDER BY average_resaleprices;

#Impact of Floor Area on Resale Price
SELECT 
    FLOOR(floor_area_sqm/10)*10 AS area_bucket,
    ROUND(AVG(resale_price), 0) AS avg_price
FROM ResaleFlatPrices
GROUP BY FLOOR(floor_area_sqm/10)*10
ORDER BY area_bucket;

#Effect of Lease Commencement Year on Resale Price
SELECT 
	lease_commence_date,
    ROUND(AVG(resale_price),0) AS average_resale_price
FROM resaleflatprices
GROUP BY lease_commence_date
ORDER BY lease_commence_date;

#Flat Type Price Comparison
SELECT 
	flat_type,
    ROUND(AVG(floor_area_sqm),0) AS average_area,
    ROUND(AVG(resale_price),0) AS average_price
FROM resaleflatprices
GROUP BY flat_type
ORDER BY average_price DESC;

#Price Distribution by Storey Range
SELECT
	storey_range,
    ROUND(AVG(resale_price),0) AS average_resaleprices
FROM resaleflatprices
GROUP BY storey_range
ORDER BY average_resaleprices DESC;

#Approval vs. Registration Date Comparison
SELECT 
    date_type,
    ROUND(AVG(resale_price), 0) AS avg_price,
    COUNT(*) AS transactions
FROM ResaleFlatPrices
GROUP BY date_type;

#Top 5 Highest Resale Transactions
SELECT 
    month, town, flat_type, block, street_name, resale_price
FROM ResaleFlatPrices
ORDER BY resale_price DESC
LIMIT 5;


