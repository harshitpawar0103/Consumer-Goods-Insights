with cte as  (
			  select division,
					product_code,
					product,
					sum(sold_quantity) as total_sold_quantity
			  from fact_sales_monthly s
			  join dim_product p
			  using(product_code)
			  where fiscal_year=2021
			  group by product_code
              ),
	 cte2 as (
              select *, 
			  rank() over(partition by division order by total_sold_quantity desc) as rank_order
			  from cte
              )
select *
from cte2
where rank_order<=3;
