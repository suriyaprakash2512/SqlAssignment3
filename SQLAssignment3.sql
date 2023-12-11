use ExerciseDb
create table product1
(   PID INT PRIMARY KEY,
    PName VARCHAR(255),
    PQ INT,
    PPrice float,
    DiscountPercent float check (DiscountPercent>=0 AND DiscountPercent<=100),
    ManufacturingDate DATE
)

INSERT INTO product1(PID, PName, PQ, PPrice, DiscountPercent, ManufacturingDate)
VALUES
    (1, 'Laptop', 2, 80000, 10.00, '2023-10-15'),
    (2, 'Watch', 5, 1000, 5.00, '2023-02-22'),
    (3, 'Mobile', 7, 30000, 7.00, '2023-03-07'),
    (4, 'Fridge', 1, 95000, 10.00, '2023-11-10'),
    (5, 'Ac', 3, 60000, 10.50, '2023-08-05');

select* from product1



CREATE FUNCTION dbo.CalculateDiscountedValue(@price float, @discount_percent float)
RETURNS float
as
BEGIN
    DECLARE @discounted_value float;
    SET @discounted_value = @price - (@price * (@discount_percent / 100));
    RETURN @discounted_value;
END;

SELECT PId, PPrice AS Price, DiscountPercent AS Discount, dbo.CalculateDiscountedValue(PPrice, DiscountPercent) AS PriceAfterDiscount
FROM product1;