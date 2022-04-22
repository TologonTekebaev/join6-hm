
--1) Вывести всех клиентов из страны Canada
select * from customer where country = 'Canada';
--2) Вывести все страны клиентов
select first_name, last_name, country from customer;
--3) Вывести количество всех заказов
select count(order_number) from orders;
--4) Вывести максимальную стоимость заказа
select max(total_amount) from orders;
--5) Найти сумму всех заказов
select sum(total_amount) from orders;
--6) Найти сумму всех заказов за 2018 год
select sum(total_amount) from orders where order_date between '2018-01-01' and '2018-12-31';
--7) Найти среднюю стоимость всех заказов
select avg(total_amount) as average_price from orders;
--8) Найти среднюю стоимость всех заказов по каждому клиенту
select avg(total_amount), customer_id from orders group by customer_id;
--9) Найти всех клиентов, которые живут в Бразилии или Испании
select * from customer where country = 'Brazil' or country = 'Spain';
--10) Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 500.00$
select * from orders where order_date between '2018-01-01' and '2020-12-31' and total_amount < 500.00;
--11) Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по странам
select * from customer where country in ('Spain', 'Italy', 'German', 'France') order by country;
--12) Найти все страны клиентов, страны которых содержаться в таблице поставщиков
select distinct c.country from customer join supplier c on customer.country = c.country;
--13) Найти всех клиентов, имена которых начинаются на ‘Jo’
select * from customer where customer.first_name like 'Jo%';
--14) Найти всех клиентов, имена которых заканчиваются на ‘a’ и имеют длину ровно 4 символа
select * from customer where first_name like '___a';
--15) Найти количество клиентов по странам
select country, count(*) from customer group by country;
--16) Найти количество клиентов по странам. Вывести в порядке убывания
select country, count(*) from customer group by country order by count(country) desc;
--17) Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id).
-- Отсортировать по сумме
select sum(total_amount),
       count(*) customer_id from orders join customer c on c.id =
       orders.customer_id group by country order by count(total_amount) desc;

--18) Найти общую сумму стоимости заказов и количество заказов по каждому клиенту
-- (customer_id), у которых общее количество заказов больше 20ти

select sum(total_amount), count(*), customer_id, quantity from orders
    join order_item oi on orders.id = oi.order_id where quantity > 20 group by quantity, customer_id;





