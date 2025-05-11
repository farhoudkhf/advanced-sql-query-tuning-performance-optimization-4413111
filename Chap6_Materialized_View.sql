-- Materialized View
CREATE MATERIALIZED VIEW mv_staff AS 
  SELECT 
    s.last_name,
    s.department,
    s.job_title,
    cr.company_regions
  FROM staff s 
    INNER JOIN company_regions cr 
    ON cr.region_id = s.region_id
  
-- at the time of mv created
SELECT * FROM mv_staff;

-- update/refresh the mv
REFRESH MATERIALIZED VIEW mv_staff;

-- need to use trigger if update need to be done at anytime source has been changed 