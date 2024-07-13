use retailapp;
-- write query to fetch all tables in retailapp database
show tables;
select* from address;
select*from after_sales_service_at;
select*from bankcard;
select*from brand;
select*from buyer;
select*from category;
select*from comments;
select*from contain;
select*from creditcard;
select*from customer_information;
select*from debitcard;
select*from deliver_to;
select*from depleted_product;
select*from orderitem;
select*from orders;
select*from payment;
select*from price_list;
select*from product;
select*from seller;
select*from servicepoint;
select*from store;
select*from supplier_information;
select*from transaction_detail;
select*from transaction_information;
select*from users;
-- write the query to fetch userid,name,contactphonenumber,city where addrid 1,2,3,4,5 from address?
select userid,name,contactphonenumber,city from address where addrid in (1,2,3,4,5);
-- write the query to make upper case of brand?
select upper(brand) from product;
-- write the query to fetch  the city from servicepoint table where city name middle is 'al' it contain anything left and right side?
select city from servicepoint where city like '%al%';
-- write the query to fetch unique brand?
select distinct(brand) from product; 
-- write the query to fetch name of customer by using phone?
select name from customer_information where phone=7077102278;
-- write the query to convert unstructured way of name to structured way of name in store?
select name from store order by name asc;
-- write the query for to make group of user_id,name in users?
select userid ,name from users group by userid; 
-- write the query to fetch ordernumber ,paymentstatus,where amount greater than 200?
select ordernumber,paymentstate,totalamount from orders where totalAmount>=200;
-- write the query to fetch name from product and max price product?
select brand,max(price) from product group by brand;
-- write the query to convert fetch addrid,userid,name,contactphoneNumber,city and convert unstructured way of name to structured or proper format and make group of city?
select addrid,max(userid),name,contactphonenumber,city from address group by addrid order by city asc;
-- write the query to know maximun quantity? 
select max(quantity) from contain;
-- write the query to fetch name along with maximum price? 
select name,max(price) from product  group by name;
-- write the query for inner joins of product and store column?
select product.sid,product.brand,product.name,product.price,store.name,store.city from product inner join store on product.sid=store.sid where product.price>=100;
-- write the query for left and right joins of userid by using addrss,comments,users columns?
select address.userid,address.name,comments.content,users.name,users.phonenumber from address left join comments on address.userid=comments.userid left join users on comments.userid=users.userid order by address.name asc;
select address.userid,address.name,comments.content,users.name,users.phonenumber from address right join comments on address.userid=comments.userid right join users on comments.userid=users.userid order by address.name asc;
-- write the query for  using product table using group by clause?
select name,max(amount)from product where amount>=50 group by name;
-- write the query for inner joins where userid is common column and fetch the comments grade greater than or equal to 4 and do structured format of name ascending order?
select address.userid,address.city,address.name,comments.grade,users.name from address inner join comments on address.userid=comments.userid inner join users on comments.userid=users.userid where comments.grade>=4 order by address.name asc;
-- write the query for creating index for userid address table?
create index idx_userid on address(userid);
select userid from address;
-- write subqueries for userid in address and comments table?
select name from address where userid in (select userid from comments where grade>=3);
-- write the query to convert creation time date,month,year where creationtime is greater than or equal to 2015/09/19?
select date_format(creationTime,'%d/%m/%y') from orderitem where creationtime>='2015/09/19';
-- write the query for creating stored procedure of order column?
create procedure getalltransactionidproductidquantitydiscounttotal_amount() select transactionid,productid,quantity,discount,total_amount from transaction_detail where total_amount>=1500;
call getalltransactionidproductidquantitydiscounttotal_amount();
-- write the query for view using inner joins by taking userid as common column in address,comments,users?
create view retailuserid as
select address.addrid,address.name,deliver_to.ordernumber,deliver_to.timedelivered from address inner join deliver_to on address.addrid=deliver_to.addrid order by address.name;
select*from retailuserid;