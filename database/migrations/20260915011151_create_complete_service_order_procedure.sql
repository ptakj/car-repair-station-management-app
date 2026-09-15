CREATE OR REPLACE PROCEDURE complete_service_order(
    p_service_order_id BIGINT,
    p_final_cost NUMERIC(12, 2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_completed_status_id BIGINT;
BEGIN
    IF p_final_cost < 0 THEN
        RAISE EXCEPTION 'Final cost cannot be negative';
    END IF;

    SELECT id
    INTO v_completed_status_id
    FROM service_order_statuses
    WHERE name = 'COMPLETED';

    IF v_completed_status_id IS NULL THEN
        RAISE EXCEPTION 'COMPLETED status does not exist';
    END IF;

    UPDATE service_orders
    SET
        status_id = v_completed_status_id,
        final_cost = p_final_cost,
        completed_at = NOW(),
        updated_at = NOW()
    WHERE id = p_service_order_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Service order % does not exist', p_service_order_id;
    END IF;
END;
$$;