-- models/staging/stg_orders.sql

with source as (
  select * from {{ ref('orders') }}
)

select
  order_id,
  customer_id,
  cast(order_date as date) as order_date,
  cast(amount as numeric) as order_amount
from source
