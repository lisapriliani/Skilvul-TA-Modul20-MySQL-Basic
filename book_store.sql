1. SHOW database untuk melihat list database yang ada pada mysql
MariaDB [(none)]> SHOW DATABASE;

2. CREATE database bernama bookstore
MariaDB [(none)]> CREATE DATABASE bookstore;
Query OK, 1 row affected (0.002 sec)

3. USE database bookstore
MariaDB [(none)]> USE bookstore;
Database changed

4. Membuat table
MariaDB [bookstore]> CREATE TABLE books(
    ->      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->      author1 varchar(100) NOT NULL,
    ->      author2 varchar(100),
    ->      author3 varchar(100),
    ->      title varchar(100),
    ->      description varchar(100),
    ->      place_sell char(3),
    ->      stock INT DEFAULT 0,
    ->      creation_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
    ->      );
            Query OK, 0 rows affected (0.020 sec)

MariaDB [bookstore]> ALTER TABLE books
    -> ADD price INT DEFAULT 0,
    -> ADD status ENUM('available','out of stock', 'limited'),
    -> DROP place_sell;
            Query OK, 0 rows affected (0.028 sec)
            Records: 0  Duplicates: 0  Warnings: 0


MariaDB [bookstore]> INSERT INTO books VALUE
    -> (NULL, 'lisa', 'lilis', 'sasa', 'how to be better in lyfe',
    -> 'ini buku tentang hal-hal random', 14, DEFAULT, 100000, 'available'),
    -> (NULL, 'tzuyu', 'sana', 'jihyo', 'alcohol free',
    -> 'for my fans', 5, DEFAULT, 50000, 'limited'),
    -> (NULL, 'jessica', 'nurudin', 'zelda', 'how 2 be impactful',
    ->     'our journey in impactbyte skilvul bootcamp ', 0, DEFAULT, 105000, 'out of stock');
            Query OK, 3 rows affected (0.004 sec)
            Records: 3  Duplicates: 0  Warnings: 0


MariaDB [bookstore]> SELECT * FROM books;

            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            | id | author1 | author2 | author3 | title                    | description                                 | stock | creation_date       | price  | status       |
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            |  1 | lisa    | lilis   | sasa    | how to be better in lyfe | ini buku tentang hal-hal random             |    14 | 2021-12-01 21:42:04 | 100000 | available    |
            |  2 | tzuyu   | sana    | jihyo   | alcohol free             | for my fans                                 |     5 | 2021-12-01 21:42:04 |  50000 | limited      |
            |  3 | jessica | nurudin | zelda   | how 2 be impactful       | our journey in impactbyte skilvul bootcamp  |     0 | 2021-12-01 21:42:04 | 105000 | out of stock |
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            3 rows in set (0.000 sec)

SELECT id AS ID, author1 AS A1, author2 AS A2, author3 AS A3 FROM books;
            --output--
            MariaDB [bookstore]> SELECT id AS ID, author1 AS A1, author2 AS A2, author3 AS A3 FROM books;
            +----+---------+---------+-------+
            | ID | A1      | A2      | A3    |
            +----+---------+---------+-------+
            |  1 | lisa    | lilis   | sasa  |
            |  2 | tzuyu   | sana    | jihyo |
            |  3 | jessica | nurudin | zelda |
            +----+---------+---------+-------+
            3 rows in set (0.000 sec)


SELECT * FROM books 
    WHERE id = 2;
            --output--
            MariaDB [bookstore]> SELECT * FROM books
                ->     WHERE id = 2;
            +----+---------+---------+---------+--------------+-------------+-------+---------------------+-------+---------+
            | id | author1 | author2 | author3 | title        | description | stock | creation_date       | price | status  |
            +----+---------+---------+---------+--------------+-------------+-------+---------------------+-------+---------+
            |  2 | tzuyu   | sana    | jihyo   | alcohol free | for my fans |     5 | 2021-12-01 21:42:04 | 50000 | limited |
            +----+---------+---------+---------+--------------+-------------+-------+---------------------+-------+---------+
            1 row in set (0.006 sec)


SELECT * FROM books 
    WHERE id = 2 AND status = 'limited';
            --output--
            MariaDB [bookstore]> SELECT * FROM books
                ->     WHERE id = 2 AND status = 'limited';
            +----+---------+---------+---------+--------------+-------------+-------+---------------------+-------+---------+
            | id | author1 | author2 | author3 | title        | description | stock | creation_date       | price | status  |
            +----+---------+---------+---------+--------------+-------------+-------+---------------------+-------+---------+
            |  2 | tzuyu   | sana    | jihyo   | alcohol free | for my fans |     5 | 2021-12-01 21:42:04 | 50000 | limited |
            +----+---------+---------+---------+--------------+-------------+-------+---------------------+-------+---------+
            1 row in set (0.006 sec)

