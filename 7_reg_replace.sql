-- Создаём таблицу, если её ещё нет
CREATE TABLE IF NOT EXISTS repositories (
    project VARCHAR(255) NOT NULL,
    commits INT NOT NULL,
    contributors INT NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Заполняем таблицу данными, если она пуста
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM repositories) THEN
        INSERT INTO repositories (project, commits, contributors, address) VALUES
        ('Bitcoin', 3, 5, '1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa'),
        ('Ethereum', 4, 6, '0xDECAF9CD2367cdbb726E904cD6397eDFcAe6068D'),
        ('Cardano', 5, 8, 'addr1q9yrkvxc7n7djs0x7jd7fp3k7y8ydqm8yxt'),
        ('Polkadot', 6, 7, '14vuWj2pY4psNQpiVXpJgj5v9QhmCaeFFx');
    END IF;
END $$;

-- Создаём запрос для замены всех цифр в address на "!"
SELECT
    project,
    commits,
    contributors,
    REGEXP_REPLACE(address, '[0-9]', '!', 'g') AS address
FROM
    repositories;
