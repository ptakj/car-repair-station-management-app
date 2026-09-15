CREATE TABLE services (
    id BIGSERIAL PRIMARY KEY,

    name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,

    base_price NUMERIC(12, 2) NOT NULL,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT services_base_price_check
        CHECK (base_price >= 0)
);

CREATE TABLE service_order_services (
    service_order_id BIGINT NOT NULL
        REFERENCES service_orders(id),

    service_id BIGINT NOT NULL
        REFERENCES services(id),

    quantity NUMERIC(10, 2) NOT NULL DEFAULT 1,

    unit_price NUMERIC(12, 2) NOT NULL,

    PRIMARY KEY (service_order_id, service_id),

    CONSTRAINT service_order_services_quantity_check
        CHECK (quantity > 0),

    CONSTRAINT service_order_services_unit_price_check
        CHECK (unit_price >= 0)
);