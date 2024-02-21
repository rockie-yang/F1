WITH driver_points AS (
  SELECT
    d.driver_full_name,
    r.race_year as season,
    max(ds.points) AS total_points
  FROM {{ ref('stg_f1_dataset__driver_standings') }} ds
  JOIN {{ ref('stg_f1_dataset__races') }} r ON ds.race_id = r.race_id
  JOIN {{ ref('stg_f1_dataset__drivers') }} d on ds.driver_id = d.driver_id
  GROUP BY d.driver_full_name, r.race_year
)

SELECT
  driver_full_name,
  season,
  total_points
FROM driver_points
ORDER BY season ASC
