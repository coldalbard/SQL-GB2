USE lesson;
-- создание переменных, оперетаор SET
SET @test := 5;
SELECT @test;
-- создание переменных, оперетаор SELECT
SELECT @new_test := 6;
SELECT @test, @new_test;
SELECT @max_price := MAX(Price)
FROM products;

-- оператор IF можно объеденить с агрегатными функциями 
SELECT IF(4000<2000, True, False);