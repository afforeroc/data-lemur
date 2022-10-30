SELECT e.user_id
FROM emails e
INNER JOIN texts t
ON e.email_id = t.email_id
WHERE t.signup_action = 'Confirmed'
AND (EXTRACT(DAY FROM t.action_date) - EXTRACT(DAY FROM e.signup_date)) = 1;