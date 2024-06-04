CREATE VIEW Event_Bookings AS
SELECT Events.ID, Events.Event_Name, COUNT(Bookings.ID) as Num_Bookings
FROM Events
LEFT JOIN Bookings ON Events.ID = Bookings.Event_ID
GROUP BY Events.ID, Events.Event_Name;
