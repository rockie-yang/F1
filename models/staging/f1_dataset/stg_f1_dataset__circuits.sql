with circuits as (
  select name as circuit_name,
         lat as latitude,
         lng as longitude,
         alt as alitude,
         circuit_id,
         country,
         url as circuit_url,
         circuit_ref,
         location as circuit_location

    from {{ source('f1_dataset', 'circuits') }}
)

select *
  from circuits