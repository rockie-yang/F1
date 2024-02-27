with lap_times as (
  select race_id,
         driver_id,
         lap,
         position,
         time,
         milliseconds
    from {{ ref('lap_times') }}
)

select *
  from lap_times