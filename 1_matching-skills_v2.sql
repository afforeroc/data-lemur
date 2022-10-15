SELECT candidate_id
FROM
  (SELECT * FROM candidates WHERE skill = 'Python' OR skill = 'Tableau' OR skill = 'PostgreSQL') Q1
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;