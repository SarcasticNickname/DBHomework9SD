-- Создаём таблицу, если её ещё нет
CREATE TABLE IF NOT EXISTS names (
    id SERIAL PRIMARY KEY,
    prefix VARCHAR(50),
    first VARCHAR(50),
    last VARCHAR(50),
    suffix VARCHAR(50)
);

-- Заполняем таблицу данными, если она пуста
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM names) THEN
        INSERT INTO names (prefix, first, last, suffix) VALUES
        ('Dr.', 'Alice', 'Johnson', 'PhD'),
        ('Mr.', 'Bob', 'Smith', NULL),
        ('Ms.', 'Clara', 'Brown', 'MSc'),
        ('Prof.', 'David', 'Wilson', NULL);
    END IF;
END $$;

-- Создаём запрос для объединения полей в один столбец
SELECT
    CONCAT_WS(' ', prefix, first, last, suffix) AS title
FROM
    names;
