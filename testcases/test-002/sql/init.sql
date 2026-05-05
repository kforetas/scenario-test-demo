-- テーブル作成
CREATE TABLE customer(
    customer_number VARCHAR NOT NULL PRIMARY KEY,
    card_number VARCHAR NOT NULL,
    customer_name VARCHAR NOT NULL,
    customer_address VARCHAR,
    sprv_limit_amount int,
    sprv_init_furi_menjo VARCHAR,
    sprv_monthly_payamount int,
    sprv_rate double precision
);

CREATE TABLE yakujo_henko_history(
    history_seq int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_number VARCHAR NOT NULL,
    change_date VARCHAR NOT NULL,
    pay_change_seikyu_shimebi VARCHAR NOT NULL,
    before_sprv_limit_amount int,
    before_sprv_init_furi_menjo VARCHAR,
    before_sprv_monthly_payamount int,
    before_sprv_rate double precision,
    after_sprv_limit_amount int,
    after_sprv_init_furi_menjo VARCHAR,
    after_sprv_monthly_payamount int,
    after_sprv_rate double precision
);

CREATE TABLE shopping_entry(
    shopping_number int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_number VARCHAR NOT NULL,
    use_card_number VARCHAR NOT NULL,
    use_date VARCHAR NOT NULL,
    shop_name VARCHAR NOT NULL,
    use_amount int NOT NULL,
    pay_type VARCHAR NOT NULL
);

CREATE TABLE shopping_record(
    shopping_number int NOT NULL PRIMARY KEY,
    customer_number VARCHAR NOT NULL,
    use_card_number VARCHAR NOT NULL,
    seikyu_shimebi VARCHAR NOT NULL,
    pay_type VARCHAR NOT NULL,
    use_date VARCHAR NOT NULL,
    shop_name VARCHAR NOT NULL,
    use_amount int NOT NULL
);

CREATE TABLE pay_record(
    customer_number VARCHAR NOT NULL,
    seikyu_shimebi VARCHAR NOT NULL,
    pay_date VARCHAR NOT NULL,
    pay_amount int NOT NULL,
    sp1_pay_amount int NOT NULL,
    sprv_pay_gankin int NOT NULL,
    sprv_pay_tesuryo int NOT NULL,
    sprv_togetu_zandaka int NOT NULL,
    sprv_togetu_kurizan int NOT NULL,
    sprv_jigetu_kurizan int NOT NULL,
    sprv_init_furi_menjo VARCHAR,
    sprv_monthly_payamount int,
    sprv_rate double precision,
    primary key (customer_number, seikyu_shimebi)
);

CREATE TABLE pay_fix_inf(
    customer_number VARCHAR NOT NULL,
    seikyu_shimebi VARCHAR NOT NULL,
    pay_date VARCHAR NOT NULL,
    pay_amount int NOT NULL,
    sp1_pay_amount int NOT NULL,
    sprv_pay_gankin int NOT NULL,
    sprv_pay_tesuryo int NOT NULL,
    card_number VARCHAR NOT NULL,
    customer_name VARCHAR NOT NULL,
    customer_address VARCHAR,
    sprv_limit_amount int,
    sprv_togetu_zandaka int NOT NULL,
    sprv_togetu_kurizan int NOT NULL,
    sprv_jigetu_kurizan int NOT NULL,
    sprv_init_furi_menjo VARCHAR,
    sprv_monthly_payamount int,
    sprv_rate double precision,
    primary key (customer_number, seikyu_shimebi)
);

-- 初期データ投入
INSERT INTO customer VALUES('0000000001', '3540000000000001', '山田　太郎', '恵比寿１−１', 500000, '0', 10000, 0.15);
