{{ config(materialized='view') }}


with payments as (

    select * from {{ ref('stg_payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

order_payments as (

    select
        order_id,
        sum(payment_amount) as total_payment_amount

    from payments

    group by 1

),


final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        order_payments.total_payment_amount

    from orders

    left join order_payments using (order_id)

)

select * from final