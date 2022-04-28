-- Find the first and latest order date of each buyer in each shop
SELECT 
  buyerid, 
  MAX(order_time) latest_order, 
  MIN(order_time) first_order 
FROM 
   order_tab 
GROUP BY 
   buyerid;



--  Find buyer that make more than 1 order in 1 month
SELECT 
  buyerid, 
  MONTH(order_time) month, 
  COUNT(order_time) number_of_order							
FROM 
  order_tab 							
GROUP BY 
  buyerid, 
  MONTH(order_time) 							
HAVING 
  COUNT(orderid) > 1							
ORDER BY 
  month;							



-- Find the first buyer of each shop
SELECT *				
FROM 
  (SELECT 
    shopid, 
    buyerid, 
    MIN(order_time) first				
	FROM 
    order_tab			
	GROUP BY 
    buyerid) X			
GROUP BY 
  shopid				
ORDER BY 
  shopid;				



-- Find the TOP 10 Buyer by GMV in Country ID & SG
SELECT 
  order_tab.buyerid, 
  SUM(order_tab.gmv) GMV, 
  user_tab.country						
FROM 
  user_tab						
INNER JOIN 
  order_tab ON user_tab.shopid = order_tab.shopid						
WHERE 
  country = 'ID' OR country = 'SG'						
GROUP BY 
  order_tab.buyerid						
ORDER BY 
  GMV DESC						
LIMIT 10; 						



-- Find number of buyer of each country that purchased item with even and odd itemid number
SELECT q.country, COUNT(q.buyerid) AS total_buyer						
FROM						
	(SELECT u.buyerid, u.country, COUNT(o.itemid) even					
	FROM user_tab u					
	INNER JOIN order_tab o using(buyerid)					
	WHERE itemid%2 = 0					
	GROUP BY u.country, u.buyerid					
	ORDER BY u.country) q					
INNER JOIN						
	(SELECT u.buyerid, u.country, COUNT(o.itemid) odd					
	FROM user_tab u					
	INNER JOIN order_tab o using(buyerid)					
	WHERE itemid%2 = 1					
	GROUP BY u.country, u.buyerid					
	ORDER BY u.country) x					
ON q.buyerid = x.buyerid						
GROUP BY q.country;						



-- Find the number of order/views & clicks/impressions of each shop
SELECT 
  p.shopid, 
  q.total_order, 
  q.total_order/p.item_views AS order_per_view, 
  p.total_clicks/p.impressions AS click_per_impression												
FROM performance_tab p												
INNER JOIN												
	(SELECT shopid, COUNT(orderid) total_order											
	FROM order_tab											
	GROUP BY shopid											
	ORDER BY shopid) q											
ON p.shopid = q.shopid												
GROUP BY p.shopid												
ORDER BY p.shopid;												
