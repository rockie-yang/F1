{{ config(
    meta={'maturity': 'high', 'owner': 'Rockie'},
    tags=["outcome"]
) }}
 with

source as (

    select * from {{ source('f1_dataset', 'constructor_standings') }}

),

renamed as (

    select
        constructor_standings_id,
        race_id,
        constructor_id,
        points,
        position,
        position_text,
        wins

    from source

)

select * from renamed
