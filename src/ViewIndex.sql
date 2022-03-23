CREATE DATABASE viewIndex;
USE viewIndex;

CREATE TABLE Products(
                         id int,
                         product_Code int,
                         product_name nvarchar(50),
                         product_price double,
                         product_Amount int,
                         product_description nvarchar(255),
                         product_status boolean
);

insert into Products value (
                            1,1,'java',20000.00,100,'oop',true
    );
insert into Products value (2,2,'php',30000.00,50,'css',true);
insert into Products value (3,3,'javascript',45000.00,150,'toan tu',true);
insert into Products value (4,4,'C#',35000.00,250,'Abstracs',true);

ALTER TABLE Products ADD UNIQUE index_name(product_Code);
EXPLAIN SELECT  * FROM Products WHERE product_Code = 316;

CREATE VIEW product_view as
SELECT product_Code, product_name, product_status
FROM Products;
SELECT * FROM product_view;

CREATE OR REPLACE VIEW product_view as
SELECT product_name
FROM Products
WHERE product_name = 'Dien may';

DROP VIEW product_view;

DELIMITER //
CREATE PROCEDURE findAllProduct()
BEGIN
    SELECT * FROM Products;
end;
DELIMITER ;

call findAllProduct();


/*
 Tạo store procedure
 thêm một sản phẩm mới
 */
delimiter //
create procedure procedure_name_new(
    in id int,
    in product_code int,
    in product_name nvarchar(50),
    in product_price double,
    in product_Amount int,
    in product_description nvarchar(50),
    in product_status boolean)
begin
    insert into Products values (id,product_code,product_name,product_price,product_Amount,product_description,product_status);
end //
delimiter ;
call procedure_name_new(5,5,'java_1',46000.00,300,'abc',true);
call procedure_name_new(4,8,'java_3',46000.00,300,'abc',false);
call procedure_name_new(3,9,'java_2',56000.00,300,'abc',false);
select *
from Products;


/*
 Tạo store procedure sửa thông tin sản phẩm theo id
 */

delimiter //
create procedure edit_product(
    in in_id int,
    in in_product_code int,
    in in_product_name nvarchar(50),
    in in_product_price double,
    in in_product_Amount int,
    in in_product_description nvarchar(50),
    in in_product_status boolean)
begin
    update Products
    set
        product_Code=in_product_code,
        product_name=in_product_name,
        product_price=in_product_price,
        product_Amount = in_product_Amount,
        product_description = in_product_description,
        product_status = in_product_status
    where id=in_id;

end //
delimiter ;
call edit_product(5,10,'java_10',5000000.00,100,'xyz',true);
select *
from Products;

# Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_products(
    in in_id int)
begin
    delete from Products
    where id=in_id;
end //
call delete_products(5);
select *
from Products;




