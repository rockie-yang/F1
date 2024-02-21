with 

source as (

    select * from {{ source('f1_dataset', 'status') }}

),

renamed as (

    select
        status_id,
        status

    from source

)

select * from renamed