SELECT * FROM books 
    WHERE id = 2 OR status = 'available';
            --output--
            MariaDB [bookstore]> SELECT * FROM books
                ->     WHERE id = 2 OR status = 'available';
            +----+---------+---------+---------+--------------------------+---------------------------------+-------+---------------------+--------+-----------+
            | id | author1 | author2 | author3 | title                    | description                     | stock | creation_date       | price  | status    |
            +----+---------+---------+---------+--------------------------+---------------------------------+-------+---------------------+--------+-----------+
            |  1 | lisa    | lilis   | sasa    | how to be better in lyfe | ini buku tentang hal-hal random |    14 | 2021-12-01 21:42:04 | 100000 | available |
            |  2 | tzuyu   | sana    | jihyo   | alcohol free             | for my fans                     |     5 | 2021-12-01 21:42:04 |  50000 | limited   |
            +----+---------+---------+---------+--------------------------+---------------------------------+-------+---------------------+--------+-----------+
            2 rows in set (0.005 sec)


SELECT * FROM books 
    WHERE NOT id = 2;
            --output--
            MariaDB [bookstore]> SELECT * FROM books
                ->     WHERE NOT id = 2;
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            | id | author1 | author2 | author3 | title                    | description                                 | stock | creation_date       | price  | status       |
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            |  1 | lisa    | lilis   | sasa    | how to be better in lyfe | ini buku tentang hal-hal random             |    14 | 2021-12-01 21:42:04 | 100000 | available    |
            |  3 | jessica | nurudin | zelda   | how 2 be impactful       | our journey in impactbyte skilvul bootcamp  |     0 | 2021-12-01 21:42:04 | 105000 | out of stock |
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            2 rows in set (0.003 sec)

SELECT * FROM books 
    ORDER BY id;
            --output--
            MariaDB [bookstore]> SELECT * FROM books
                ->     ORDER BY id;
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            | id | author1 | author2 | author3 | title                    | description                                 | stock | creation_date       | price  | status       |
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            |  1 | lisa    | lilis   | sasa    | how to be better in lyfe | ini buku tentang hal-hal random             |    14 | 2021-12-01 21:42:04 | 100000 | available    |
            |  2 | tzuyu   | sana    | jihyo   | alcohol free             | for my fans                                 |     5 | 2021-12-01 21:42:04 |  50000 | limited      |
            |  3 | jessica | nurudin | zelda   | how 2 be impactful       | our journey in impactbyte skilvul bootcamp  |     0 | 2021-12-01 21:42:04 | 105000 | out of stock |
            +----+---------+---------+---------+--------------------------+---------------------------------------------+-------+---------------------+--------+--------------+
            3 rows in set (0.000 sec)

SELECT * FROM books 
    LIMIT 2;
            --output--
            MariaDB [bookstore]> SELECT * FROM books
                ->     LIMIT 2;
            +----+---------+---------+---------+--------------------------+---------------------------------+-------+---------------------+--------+-----------+
            | id | author1 | author2 | author3 | title                    | description                     | stock | creation_date       | price  | status    |
            +----+---------+---------+---------+--------------------------+---------------------------------+-------+---------------------+--------+-----------+
            |  1 | lisa    | lilis   | sasa    | how to be better in lyfe | ini buku tentang hal-hal random |    14 | 2021-12-01 21:42:04 | 100000 | available |
            |  2 | tzuyu   | sana    | jihyo   | alcohol free             | for my fans                     |     5 | 2021-12-01 21:42:04 |  50000 | limited   |
            +----+---------+---------+---------+--------------------------+---------------------------------+-------+---------------------+--------+-----------+


UPDATE books SET author1 = 'me', price = 6969 
    WHERE id = 1;
            --output--
            MariaDB [bookstore]> UPDATE books SET author1 = 'me', price = 6969
                ->     WHERE id = 1;
            Query OK, 1 row affected (0.005 sec)
            Rows matched: 1  Changed: 1  Warnings: 0 

DELETE FROM books 
    WHERE id=1;
            --output--
            MariaDB [bookstore]> DELETE FROM books
                ->     WHERE id=1;
            Query OK, 1 row affected (0.004 sec)