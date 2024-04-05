with cte as (select channel,
			round(sum(gross_price*sold_quantity)/1000000,2) as GS
			from fact_sales_monthly s
			join dim_customer c
			using (customer_code)
			join fact_gross_price g
			using (product_code,fiscal_year)
			where fiscal_year=2021
			group by channel
            )
select channel,
concat(GS," M") as gross_sales_mln,
concat(round(GS*100/sum(GS) over(),2)," %") as pct
from cte
order by pct desc;




