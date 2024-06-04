CREATE OR REPLACE PROCEDURE delete_presentation(p_id IN NUMBER)
IS
BEGIN
  DELETE FROM Presentations
  WHERE ID = p_id;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Presentation deleted successfully.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Presentation with ID ' || p_id || ' not found.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred while deleting the presentation.');
END;
