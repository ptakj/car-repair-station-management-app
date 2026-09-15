CREATE TABLE service_order_parts (
    service_order_id BIGINT NOT NULL
        REFERENCES service_orders(id),

    part_id BIGINT NOT NULL
        REFERENCES parts(id),

    quantity NUMERIC(12, 2) NOT NULL,

    unit_price NUMERIC(12, 2) NOT NULL,

    PRIMARY KEY (service_order_id, part_id),

    CONSTRAINT service_order_parts_quantity_check
        CHECK (quantity > 0),

    CONSTRAINT service_order_parts_unit_price_check
        CHECK (unit_price >= 0)
);