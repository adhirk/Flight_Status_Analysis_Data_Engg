{{
    config(
        materialized='table'
    )
}}

select IATA_CODE, AIRLINE as Airline_Name
from {{ ref('airline_lookup') }}