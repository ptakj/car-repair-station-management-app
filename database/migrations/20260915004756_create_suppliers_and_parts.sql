CREATE TABLE suppliers (
    id BIGSERIAL PRIMARY KEY,

    name VARCHAR(150) NOT NULL UNIQUE,
    email VARCHAR(255),
    phone VARCHAR(30),
    address TEXT,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


CREATE TABLE parts (
    id BIGSERIAL PRIMARY KEY,

    supplier_id BIGINT NOT NULL
        REFERENCES suppliers(id),

    name VARCHAR(150) NOT NULL,
    part_number VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,

    unit_price NUMERIC(12, 2) NOT NULL,
    stock_quantity NUMERIC(12, 2) NOT NULL DEFAULT 0,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT parts_unit_price_check
        CHECK (unit_price >= 0),

    CONSTRAINT parts_stock_quantity_check
        CHECK (stock_quantity >= 0)
);