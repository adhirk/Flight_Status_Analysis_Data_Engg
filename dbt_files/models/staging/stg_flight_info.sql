

with 

source as (

    select * from {{ source('staging', 'flight_info') }}

),

renamed as (

    select *
        
    from source

)

select * from renamed
