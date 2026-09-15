CREATE INDEX idx_vehicles_customer_id
    ON vehicles(customer_id);

CREATE INDEX idx_service_orders_vehicle_id
    ON service_orders(vehicle_id);

CREATE INDEX idx_service_orders_status_id
    ON service_orders(status_id);

CREATE INDEX idx_service_orders_created_by
    ON service_orders(created_by);

CREATE INDEX idx_service_order_services_service_id
    ON service_order_services(service_id);

CREATE INDEX idx_service_order_parts_part_id
    ON service_order_parts(part_id);

CREATE INDEX idx_mechanic_assignments_mechanic_id
    ON mechanic_assignments(mechanic_id);

CREATE INDEX idx_inventory_movements_part_id
    ON inventory_movements(part_id);

CREATE INDEX idx_inventory_movements_created_at
    ON inventory_movements(created_at);

CREATE INDEX idx_service_order_history_service_order_id
    ON service_order_history(service_order_id);