(select p.product_code,product,manufacturing_cost
from dim_product p 
join fact_manufacturing_cost m
on m.product_code=p.product_code
order by manufacturing_cost desc
limit 1)
union
(select p.product_code,product,manufacturing_cost
from dim_product p 
join fact_manufacturing_cost m
on m.product_code=p.product_code
order by manufacturing_cost asc
limit 1)

/*alternative
SELECT F.product_code, P.product, F.manufacturing_cost 
FROM fact_manufacturing_cost F JOIN dim_product P
ON F.product_code = P.product_code
WHERE manufacturing_cost
IN (
	SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
    UNION
    SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
    ) 
ORDER BY manufacturing_cost DESC ;
*/