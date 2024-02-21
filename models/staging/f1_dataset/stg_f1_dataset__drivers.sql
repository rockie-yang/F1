with drivers as (
  select driver_id,
         driver_ref,
         number as driver_number,
         code as driver_code,
         forename as driver_first_name,
         surname as driver_last_name,
         dob as driver_date_of_birth,
         nationality as driver_nationality,
         url as driver_url

    from {{ source('f1_dataset', 'drivers') }}
)

select *,
       CONCAT(driver_first_name, ' ' ,driver_last_name) as driver_full_name,
       CAST((EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM driver_date_of_birth)) as INTEGER) as driver_current_age
  from drivers
