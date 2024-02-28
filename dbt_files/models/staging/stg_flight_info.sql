with 

source as (

    select * from {{ source('staging', 'flight_info') }}

),

renamed as (

    select
        fl_date,
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

    from source

)

select * from renamed
