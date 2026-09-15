CREATE OR REPLACE FUNCTION log_service_order_status_change()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.status_id IS DISTINCT FROM NEW.status_id THEN
        INSERT INTO service_order_history (
            service_order_id,
            old_status_id,
            new_status_id,
            changed_by
        )
        VALUES (
            NEW.id,
            OLD.status_id,
            NEW.status_id,
            NEW.created_by
        );
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER service_order_status_change_trigger
AFTER UPDATE OF status_id ON service_orders
FOR EACH ROW
EXECUTE FUNCTION log_service_order_status_change();