SELECT datacenters.datacenter_id, monthly_capacity - monthly_demand_by_id as spare_capacity
FROM datacenters
INNER JOIN
(
  SELECT datacenter_id, SUM(monthly_demand) AS monthly_demand_by_id
  FROM forecasted_demand
  GROUP BY datacenter_id
) query1
ON datacenters.datacenter_id = query1.datacenter_id
ORDER BY datacenters.datacenter_id