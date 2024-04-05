select 
concat("Q",quarter(date_add(date,interval 4 month))) as Quarter,
sum(sold_quantity) as `total_sold_quantity`
from fact_sales_monthly s
where fiscal_year=2020
group by Quarter
order by `total_sold_quantity` desc;