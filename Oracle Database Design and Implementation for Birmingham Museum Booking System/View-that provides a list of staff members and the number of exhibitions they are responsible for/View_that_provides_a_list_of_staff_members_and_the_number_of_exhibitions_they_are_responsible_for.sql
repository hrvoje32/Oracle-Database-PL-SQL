CREATE VIEW Staff_Exhibits AS
SELECT sm.Staff_Member_Name, COUNT(DISTINCT e.ID) AS Exhibits_Responsible_For
FROM Staff_Members sm
LEFT JOIN Inventory i ON sm.ID = i.Staff_Member_ID
LEFT JOIN Exhibits e ON i.Exhibit_ID = e.ID
GROUP BY sm.Staff_Member_Name;
