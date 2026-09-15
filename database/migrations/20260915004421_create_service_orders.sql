CREATE TABLE service_order_statuses (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE service_orders (
    id BIGSERIAL PRIMARY KEY,

    vehicle_id BIGINT NOT NULL
        REFERENCES vehicles(id),

    created_by BIGINT NOT NULL
        REFERENCES users(id),

    status_id BIGINT NOT NULL
        REFERENCES service_order_statuses(id),

    description TEXT,
    diagnosis TEXT,

    estimated_cost NUMERIC(12, 2),
    final_cost NUMERIC(12, 2),

    opened_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT service_orders_estimated_cost_check
        CHECK (estimated_cost IS NULL OR estimated_cost >= 0),

    CONSTRAINT service_orders_final_cost_check
        CHECK (final_cost IS NULL OR final_cost >= 0),

    CONSTRAINT service_orders_dates_check
        CHECK (
            completed_at IS NULL
            OR completed_at >= opened_at
        )
);