SELECT candidate_id
FROM
  (
    SELECT candidate_id, string_agg(skill, ' ') AS skill_list 
    FROM (SELECT * FROM candidates ORDER BY candidate_id, skill ASC) Q1
    GROUP BY candidate_id
  ) Q2
WHERE skill_list LIKE '%PostgreSQL Python Tableau%';