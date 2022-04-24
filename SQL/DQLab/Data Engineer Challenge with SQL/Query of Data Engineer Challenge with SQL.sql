-- display a list of products that have a price between 50,000 and 150,000.

SELECT
	*
FROM ms_produk
WHERE harga BETWEEN 50000 AND 150000
GROUP BY 1;



-- Show all products containing the word Flashdisk.

SELECT
	*
FROM ms_produk
WHERE nama_produk LIKE '%Flashdisk%';



-- Show only the names of customers who have only the following titles: S.H, Ir. and Drs.

SELECT
	*
FROM ms_pelanggan
WHERE nama_pelanggan LIKE '%S.H%' OR nama_pelanggan LIKE '%Ir.%' OR nama_pelanggan LIKE '%Drs.%';



-- Display customer names and sort the results by customer_name column from smallest to largest (A to Z).

SELECT
	nama_pelanggan
FROM ms_pelanggan
ORDER BY nama_pelanggan;



-- Show customer names
-- and sort the results by the customer_name column from smallest to largest (A to Z),
-- but title must not be part of the order.

SELECT
	nama_pelanggan
FROM ms_pelanggan
ORDER BY substring_index(nama_pelanggan,". ",-1);



-- Show the name of the customer with the longest name.

SELECT
	nama_pelanggan
FROM ms_pelanggan
WHERE length(nama_pelanggan) IN 
	(SELECT
		MAX(LENGTH(nama_pelanggan))
	FROM ms_pelanggan);



-- Display the name of the person with the longest name (in the top row), 
-- and the name of the shortest person (in the row after).

SELECT
	nama_pelanggan
FROM ms_pelanggan
WHERE LENGTH(nama_pelanggan) IN
	(SELECT
		MAX(LENGTH(nama_pelanggan))
		FROM ms_pelanggan)
OR LENGTH(nama_pelanggan) IN
	(SELECT
		MIN(LENGTH(nama_pelanggan))
		FROM ms_pelanggan)
ORDER BY length(nama_pelanggan) DESC;
