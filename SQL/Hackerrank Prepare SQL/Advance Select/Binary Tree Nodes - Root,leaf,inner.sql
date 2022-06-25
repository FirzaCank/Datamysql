/*
You are given a table, BST, containing two columns:
N and P, where N represents the value of a node in Binary Tree, and P is the parent of N

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

1. Root: If node is root node.
2. Leaf: If node is leaf node.
3. Inner: If node is neither root nor leaf node.
*/

SELECT
    N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
        ELSE 'Leaf'
        END AS TYPE
    FROM BST
ORDER BY N ASC