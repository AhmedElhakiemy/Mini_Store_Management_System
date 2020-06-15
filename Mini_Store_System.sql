create table tb_customer(
    customer_id int primary key,
	customer_name nvarchar(50),
	customer_email nvarchar(50),
	customer_phone int,
	customer_address nvarchar(50)
);
create table tb_product(
    product_id int primary key,
	product_name nvarchar(50),
	product_weight nvarchar(50), 
    product_price int 
);
create table tb_request(
    request_id int primary key,
	request_price int,
	ammount nvarchar(50) ,
	request_date nvarchar(50),
	customer_id int,
	product_id int
);
INSERT INTO tb_customer
VALUES(2,'mohamed','mohamed@yahoo.com',01223257654,'mahram beh');
INSERT INTO tb_customer
VALUES(3,'ali','ali@yahoo.com',01523257654,'sidi gaber');
INSERT INTO tb_customer
VALUES(4,'loay','loay@yahoo.com',01143487960,'mandara');
INSERT INTO tb_customer
VALUES(5,'gaber','gaber@yahoo.com',01143400960,'sidi beshr');
INSERT INTO tb_customer
VALUES(6,'ibrahim','ibrahim@yahoo.com',01149880960,'manshia');
INSERT INTO tb_customer
VALUES(7,'salem','salem@yahoo.com',01149990960,'mohamed atia street');
INSERT INTO tb_customer
VALUES(8,'moustafa','moustafa@yahoo.com',01149777960,'banha');
INSERT INTO tb_customer
VALUES(9,'marwan','marawan@yahoo.com',01149990988,'giza');
select * from tb_customer

INSERT INTO tb_product
Values(11,'cheesse','1k',30);
INSERT INTO tb_product
Values(12,'rice','4k',40);
INSERT INTO tb_product
Values(13,'fruits','1k',37);
INSERT INTO tb_product
Values(14,'juice','1 leter',12);
INSERT INTO tb_product
Values(15,'oil','2 leter',34);
INSERT INTO tb_product
Values(16,'sugar','1 kilo',8);
select * from tb_product

INSERT INTO tb_request
Values(22,210,'5','2 march',2,11);
INSERT INTO tb_request
Values(23,300,'7','3 april',3,12);
INSERT INTO tb_request
Values(24,400,'9','5 june',4,14);
INSERT INTO tb_request
Values(25,340,'6','8 may',5,15);
INSERT INTO tb_request
Values(26,420,'3','23 decembar',6,16);
select * from tb_request

--1-what is the usage of the ASCII function ?
SELECT ASCII(customer_name) AS NumCodeOfFirstChar
FROM tb_customer;
--2-what is the usage of the CHAR function ?
SELECT CHAR(65) AS CodeToCharacter;
--3-how to know the position of any letter in any word?
SELECT CHARINDEX('t', 'customer') AS MatchPosition;
--4-how to contact between two words?
SELECT CONCAT('samy', '.com');
--5-how to know the length of any word?
SELECT DATALENGTH('product');
--6-how to calculate the difference between two words?
SELECT DIFFERENCE('rice', 'fruits');
--7-how to shift left letters in the word?
SELECT LEFT('cheesse', 3) AS ExtractString;
--8-what is the usage of the LEN function?
SELECT LEN('sidi gaber');
--9-how to make the letters of words lower?
SELECT LOWER('mohamed');
--10-what is the usage of the LTRIM function?
SELECT LTRIM('     mohamed atia street') AS LeftTrimmedString;
--11-what is the usage of the NCHAR function?
SELECT NCHAR(65) AS NumberCodeToUnicode;
--12-how to know the number of position of any letter?
SELECT PATINDEX('j', 'juice');
--13-what is the usage of the QUOTENAME function?
SELECT QUOTENAME('abcde');
--14-how to replace two letters in word?
SELECT REPLACE('mohamed', 'm', 'e');
--15-how to reverse the letters of the word?
SELECT REVERSE('aly');
--16-what is the usage of the RIGHT function?
SELECT RIGHT('mohamed', 3) AS ExtractString;
--17-what is the usage of the RTRIM function?
SELECT RTRIM('customer    ') AS RightTrimmedString;
--18-what is the usage of the SPACE function?
SELECT SPACE(14);
--19-how to know the unicode of the word?
SELECT UNICODE('loay');
--20-how to make the letters of the word upper?
SELECT UPPER('manshia');

--SUB Query--


SELECT customer_name FROM tb_customer WHERE customer_id in (SELECT customer_id FROM tb_request WHERE request_id >23)
SELECT customer_email FROM tb_customer WHERE customer_id in (SELECT customer_id FROM tb_request WHERE request_id >22)
SELECT product_name FROM tb_product WHERE product_id in (SELECT product_id FROM tb_request WHERE request_id >14)
SELECT customer_address FROM tb_customer WHERE customer_id in (SELECT customer_id FROM tb_request WHERE request_id >24)
SELECT product_price FROM tb_product WHERE product_id in (SELECT product_id FROM tb_request WHERE request_id >25)

--count and group--

--what is the number of customers ?
SELECT COUNT(customer_id)
  FROM tb_customer
--what is the number of products ?
SELECT COUNT(product_id)
  FROM tb_product
--what is the number of requests?
SELECT COUNT(request_id)
  FROM tb_request

--group statement

SELECT COUNT(customer_id),customer_name
  FROM tb_customer
 GROUP BY customer_name

-- Different join--

 SELECT  customer_name, customer_email, product_price
   FROM tb_customer
   INNER JOIN tb_product
   ON tb_customer.customer_id = tb_product.product_id;

SELECT customer_name, product_price
   FROM tb_customer
   LEFT JOIN tb_product
   ON tb_customer.customer_id = tb_product.product_id;

SELECT customer_email, product_name
  FROM tb_customer
  RIGHT JOIN tb_product
  ON tb_customer.customer_id = tb_product.product_id;

SELECT customer_phone, product_weight
  FROM tb_customer
  FULL JOIN tb_product
  ON tb_customer.customer_id = tb_product.product_id;


SELECT customer_phone,ammount
  FROM tb_customer,tb_request
  WHERE tb_request.customer_id=tb_customer.customer_id


--UPDATE--

UPDATE tb_product 
set product_name='egg' where product_id=16
UPDATE tb_customer
set customer_name='ismail' where customer_id=9
UPDATE tb_customer 
set customer_phone=037563986 where customer_name='moustafa'
UPDATE tb_product 
set product_weight='10' where product_id=16
UPDATE tb_product 
set product_id='18' where product_name='juice'
UPDATE tb_customer
set customer_email='ismail@yahoo.com' where customer_id=9

select*from tb_product
select*from tb_customer

--DELETE--

DELETE from tb_customer where customer_id=6
DELETE from tb_customer where customer_name='salem'
select*from tb_customer

DELETE from tb_product where product_id=11
DELETE from tb_product where product_name='juice'
select*from tb_product

DELETE from tb_request where request_price=400
select*from tb_request