with 

source as (

    select * from {{ ref('qualifying') }}

),

renamed as (

    select
        qualify_id,
        race_id,
        driver_id,
        constructor_id,
        number,
        position,
        q1,
        q2,
        q3

    from source

)

select * from renamed
