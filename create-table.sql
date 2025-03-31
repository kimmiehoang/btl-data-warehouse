CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL,
    quarter INT NOT NULL
);

CREATE TABLE dim_area (
    area_id SERIAL PRIMARY KEY,
    area_name VARCHAR(255) UNIQUE NOT NULL 
);

CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    cus_no VARCHAR(50) UNIQUE NOT NULL,
    customer_name VARCHAR(255) NOT NULL, 
    area_id INT REFERENCES dim_area(area_id)
);

CREATE TABLE dim_currency (
    currency_id SERIAL PRIMARY KEY,
    cur_code VARCHAR(3) UNIQUE NOT NULL -- USD / VND
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    prd_no VARCHAR(50) UNIQUE NOT NULL,
    prd_name VARCHAR(255) NOT NULL,
    logo VARCHAR(100),
    model VARCHAR(100),
    std VARCHAR(100),
    color VARCHAR(100),
    sqa VARCHAR(100),
    sqa_color VARCHAR(100),
    size_ VARCHAR(100)
);

CREATE TABLE fact_sales (
    sales_id BIGSERIAL PRIMARY KEY,
    ps_no VARCHAR(50) NOT NULL,
    date_id INT REFERENCES dim_date(date_id),
    customer_id INT REFERENCES dim_customer(customer_id),
    currency_id INT REFERENCES dim_currency(currency_id),
    product_id INT REFERENCES dim_product(product_id),
    qty INT NOT NULL CHECK (qty > 0), -- quantity
    amt DECIMAL(18,2) NOT NULL CHECK (amt >= 0), -- amount in USD
    exchange_rate DECIMAL(10,4) NOT NULL CHECK (exchange_rate > 0), -- exchange rate to VND
    amt_vnd DECIMAL(18, 2) NOT NULL CHECK (amt_vnd >= 0)  -- amount in VND
);

