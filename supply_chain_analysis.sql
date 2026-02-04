use mahendra;
#1) Total Inventory
Select sum(quantity_on_hand) as Total_Inventory_in_hand from f_inventory;
-- Minimun Stock Quantity
Select min(quantity_on_hand) as min_stock_inventory from f_inventory;
-- Maximum Stock Quantity
Select max(quantity_on_hand) as max_stock_inventory from f_inventory;

#2) Total Sales
Select sum(sales_amount) as Total_sales from f_pos;

#3) Product Wise Sales
Select p.product_name, sum(s.sales_amount) as Total_Sales from product p join f_pos s on p.product_key = s.product_key
group by p.product_name order by Total_sales desc limit 5;

#4) Purchase Method Wise Sales
Select s.purchase_method, sum(p.sales_amount) as Sales from f_sales s join f_pos p on s.Order_Number = p.order_number 
group by Purchase_Method;

#5) State Wise Sales
Select c.cust_state State, sum(p.sales_amount) as Total_Sales from customer c left join f_sales s on c.Cust_Key = s.Cust_Key
left join f_pos p on p.order_number = s.Order_Number group by Cust_State order by Total_Sales desc limit 5;

#6) Region Wise Sales
select c.cust_region Region, sum(p.sales_amount) as Total_Sales from customer c left join f_sales s on c.cust_key = s.Cust_Key
left join f_pos p on p.order_number = s.Order_Number group by Cust_region;

#7) Top 5 Store Wise Sales
Select c.store_name Store_Name, sum(p.sales_amount) as Total_Sales from store c left join f_sales s on c.store_key=s.Store_Key
left join f_pos p on p.Order_Number=s.Order_Number group by Store_Name order by Total_Sales desc limit 5;

#8) Total Sales Year Wise
Select c.Fiscal_Year, sum(p.sales_amount) as Total_Sales from calendar c join f_sales s 
on date(c.Date) = date(s.Date) join f_pos p on p.order_number = s.order_number group by Fiscal_Year order by Fiscal_Year; 
 
#9) Total Sales Qurter Wise
 Select c.Fiscal_Year,c.Fiscal_Quarter,sum(sales_amount) Total_Sales from calendar c join f_sales s
 on date(c.Date)=date(s.Date) join f_pos p on p.Order_Number= s.Order_Number
 group by Fiscal_Year,Fiscal_Quarter order by Fiscal_Year,Fiscal_Quarter;
 
#10) Total Sales Month Wise
  Select c.Fiscal_Year,monthname(c.Date) as Month,sum(sales_amount) Total_Sales from calendar c join f_sales s 
  on date(c.Date)=date(s.Date) join f_pos p on p.Order_Number= s.Order_Number
 group by Fiscal_Year,monthname(c.date) order by Fiscal_Year,monthname(c.date);



    
    
 










