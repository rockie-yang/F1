with pit_stops as (
 select race_id,
        driver_id,
         stop,
         lap,
         time,
         duration,
         milliseconds * 1.0 / 1000 as seconds
   from {{ source('f1_dataset', 'pit_stops') }}
)

select *
  from pit_stops