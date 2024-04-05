select s20.X as unique_products_2020, s21.Y as unique_products_2021,round((Y-X)/X*100,2) as percentage_chg
from (select count(distinct product_code) as X from fact_sales_monthly
      where fiscal_year=2020) s20,
	 (select count(distinct product_code) as Y from fact_sales_monthly
      where fiscal_year=2021) s21;