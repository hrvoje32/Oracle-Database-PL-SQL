CREATE TABLE Admissions (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Type VARCHAR2(20) DEFAULT 'Adult' NOT NULL CHECK (Type IN ('Adult', 'Child', 'Concession', 'Senior Citizen')),
    Price NUMBER(10) NOT NULL,
    Age_Limit NUMBER(10) NOT NULL CHECK (Age_Limit >= 0),
    Museum_Membership NUMBER(10),
    PRIMARY KEY (ID)
);

CREATE TABLE Events (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Event_Name VARCHAR2(255) NOT NULL,
    Event_Date DATE NOT NULL,
    Event_Time TIMESTAMP(0) NOT NULL,
    Capacity NUMBER(10) NOT NULL,
    Ticket_Price NUMBER(10) NOT NULL CHECK (Ticket_Price >= 0),
    Booking_Required NUMBER(1) NOT NULL,
    Event_Type VARCHAR2(20) NOT NULL,
    Staffed NUMBER(1) NOT NULL,
    PRIMARY KEY (ID)
);



CREATE TABLE Exhibits (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Exhibit_Name VARCHAR2(255) NOT NULL,
    Type VARCHAR2(20) NOT NULL,
    Staffed NUMBER(1) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Presentations (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Presentation_Name VARCHAR2(255) NOT NULL,
    Presentation_Date DATE NOT NULL,
    Presentation_Time TIMESTAMP(0) NOT NULL,
    Presentation_Capacity NUMBER(10) NOT NULL,
    Price NUMBER(10) NOT NULL CHECK (Price >= 0),
    Booking_Required NUMBER(1) NOT NULL,
    Type VARCHAR2(20) NOT NULL,
    Staffed NUMBER(1) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Staff_Members (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Staff_Member_Name VARCHAR2(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Third_Parties (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Third_Party_Name VARCHAR2(255) NOT NULL,
    Contact_Information VARCHAR2(255) NOT NULL,
    PRIMARY KEY (ID)
);


CREATE TABLE Museum_Memberships (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Member_Name VARCHAR2(255) NOT NULL,
    Membership_Number NUMBER(10) NOT NULL UNIQUE,
    PRIMARY KEY (ID)
);

CREATE TABLE Bookings (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Admission_ID NUMBER(10) NOT NULL,
    Event_ID NUMBER(10),
    Presentation_ID NUMBER(10),
    PRIMARY KEY (ID), 
    FOREIGN KEY (Admission_ID) REFERENCES Admissions(ID),
    FOREIGN KEY (Event_ID) REFERENCES Events(ID),
    FOREIGN KEY (Presentation_ID) REFERENCES PRESENTATIONS(ID)
);

CREATE TABLE Inventory (
    ID NUMBER(10) GENERATED ALWAYS AS IDENTITY NOT NULL,
    Exhibit_ID NUMBER(10) NOT NULL,
    Staff_Member_ID NUMBER(10),
    Third_Party_ID NUMBER(10),
    Event_ID NUMBER(10),
    Presentation_ID NUMBER(10),
    PRIMARY KEY (ID), 
    FOREIGN KEY (Exhibit_ID) REFERENCES Exhibits(ID),
    FOREIGN KEY (Staff_Member_ID) REFERENCES Staff_Members(ID),
    FOREIGN KEY (Third_Party_ID) REFERENCES Third_Parties(ID),
    FOREIGN KEY (Event_ID) REFERENCES Events(ID),
    FOREIGN KEY (Presentation_ID) REFERENCES PRESENTATIONS(ID)
);

INSERT INTO Admissions (Type, Price, Age_Limit, Museum_Membership) 
VALUES ('Adult', 10, 16, NULL);
INSERT INTO Admissions (Type, Price, Age_Limit, Museum_Membership) 
VALUES ('Child', 5, 8, NULL);
INSERT INTO Admissions (Type, Price, Age_Limit, Museum_Membership) 
VALUES ('Senior Citizen', 7, 65, NULL);

INSERT INTO Events (Event_Name, Event_Date, Event_Time, Capacity, Ticket_Price, Booking_Required, Event_Type, Staffed) 
VALUES ('Mummy Uncovered', TO_DATE('2004-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 20, 10, 1, 'Permanent', 1);
INSERT INTO Events (Event_Name, Event_Date, Event_Time, Capacity, Ticket_Price, Booking_Required, Event_Type, Staffed) 
VALUES ('Treasures of the Sea', TO_DATE('2004-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 45, 7, 0, 'Temporary', 1);
INSERT INTO Events (Event_Name, Event_Date, Event_Time, Capacity, Ticket_Price, Booking_Required, Event_Type, Staffed) 
VALUES ('Planetarium Event', TO_DATE('2004-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 45, 7, 1, 'Temporary', 1);

INSERT INTO Exhibits (Exhibit_Name, Type, Staffed) 
VALUES ('Ancient Egypt', 'Permanent', 1);
INSERT INTO Exhibits (Exhibit_Name, Type, Staffed) 
VALUES ('Dinosaur Exhibit', 'Permanent', 0);

INSERT INTO Presentations (Presentation_Name, Presentation_Date,Presentation_Time,Presentation_Capacity, Price, Booking_Required, Type, Staffed) 
VALUES ('The Science of Art', TO_DATE('2021-04-01', 'YYYY-MM-DD'), TO_TIMESTAMP('13:00:00', 'HH24:MI:SS'), 15, 8, 0, 'Permanent', 1);
INSERT INTO Presentations (Presentation_Name, Presentation_Date,Presentation_Time,Presentation_Capacity, Price, Booking_Required, Type, Staffed) 
VALUES ('The Magic of Flight', TO_DATE('2021-04-25', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 25, 10, 1, 'Temporary', 1);
INSERT INTO Presentations (Presentation_Name, Presentation_Date,Presentation_Time,Presentation_Capacity, Price, Booking_Required, Type, Staffed) 
VALUES ('The LEGO', TO_DATE('2021-04-25', 'YYYY-MM-DD'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 25, 10, 0, 'Temporary', 1);

INSERT INTO Staff_Members (Staff_Member_Name) 
VALUES ('John Smith');
INSERT INTO Staff_Members (Staff_Member_Name) 
VALUES ('Jane Doe');

INSERT INTO Third_Parties (Third_Party_Name, Contact_Information) 
VALUES ('Museums of London', 'museums@london.uk');
INSERT INTO Third_Parties (Third_Party_Name, Contact_Information) 
VALUES ('Museums of Paris', 'museums@paris.fr');

INSERT INTO Museum_Memberships (Member_Name, Membership_Number) 
VALUES ('Adam Smith', 9937);
INSERT INTO Museum_Memberships (Member_Name, Membership_Number) 
VALUES ('John Doe', 4755);


INSERT INTO Bookings (Admission_ID, Event_ID, Presentation_ID) 
VALUES (1, 1, 1);
INSERT INTO Bookings (Admission_ID, Event_ID, Presentation_ID) 
VALUES (1, 1, 2);

INSERT INTO Inventory (Exhibit_ID, Staff_Member_ID, Third_Party_ID,Event_ID, Presentation_ID) 
VALUES (1, 1, 2,1,1);

INSERT INTO Inventory (Exhibit_ID, Staff_Member_ID, Third_Party_ID, Event_ID, Presentation_ID) 
VALUES (1, 2, 1, 2, 2);
