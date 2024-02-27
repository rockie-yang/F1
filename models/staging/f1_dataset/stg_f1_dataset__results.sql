with results as (
  select status_id,
         race_id,
         driver_id,
         constructor_id,
         result_id,
          grid,
         position_order,
          points,
          laps,
         fastest_lap_time,
         fastest_lap_speed,
          time as lap_time,
          milliseconds as lap_milliseconds,
          number as lap_number,
         fastest_lap::INTEGER as fastest_lap,
         CASE
             WHEN position = '\N' THEN -1
             ELSE CAST(position AS INTEGER)
           END AS position,
         position_text,
          rank::INTEGER as rank

    from {{ ref('results') }}
),

status_descriptions as (
  select status_id,
         status as status_desc
    from {{ ref('status') }}
),

position_descriptions as (
  select *
    from {{ ref('position_descriptions') }}
),

final as (
  select r.status_id,
         r.race_id,
         r.driver_id,
         r.constructor_id,
         r.result_id,
         r.grid,
         r.position_order,
         r.points,
         r.laps,
         r.fastest_lap_time,
         r.fastest_lap_speed,
         r.lap_time,
         r.lap_milliseconds,
         r.lap_number,
         r.fastest_lap,
         r.position,
         r.rank,
         s.status_desc,
         p.position_desc
    from results as r
    left join position_descriptions as p
  using (position_text)
    left join status_descriptions as s
  using (status_id)
)

select *
  from final
