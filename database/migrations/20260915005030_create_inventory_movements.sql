-- Add migration script here
CREATE TABLE inventory_movements (
    id BIGSERIAL PRIMARY KEY,

    part_id BIGINT NOT NULL
        REFERENCES parts(id),

    movement_type VARCHAR(30) NOT NULL,

    quantity NUMERIC(12, 2) NOT NULL,

    unit_cost NUMERIC(12, 2),

    service_order_id BIGINT
        REFERENCES service_orders(id),

    created_by BIGINT NOT NULL
        REFERENCES users(id),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT inventory_movements_type_check
        CHECK (
            movement_type IN (
                'RECEIPT',
                'ISSUE',
                'ADJUSTMENT'
            )
        ),

    CONSTRAINT inventory_movements_quantity_check
        CHECK (quantity > 0),

    CONSTRAINT inventory_movements_unit_cost_check
        CHECK (
            unit_cost IS NULL
            OR unit_cost >= 0
        )
);