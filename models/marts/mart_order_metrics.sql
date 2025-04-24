-- models/marts/mart_order_metrics.sql

with orders as (
  select * from {{ ref('stg_orders') }}
)

select
  customer_id,
  count(order_id) as total_orders,
  sum(order_amount) as total_spent
from orders
group by customer_id
