INSERT INTO service_order_statuses (name, description)
VALUES
    ('NEW', 'New service order'),
    ('DIAGNOSIS', 'Vehicle is being diagnosed'),
    ('IN_PROGRESS', 'Repair is currently in progress'),
    ('WAITING_FOR_PARTS', 'Waiting for required parts'),
    ('READY_FOR_PICKUP', 'Repair completed and vehicle is ready for pickup'),
    ('COMPLETED', 'Service order completed'),
    ('CANCELLED', 'Service order cancelled');