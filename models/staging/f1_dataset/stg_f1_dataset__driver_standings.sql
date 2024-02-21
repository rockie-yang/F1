with 

source as (

    select * from {{ source('f1_dataset', 'driver_standings') }}

),

renamed as (

    select
        driver_standings_id,
        race_id,
        driver_id,
        points,
        position,
        position_text,
        wins

    from source

)

select * from renamed
