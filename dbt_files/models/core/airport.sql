{{
    config(
        materialized='table'
    )
}}

select IATA_CODE, AIRPORT as airport_name, CITY, STATE, COUNTRY, LATITUDE, LONGITUDE
from {{ ref('airport_lookup') }}