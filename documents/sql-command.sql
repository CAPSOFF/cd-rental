CREATE DATABASE db_cd_rental;

CREATE TABLE tb_stock_cd (
    cd_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    rate FLOAT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (cd_id)
);

CREATE TABLE tb_rent_transaction (
    transaction_id INT NOT NULL AUTO_INCREMENT,
    cd_id INT NOT NULL,
    date_out DATE NOT NULL,
    date_in DATE NOT NULL,
    total INT NOT NULL,
    is_returned BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (cd_id) REFERENCES tb_stock_cd (cd_id)
);

INSERT INTO tb_stock_cd (title, category, rate, quantity)
VALUES ('Clean Code', 'Education', '5000', '15'), ('Clean Architecture', 'Education', '6000', '20'), ('The Clean Coder', 'Education', '7000', '25');
