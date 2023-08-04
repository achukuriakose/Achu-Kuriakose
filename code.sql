----------------------Code-----------------------------------
---To view the whole data---
select * from supermarket_sales
select * from supermarket_customers

---1.What is the total number of customers?---
select count(Invoice_ID) as total_number_of_customers
from supermarket_sales

---2.What is the average gross income?---
select avg(gross_income) as average_gross_income
from supermarket_sales

---3.Which city is with the highest sale and what is its gross income?---
select max(gross_income) as highest_gross_income,City
from supermarket_sales
group by City

---4.What is the most selling product line?---
select Product_line,count(Product_line) as count
from supermarket_sales
group by Product_line order by count desc

---5.Which product has the lowest demand---
select Product_line,min(Quantity) as lowest_demand
from supermarket_sales
group by Product_line

---6.How many unique cities does the data has?
select distinct City
from supermarket_sales

---7.In which city is each branch?---
select distinct City,Branch
from supermarket_sales

---8.How many unique product does the data have?
select count(distinct Product_line)
from supermarket_sales

---9.What are the common payment method?
select Payment,count( Payment) as count_pof_payment
from supermarket_sales
group by Payment

---10.What are the top 5 expensive proucts?---
select top 5(Product_line),Unit_price
from supermarket_sales
group by Product_line,Unit_price
order by unit_price desc

---11.What product line has the largest revenue?---
select Product_line,sum(total) as total_revenue
from supermarket_sales
group by Product_line
order by total_revenue desc

---12.What city and branch has the largest revenue?---
select Branch,City,sum(total) as total_revenue
from supermarket_sales
group by City,Branch
order by total_revenue desc

----13.Arrange products in descending order on the basis of tax rate---
select Product_line,Tax_5 
from supermarket_sales
group by Product_line,Tax_5 
order by Tax_5 desc
---14.Which is the most product line by gender?---
select supermarket_sales.Product_line,supermarket_customers.Gender,count(Gender) as total_count
from supermarket_sales_analysis.dbo.supermarket_sales
join supermarket_sales_analysis.dbo.supermarket_customers
on supermarket_sales.Invoice_ID=supermarket_customers.Invoice_ID
group by gender,supermarket_sales.Product_line
order by total_count desc

---15.What is the rating of each product line?---
select supermarket_sales.Invoice_ID,supermarket_customers.Product_line, Rating
from supermarket_sales_analysis.dbo.supermarket_sales
inner join supermarket_sales_analysis.dbo.supermarket_customers
on supermarket_sales.Invoice_ID = supermarket_customers.Invoice_ID

---16.Divide the super market working time into 3 as morning,afternoon and evening
select Time,
(case
when Time between '00:00:00.0000000' and '12:00:00.0000000' then 'Morning'
when Time between '12:01:00.0000000' and '16:00:00.0000000' then 'Afternoon'
else 'Evening'
end) as time_of_date
from supermarket_customers

---17.which are the braches availabe in Yandon city
select  distinct(branch),City
from supermarket_sales
where city ='Yangon'

---18.Which branch sold more products than average product sold?----
select branch,sum(quantity)as quantity
from supermarket_sales
group by branch
having sum(quantity)>(select avg(quantity)from supermarket_sales)

---19.Which of the gender brings the most revenue?---
select supermarket_customers.Gender,sum(Total) as total_revenue
from supermarket_sales_analysis.dbo.supermarket_sales
join supermarket_sales_analysis.dbo.supermarket_customers
on supermarket_sales.Invoice_ID=supermarket_customers.Invoice_ID
group by gender
order by total_revenue desc

----20.Which city has the largest tax percent?
select top 1 City,avg(Tax_5)
from supermarket_sales
group by City,Tax_5
order by Tax_5 desc

---21.Which customer type pays the most tax?
select supermarket_customers.Gender,avg(Tax_5) as avg_tax
from supermarket_sales_analysis.dbo.supermarket_sales
join supermarket_sales_analysis.dbo.supermarket_customers
on supermarket_sales.Invoice_ID=supermarket_customers.Invoice_ID
group by gender
order by avg_tax desc

---22.What is the tax rate,cog and gross income for the product line "food and beverages"?---
select Product_line,Tax_5, cogs,gross_income
from supermarket_sales
where Product_line='Food and beverages'

---24.List of the cities starting  with 'N'---
select distinct(City)
from supermarket_sales
where City like 'N%' 

---25.To display products and its price having a rating greater than 6
 select Product_line,Unit_price
 from supermarket_sales
 where Invoice_ID in
 (select Invoice_ID from supermarket_customers where Rating>6)






