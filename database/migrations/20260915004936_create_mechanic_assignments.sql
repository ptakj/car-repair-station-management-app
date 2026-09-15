CREATE TABLE mechanic_assignments (
    service_order_id BIGINT NOT NULL
        REFERENCES service_orders(id),

    mechanic_id BIGINT NOT NULL
        REFERENCES users(id),

    assigned_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    unassigned_at TIMESTAMPTZ,

    PRIMARY KEY (service_order_id, mechanic_id),

    CONSTRAINT mechanic_assignments_dates_check
        CHECK (
            unassigned_at IS NULL
            OR unassigned_at >= assigned_at
        )
);