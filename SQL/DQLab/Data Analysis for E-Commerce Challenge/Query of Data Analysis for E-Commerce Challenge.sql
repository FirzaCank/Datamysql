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



-- mencari pembeli yang sudah bertransaksi lebih dari 5 kali, dan setiap transaksi lebih dari 2,000,000.

SELECT
	u.nama_user,
    COUNT(o.order_id) jumlah_transaksi,
    SUM(o.total) total_transaksi,
    MIN(o.total) min_transaksi
FROM
	users u
INNER JOIN
	orders o ON o.buyer_id = u.user_id
GROUP BY
	u.nama_user
HAVING
	jumlah_transaksi > 5 AND min_transaksi > 2000000
ORDER BY 3 DESC;



-- Dropshipper
-- mencari pembeli dengan 10 kali transaksi atau lebih yang alamat pengiriman transaksi selalu berbeda setiap transaksi.

SELECT
	nama_user,
    COUNT(DISTINCT o.kodepos) jumlah_alamat,
    SUM(o.total) total_nilai_transaksi,
    AVG(o.total) avg_nilai_transaksi
FROM orders o
INNER JOIN users u ON o.buyer_id = u.user_id
GROUP BY user_id, nama_user
HAVING jumlah_alamat >= 10
ORDER BY buyer_id;



-- reseller offline
-- pembeli yang punya 8 atau lebih transaksi yang alamat pengiriman transaksi sama dengan alamat pengiriman utama,
-- dan rata-rata total quantity per transaksi lebih dari 10.

SELECT
	nama_user,
    COUNT(1) jumlah_transaksi,
    SUM(total) AS total_nilai_transaksi,
	AVG(total) AS avg_nilai_transaksi,
	AVG(total_quantity) rata_rata_total_quantity
FROM users u
INNER JOIN orders o ON buyer_id = user_id
INNER JOIN 
	(SELECT
		order_id,
		SUM(quantity) total_quantity
	FROM order_details
	GROUP BY order_id) x
USING(order_id)
WHERE o.kodepos = u.kodepos
GROUP BY 1, user_id
HAVING rata_rata_total_quantity > 10 AND jumlah_transaksi >=8
ORDER BY 3 DESC;



-- Pembeli sekaligus penjual
-- mencari penjual yang juga pernah bertransaksi sebagai pembeli minimal 7 kali.

SELECT
	nama_user,
    jumlah_transaksi_beli,
    jumlah_transaksi_jual
FROM users u
INNER JOIN
	(SELECT
		buyer_id,
		COUNT(1) jumlah_transaksi_beli
	FROM orders o
	GROUP BY buyer_id) b
ON b.buyer_id = u.user_id
INNER JOIN
	(SELECT
		seller_id,
		COUNT(1) jumlah_transaksi_jual
	FROM orders
    GROUP BY seller_id) s
ON u.user_id = s.seller_id
WHERE jumlah_transaksi_beli >= 7
ORDER BY 1;
