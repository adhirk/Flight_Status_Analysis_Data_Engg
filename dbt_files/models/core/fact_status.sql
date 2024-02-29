{{
    config(
        materialized='table'
    )
}}

with flight_data as (
    select Fl_date,
    op_carrier,
    op_carrier_fl_num,
    origin,
    dest,
    crs_dep_time,
    dep_time,
    dep_delay,
    taxi_out,
    wheels_off,
    wheels_on,
    taxi_in,
    crs_arr_time,
    arr_time,
    arr_delay,
    cancelled,
    diverted,
    crs_elapsed_time,
    actual_elapsed_time,
    air_time,
    distance
    from {{ ref('stg_flight_info') }}
), 

airline_info as (
    select IATA_CODE as airline_IATA_code,
    Airline_Name
    from {{ ref('airline') }}
),

origin_airport as (
    select 
    IATA_CODE as origin_airport_IATA_code,
    airport_name as origin_airport_name,
    CITY as origin_city,
    STATE as origin_state,
    COUNTRY as origin_country,
    LATITUDE as origin_latitude,
    LONGITUDE as origin_longitude
    from {{ ref('airport') }}
),

destination_airport as (
    select 
    IATA_CODE as destination_airport_IATA_code,
    airport_name as destination_airport_name,
    CITY as destination_city,
    STATE as destination_state,
    COUNTRY as destination_country,
    LATITUDE as destination_latitude,
    LONGITUDE as destination_longitude
    from {{ ref('airport') }}
)

select 
flight_data.Fl_date,
flight_data.Op_carrier,
flight_data.Op_carrier_fl_num,
flight_data.Origin,
flight_data.Dest,
flight_data.Crs_dep_time,
flight_data.Dep_time,
flight_data.Dep_delay,
flight_data.Taxi_out,
flight_data.Wheels_off,
flight_data.Wheels_on,
flight_data.Taxi_in,
flight_data.Crs_arr_time,
flight_data.Arr_time,
flight_data.Arr_delay,
flight_data.Cancelled,
flight_data.Diverted,
flight_data.Crs_elapsed_time,
flight_data.Actual_elapsed_time,
flight_data.Air_time,
flight_data.Distance,
airline_info.Airline_IATA_code,
airline_info.Airline_Name,
origin_airport.origin_airport_IATA_code,
origin_airport.origin_airport_name,
origin_airport.origin_city,
origin_airport.origin_state,
origin_airport.origin_country,
origin_airport.origin_latitude,
origin_airport.origin_longitude,
destination_airport.destination_airport_IATA_code,
destination_airport.destination_airport_name,
destination_airport.destination_city,
destination_airport.destination_state,
destination_airport.destination_country,
destination_airport.destination_latitude,
destination_airport.destination_longitude

from flight_data
inner join airline_info 
on flight_data.Op_carrier = airline_info.airline_IATA_code

inner join origin_airport
on flight_data.Origin = origin_airport.origin_airport_IATA_code

inner join destination_airport
on flight_data.Dest = destination_airport.destination_airport_IATA_code
