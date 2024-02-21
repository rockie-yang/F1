{{ config(model_maturity='low')}}
with

source as (

    select * from {{ source('f1_dataset', 'constructor_results') }}

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
