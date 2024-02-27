with 

source as (

    select * from {{ ref('status') }}

),

renamed as (

    select
        status_id,
        status

    from source

)

select * from renamed
