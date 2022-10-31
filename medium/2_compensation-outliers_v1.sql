SELECT
  employee_id,
  salary,
  status
FROM 
(
  SELECT 
    *,
    (CASE
      WHEN salary >= 2 * avg_salary THEN 'Overpaid'
      WHEN salary <= avg_salary / 2 THEN 'Underpaid'
    END) AS status
  FROM employee_pay AS e1
  INNER JOIN
  (
    SELECT
      title, 
      AVG(salary) AS avg_salary
    FROM employee_pay 
    GROUP BY title
  ) AS e2
  ON e1.title = e2.title
) query
WHERE status IS NOT NULL;