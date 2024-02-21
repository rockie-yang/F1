with lap_times as (
  select race_id,
         driver_id,
         lap,
         position,
         time,
         milliseconds
    from {{ source('f1_dataset', 'lap_times') }}
)

select *
  from lap_times