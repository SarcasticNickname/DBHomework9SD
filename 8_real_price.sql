-- Создаём таблицу, если её ещё нет
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    stock INT NOT NULL,
    weight FLOAT NOT NULL,
    producer VARCHAR(255),
    country VARCHAR(255)
);

-- Заполняем таблицу данными, если она пуста
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM products) THEN
        INSERT INTO products (name, price, stock, weight, producer, country) VALUES
        ('Apple', 3.0, 100, 500.0, 'Farm Fresh', 'USA'),
        ('Banana', 1.5, 200, 300.0, 'Tropical Foods', 'Ecuador'),
        ('Carrot', 2.0, 150, 800.0, 'Green Valley', 'Canada'),
        ('Dates', 10.0, 50, 250.0, 'Oasis', 'UAE');
    END IF;
END $$;

-- Создаём запрос для расчёта цены за килограмм и сортировки
SELECT
    name,
    weight,
    price,
    ROUND((price / weight)::numeric * 1000, 2) AS price_per_kg
FROM
    products
ORDER BY
    price_per_kg ASC,
    name ASC;
