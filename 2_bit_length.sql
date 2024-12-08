-- Создаём таблицу, если её ещё нет
CREATE TABLE IF NOT EXISTS demographics (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    race VARCHAR(255) NOT NULL
);

-- Заполняем таблицу данными, если она пуста
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM demographics) THEN
        INSERT INTO demographics (name, birthday, race) VALUES
        ('Alice', '1990-05-14', 'Caucasian'),
        ('Bob', '1985-08-20', 'Asian'),
        ('Charlie', '1992-12-01', 'African American'),
        ('Diana', '1998-03-25', 'Hispanic');
    END IF;
END $$;

UPDATE demographics
SET
    name = BIT_LENGTH(name)::TEXT, -- Преобразуем битовую длину в текст
    race = BIT_LENGTH(race)::TEXT; -- Преобразуем битовую длину в текст


SELECT * FROM demographics;
