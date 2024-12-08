-- Создаём таблицу, если её ещё нет
CREATE TABLE IF NOT EXISTS encryption (
    md5 VARCHAR(64) NOT NULL,
    sha1 VARCHAR(64) NOT NULL,
    sha256 VARCHAR(256) NOT NULL
);

-- Заполняем таблицу данными, если она пуста
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM encryption) THEN
        INSERT INTO encryption (md5, sha1, sha256) VALUES
        ('5d41402abc4b2a76b9719d911017c592',
         '2fd4e1c67a2d28fced849ee1bb76e7391b93eb12',
         '9e107d9d372bb6826bd81d3542a419d6ae8b5fa4c999a5b91f933c592b36dbd5'),
        ('7d793037a0760186574b0282f2f435e7',
         '12afbc3a31f21256eb751fc8001e9907c0a6e19a',
         '8d969eef6ecad3c29a3a629280e686cff8fabd2547a0e38ea7d11969dc9e6f9c');
    END IF;
END $$;

-- Создаём запрос для выравнивания длин
SELECT
    RPAD(md5, LENGTH(sha256), '1') AS md5,
    LPAD(sha1, LENGTH(sha256), '0') AS sha1,
    sha256
FROM
    encryption;
