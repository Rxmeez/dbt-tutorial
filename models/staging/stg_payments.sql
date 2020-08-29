select
    id as payment_id,
    order_id as order_id,
    payment_method as payment_method,
    amount as payment_amount

from {{ source("jaffle_shop", "payments")}}