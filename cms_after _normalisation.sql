create database cms_nor;
use cms_nor;
-- 1. Admin Table
CREATE TABLE Admins (
    Admin_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Role VARCHAR(50),
    Work_Shift VARCHAR(20)
);

-- 2. User Table
CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone_No VARCHAR(15),
    Address VARCHAR(255),
    User_Category VARCHAR(50),
    Department VARCHAR(50),
    Priority_Level VARCHAR(20)
);

-- 3. Complaint Table
CREATE TABLE Complaints (
    Complaint_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    Date_Filed DATE,
    Status VARCHAR(20),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- 4. Resolution Table
CREATE TABLE Resolutions (
    Resolution_ID INT PRIMARY KEY,
    Solution_Type VARCHAR(100),
    Remarks TEXT,
    Date_Resolved DATE,
    Feedback VARCHAR(50),
    Complaint_ID INT,
    Admin_ID INT,
    FOREIGN KEY (Complaint_ID) REFERENCES Complaints(Complaint_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Admins(Admin_ID)
);
-- Admins Data
INSERT INTO Admins VALUES (501, 'Admin Raj', 'raj@system.com', 'Manager', 'Day');
INSERT INTO Admins VALUES (502, 'Admin Simi', 'simi@system.com', 'Support', 'Night');
INSERT INTO Admins VALUES (503, 'Admin_Vik', 'vik@system.com', 'Tech Lead', 'Day');
INSERT INTO Admins VALUES (504, 'Admin Pooja', 'pooja@system.com', 'Agent', 'Evening');
INSERT INTO Admins VALUES (505, 'Admin Ali', 'ali@system.com', 'Clerk', 'Day');

-- Users Data
INSERT INTO Users VALUES (101, 'Rahul', 'rahul@mail.com', '9876543210', 'Delhi', 'Premium', 'Sales', 'High');
INSERT INTO Users VALUES (102, 'Sita', 'sita@mail.com', '8876543210', 'Mumbai', 'Regular', 'IT', 'Medium');
INSERT INTO Users VALUES (103, 'Amit', 'amit@mail.com', '7876543210', 'Pune', 'VIP', 'Finance', 'High');
INSERT INTO Users VALUES (104, 'Sara', 'sara@mail.com', '6876543210', 'Kolkata', 'Guest', 'HR', 'Low');
INSERT INTO Users VALUES (105, 'John', 'john@mail.com', '5876543210', 'Bangalore', 'Regular', 'Support', 'Medium');

-- Complaints Data
INSERT INTO Complaints VALUES (1001, 'No Internet', 'WiFi not working', '2024-03-01', 'Closed', 101);
INSERT INTO Complaints VALUES (1002, 'Double Bill', 'Charged twice', '2024-03-02', 'Pending', 102);
INSERT INTO Complaints VALUES (1003, 'Mouse Broken', 'Hardware issue', '2024-03-03', 'Open', 103);
INSERT INTO Complaints VALUES (1004, 'App Lag', 'Slow performance', '2024-03-04', 'In Progress', 104);
INSERT INTO Complaints VALUES (1005, 'Login Fail', 'Password error', '2024-03-05', 'Open', 105);

-- Resolutions Data
INSERT INTO Resolutions VALUES (901, 'Router Reset', 'Done', '2024-03-02', 'Good', 1001, 503);
INSERT INTO Resolutions VALUES (902, 'Refund Issued', 'Check bank', '2024-03-04', 'Excellent', 1002, 501);
INSERT INTO Resolutions VALUES (903, 'Replaced', 'New mouse sent', '2024-03-05', 'Neutral', 1003, 502);
INSERT INTO Resolutions VALUES (904, 'Cache Clear', 'Fixed', '2024-03-06', 'Good', 1004, 503);
INSERT INTO Resolutions VALUES (905, 'DB Reset', 'Password reset', '2024-03-07', 'Satisfied', 1005, 504);