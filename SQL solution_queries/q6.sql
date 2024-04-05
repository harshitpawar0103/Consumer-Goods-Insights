select 
s.customer_code,
c.customer,
round(avg(pre_invoice_discount_pct),4) as average_discount_percentage
from fact_sales_monthly s
join fact_pre_invoice_deductions pd
using (customer_code,fiscal_year)
join dim_customer c
using (customer_code)
where fiscal_year= 2021 and market="India"
group by customer_code
order by average_discount_percentage desc
limit 5

/*ALTERNATIVE
WITH TBL1 AS
(SELECT customer_code AS A, AVG(pre_invoice_discount_pct) AS B FROM fact_pre_invoice_deductions
WHERE fiscal_year = '2021'
GROUP BY customer_code),
     TBL2 AS
(SELECT customer_code AS C, customer AS D FROM dim_customer
WHERE market = 'India')

SELECT TBL2.C AS customer_code, TBL2.D AS customer, ROUND (TBL1.B, 4) AS average_discount_percentage
FROM TBL1 JOIN TBL2
ON TBL1.A = TBL2.C
ORDER BY average_discount_percentage DESC
LIMIT 5 
*/