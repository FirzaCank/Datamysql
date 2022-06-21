1. Fetch value above average

SELECT
  score
FROM student
WHERE score > (SELECT
                  AVG(score)
                FROM student)
ORDER BY id;


/*2. Left side is less than right side salary*/

SELECT
  l.name less,
  h.name greater
FROM emp l, emp h
WHERE l.id != h.id AND l.salary < h.salary;

                ATAU

SELECT
  distinct(a.name) low_sal,
  b.name high_sal
FROM emp a join emp b on a.salary < b.salary;


/*3. List Customer And Product Without Sale
- All customers who do not have an invoice
- All products that were not sold
Category: Is this related to "customer" or "product"? Print "customer or "product"
ID: Customer.id (category="customer") or product.id (category="product")
Name: customer.customer_name (category="customer") or product.product_name (category="product")*/

SELECT
   'customer' AS category, c.id as id, customer_name as name
FROM customer c
LEFT JOIN invoice i ON c.id = i.customer_id
WHERE i.id IS NULL
UNION
SELECT 
   'product' AS category, p.id as id, product_name as name
FROM product p
LEFT JOIN invoice_item as ii ON p.id = ii.product_id
WHERE ii.id IS NULL;


/*5. Fetch how many failure & success did each person (name) have? SQL Question*/

SELECT
  name,
  SUM(IF(bug = 0,1,0)) AS failure,
  SUM(IF(bug = 1,1,0)) AS success
FROM buggy
GROUP BY name;

      ATAU
      
SELECT
  t.name, SUM(t.failure) failure, SUM(t.success) success
FROM
  (SELECT
    name,
    CASE
      WHEN bug = 0 THEN COUNT(bug) ELSE 0
    END AS failure,
    CASE
      WHEN bug = 1 THEN COUNT(bug) ELSE 0
    END AS success,
  FROM buggy
  GROUP BY name, bug)t
GROUP BY t.name;
