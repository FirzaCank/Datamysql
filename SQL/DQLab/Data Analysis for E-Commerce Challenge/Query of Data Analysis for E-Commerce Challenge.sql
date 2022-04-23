-- 10 Transaksi terbesar user 12476

SELECT
  seller_id,
  buyer_id, 
  total as nilai_transaksi,
  created_at as tanggal_transaksi
FROM 
  orders
WHERE 
  buyer_id = 12476
GROUP BY 
  order_id
ORDER BY 
  3 desc
limit 10;


-- Transaksi per bulan tahun 2020

SELECT 
  EXTRACT(YEAR_MONTH FROM created_at) as tahun_bulan,
  COUNT(1) jumlah_transaksi, 
  SUM(total) total_transaksi
FROM 
	orders
WHERE 
	created_at >= '2020-01-01'
GROUP BY 
	tahun_bulan
ORDER BY 
	tahun_bulan;
  
  
  -- Pengguna dengan rata-rata transaksi terbesar di Januari 2020

SELECT
    buyer_id,
    count(1) jumlah_transaksi,
    AVG(total) rata_rata_transaksi
FROM orders
WHERE created_at BETWEEN '2020-01-01' AND '2020-02-01'
GROUP BY 
	buyer_id
HAVING COUNT(1) >= 2
ORDER BY 
	rata_rata_transaksi DESC
limit 10;



-- Kategori Produk Terlaris dengan total quantity terbanyak di 2020,
-- hanya untuk transaksi yang sudah terkirim ke pembeli

SELECT 
	p.category,
	SUM(o.quantity) total_quantity,
    SUM(o.price) total_price
FROM orders od
INNER JOIN 
	order_details o USING(order_id)
INNER JOIN 
	products p USING(product_id)
WHERE 
	od.delivery_at IS NOT NULL 
	AND 
	od.delivery_at >= '2020-01-01'
GROUP BY 
	p.category
ORDER BY 
	total_quantity DESC
LIMIT 5;
