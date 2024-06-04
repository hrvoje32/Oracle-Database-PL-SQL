CREATE OR REPLACE PROCEDURE add_staff_member(
    staff_member_name IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Staff_Members (Staff_Member_Name) VALUES (staff_member_name);
    COMMIT;
END;
