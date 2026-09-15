-- =========================================================
-- SEED: RBAC
-- =========================================================

-- ---------------------------------------------------------
-- ROLES
-- ---------------------------------------------------------

INSERT INTO roles (name, description)
VALUES
    ('ADMIN', 'Pełny dostęp do systemu'),
    ('MECHANIC', 'Dostęp do obsługi zleceń serwisowych'),
    ('RECEPTIONIST', 'Obsługa klientów i zleceń');


-- ---------------------------------------------------------
-- PERMISSIONS
-- ---------------------------------------------------------

INSERT INTO permissions (name, description)
VALUES
    -- Users
    ('users.read', 'Wyświetlanie użytkowników'),
    ('users.create', 'Tworzenie użytkowników'),
    ('users.update', 'Edycja użytkowników'),
    ('users.delete', 'Usuwanie użytkowników'),

    -- Customers
    ('customers.read', 'Wyświetlanie klientów'),
    ('customers.create', 'Tworzenie klientów'),
    ('customers.update', 'Edycja klientów'),
    ('customers.delete', 'Usuwanie klientów'),

    -- Vehicles
    ('vehicles.read', 'Wyświetlanie pojazdów'),
    ('vehicles.create', 'Dodawanie pojazdów'),
    ('vehicles.update', 'Edycja pojazdów'),
    ('vehicles.delete', 'Usuwanie pojazdów'),

    -- Service orders
    ('service_orders.read', 'Wyświetlanie zleceń'),
    ('service_orders.create', 'Tworzenie zleceń'),
    ('service_orders.update', 'Edycja zleceń'),
    ('service_orders.delete', 'Usuwanie zleceń'),

    -- Parts
    ('parts.read', 'Wyświetlanie części'),
    ('parts.create', 'Dodawanie części'),
    ('parts.update', 'Edycja części'),
    ('parts.delete', 'Usuwanie części'),

    -- Invoices
    ('invoices.read', 'Wyświetlanie faktur'),
    ('invoices.create', 'Tworzenie faktur'),

    -- Payments
    ('payments.read', 'Wyświetlanie płatności'),
    ('payments.create', 'Dodawanie płatności');


-- ---------------------------------------------------------
-- ADMIN
-- ADMIN otrzymuje wszystkie dostępne uprawnienia
-- ---------------------------------------------------------

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
CROSS JOIN permissions p
WHERE r.name = 'ADMIN';


-- ---------------------------------------------------------
-- MECHANIC
-- Mechanik może:
-- - przeglądać klientów
-- - przeglądać pojazdy
-- - przeglądać zlecenia
-- - aktualizować zlecenia
-- - przeglądać części
-- ---------------------------------------------------------

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p
    ON p.name IN (
        'customers.read',
        'vehicles.read',
        'service_orders.read',
        'service_orders.update',
        'parts.read'
    )
WHERE r.name = 'MECHANIC';


-- ---------------------------------------------------------
-- RECEPTIONIST
-- Recepcjonista może:
-- - obsługiwać klientów
-- - obsługiwać pojazdy
-- - tworzyć i aktualizować zlecenia
-- - przeglądać części
-- - obsługiwać faktury i płatności
-- ---------------------------------------------------------

INSERT INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p
    ON p.name IN (
        'customers.read',
        'customers.create',
        'customers.update',

        'vehicles.read',
        'vehicles.create',
        'vehicles.update',

        'service_orders.read',
        'service_orders.create',
        'service_orders.update',

        'parts.read',

        'invoices.read',
        'invoices.create',

        'payments.read',
        'payments.create'
    )
WHERE r.name = 'RECEPTIONIST';