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
