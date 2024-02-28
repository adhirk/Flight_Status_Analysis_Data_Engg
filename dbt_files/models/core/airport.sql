{{
    config(
        materialized='table'
    )
}}

select *
from {{ ref('airport_lookup') }}