CREATE VIEW vehicle_service_history AS
SELECT
    v.id AS vehicle_id,
    v.registration_number,
    v.vin,
    v.make,
    v.model,
    so.id AS service_order_id,
    so.opened_at,
    sos.name AS status,
    s.name AS service_name,
    sos2.quantity,
    sos2.unit_price,
    (sos2.quantity * sos2.unit_price) AS service_cost
FROM vehicles v
JOIN service_orders so
    ON so.vehicle_id = v.id
JOIN service_order_statuses sos
    ON sos.id = so.status_id
JOIN service_order_services sos2
    ON sos2.service_order_id = so.id
JOIN services s
    ON s.id = sos2.service_id;