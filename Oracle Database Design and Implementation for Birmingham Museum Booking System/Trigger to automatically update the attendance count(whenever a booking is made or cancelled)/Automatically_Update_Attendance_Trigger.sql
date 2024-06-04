CREATE OR REPLACE TRIGGER UpdateAttendanceCount
AFTER INSERT OR DELETE ON Bookings
FOR EACH ROW
DECLARE
    v_event_id NUMBER(10);
BEGIN
    IF INSERTING THEN
        v_event_id := :NEW.Event_ID;
        UPDATE Events SET Capacity = Capacity - 1 WHERE ID = v_event_id;
    ELSIF DELETING THEN
        v_event_id := :OLD.Event_ID;
        UPDATE Events SET Capacity = Capacity + 1 WHERE ID = v_event_id;
    END IF;
END;
