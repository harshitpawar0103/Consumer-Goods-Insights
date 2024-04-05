with cte1 as   (select segment,count(distinct p.product_code) as X 
				from fact_sales_monthly s
				join dim_product p
				on p.product_code=s.product_code
				where fiscal_year =2020
				group by segment),
	cte2  as   (select segment,count(distinct p.product_code) as Y
				from fact_sales_monthly s
				join dim_product p
				on p.product_code=s.product_code
				where fiscal_year =2021
				group by segment)
select A.segment,X as product_count_2020,Y as product_count_2021,(Y-X) as diff
from cte1 A
join cte2 B
on A.segment=B.segment