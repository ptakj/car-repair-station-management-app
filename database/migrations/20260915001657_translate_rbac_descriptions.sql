-- =========================================================
-- TRANSLATE RBAC DESCRIPTIONS
-- =========================================================

-- Roles

UPDATE roles
SET description = 'Full access to the system'
WHERE name = 'ADMIN';

UPDATE roles
SET description = 'Access to service order management'
WHERE name = 'MECHANIC';

UPDATE roles
SET description = 'Customer and service order management'
WHERE name = 'RECEPTIONIST';


-- Permissions

UPDATE permissions
SET description = 'View users'
WHERE name = 'users.read';

UPDATE permissions
SET description = 'Create users'
WHERE name = 'users.create';

UPDATE permissions
SET description = 'Update users'
WHERE name = 'users.update';

UPDATE permissions
SET description = 'Delete users'
WHERE name = 'users.delete';


UPDATE permissions
SET description = 'View customers'
WHERE name = 'customers.read';

UPDATE permissions
SET description = 'Create customers'
WHERE name = 'customers.create';

UPDATE permissions
SET description = 'Update customers'
WHERE name = 'customers.update';

UPDATE permissions
SET description = 'Delete customers'
WHERE name = 'customers.delete';


UPDATE permissions
SET description = 'View vehicles'
WHERE name = 'vehicles.read';

UPDATE permissions
SET description = 'Create vehicles'
WHERE name = 'vehicles.create';

UPDATE permissions
SET description = 'Update vehicles'
WHERE name = 'vehicles.update';

UPDATE permissions
SET description = 'Delete vehicles'
WHERE name = 'vehicles.delete';


UPDATE permissions
SET description = 'View service orders'
WHERE name = 'service_orders.read';

UPDATE permissions
SET description = 'Create service orders'
WHERE name = 'service_orders.create';

UPDATE permissions
SET description = 'Update service orders'
WHERE name = 'service_orders.update';

UPDATE permissions
SET description = 'Delete service orders'
WHERE name = 'service_orders.delete';


UPDATE permissions
SET description = 'View parts'
WHERE name = 'parts.read';

UPDATE permissions
SET description = 'Create parts'
WHERE name = 'parts.create';

UPDATE permissions
SET description = 'Update parts'
WHERE name = 'parts.update';

UPDATE permissions
SET description = 'Delete parts'
WHERE name = 'parts.delete';


UPDATE permissions
SET description = 'View invoices'
WHERE name = 'invoices.read';

UPDATE permissions
SET description = 'Create invoices'
WHERE name = 'invoices.create';


UPDATE permissions
SET description = 'View payments'
WHERE name = 'payments.read';

UPDATE permissions
SET description = 'Create payments'
WHERE name = 'payments.create';