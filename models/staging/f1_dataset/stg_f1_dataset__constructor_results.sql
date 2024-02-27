{{ config(model_maturity='low')}}
with

source as (

    select * from {{ ref('constructor_results') }}

),

renamed as ( 

    select
        constructor_results_id,
        race_id,
        constructor_id,
        points,
        status

    from source

)

select * from renamed
