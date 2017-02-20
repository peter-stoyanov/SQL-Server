/*--16

create view v_UserWithCountries 
AS 
select c.FirstName + ' ' + c.LastName as CustomerName,c.Age,c.Gender,cs.Name as CountryName
from Customers c
join Countries cs
on c.CountryId = cs.Id
*/



--17  could be No RatingS!

/*CREATE FUNCTION dbo.udf_GetRating3 (@productname NVARCHAR(50))
RETURNS NVARCHAR(50)
AS BEGIN
    DECLARE @rating NVARCHAR(50)
        DECLARE @ratingNum decimal(4,2)

    SET @ratingNum = (
        select avg(f.Rate)
        from Feedbacks f
        join Products p
        on f.ProductId = p.Id
        where p.Name = @productname
    )

    set @rating = (
        SELECT CASE
    WHEN @ratingNum < 5 THEN 'Bad'
    WHEN @ratingNum >= 5 and @ratingNum < 8 THEN 'Average'
        WHEN @ratingNum > 8 THEN 'Good'

    ELSE 'No rating'
END
    )

    

    RETURN @rating
END
*/
/*

SELECT TOP 5 Id, Name, dbo.udf_GetRating3(Name)
FROM Products
ORDER BY Id*/

--drop function udf_GetRating

--18 procedure

/*create proc usp_SendFeedback @CustomerID int,
@ProductId int,
@Rate decimal(4,2),
@Description nvarchar(255)

As

begin TRAN

declare @oldratings int = (
    select count(*)
    from Feedbacks f
    where f.CustomerId = @CustomerID
        and f.ProductId = @ProductId 
) ;

If (@oldratings >= 3)
    BEGIN
        rollback;
        RAISERROR ('You are limited to only 3 feedbacks per product!', 16, 1);
        return;
    end


insert into Feedbacks(CustomerId,ProductId,Rate,Description) 
Values (@CustomerID,@ProductId,@Rate,@Description);


commit*/

/*
    CREATE TRIGGER T_Products_After_Delete ON Products AFTER DELETE
    AS
        
    ALTER TABLE ProductsIngredients
    drop CONSTRAINT FKProductIngred_Products;

    ALTER TABLE ProductsIngredients
    ADD CONSTRAINT FKProductIngred_Products
        FOREIGN KEY (ProductId)
        REFERENCES Products(Id)
        ON DELETE CASCADE;

    ALTER TABLE Feedbacks
    drop CONSTRAINT fk_Feedbacks_Products;

    ALTER TABLE Feedbacks
    ADD CONSTRAINT fk_Feedbacks_Products
        FOREIGN KEY (ProductId)
        REFERENCES Products(Id)
        ON DELETE CASCADE;


    delete from Products
    where Id = (select Id from deleted)
*/

CREATE TRIGGER T_Products_After_Delete ON Products AFTER DELETE
AS
	
ALTER TABLE ProductsIngredients
drop CONSTRAINT FKProductIngred_Products;

ALTER TABLE ProductsIngredients
ADD CONSTRAINT FKProductIngred_Products
    FOREIGN KEY (ProductId)
    REFERENCES Products(Id)
    ON DELETE CASCADE;

ALTER TABLE Feedbacks
drop CONSTRAINT fk_Feedbacks_Products;

ALTER TABLE Feedbacks
ADD CONSTRAINT fk_Feedbacks_Products
    FOREIGN KEY (ProductId)
    REFERENCES Products(Id)
    ON DELETE CASCADE;


delete from Products
where Id = (select Id from deleted)
