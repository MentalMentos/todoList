-- +goose Up
CREATE TABLE products(
    id INT,
    name_product VARCHAR,
    category_id INT,
    created_at timestamp not null default now()
);
ALTER TABLE products ADD price_total INTEGER;

-- +goose Down
drop table products;
