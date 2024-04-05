SELECT concat(monthname(date)," ",year(date))  as month,s.fiscal_year,
round(sum(sold_quantity*gross_price)/1000000,4) as gross_sales_mln
FROM fact_sales_monthly s
join fact_gross_price g using (product_code,fiscal_year)
join dim_customer c using (customer_code) 
where customer = "Atliq Exclusive"
group by month, fiscal_year
