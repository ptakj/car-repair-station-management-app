CREATE TABLE service_order_history (
    id BIGSERIAL PRIMARY KEY,

    service_order_id BIGINT NOT NULL
        REFERENCES service_orders(id),

    old_status_id BIGINT
        REFERENCES service_order_statuses(id),

    new_status_id BIGINT NOT NULL
        REFERENCES service_order_statuses(id),

    changed_by BIGINT NOT NULL
        REFERENCES users(id),

    changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    notes TEXT
);