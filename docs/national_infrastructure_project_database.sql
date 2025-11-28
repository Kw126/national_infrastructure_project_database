-- Create the database if it doesn't exist yet
CREATE DATABASE IF NOT EXISTS national_infrastructure_project_database;
USE national_infrastructure_project_database;

-- Populate tables with data
CREATE TABLE IF NOT EXISTS Contractors (
	ContractorID INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    HQCity VARCHAR (200) DEFAULT 'N/A'
);

CREATE TABLE IF NOT EXISTS Projects (
	ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    Budget DECIMAL (18 , 2) NOT NULL,
    Status ENUM ('Planned', 'In progress', 'Completed')
);

CREATE TABLE IF NOT EXISTS Provinces (
	ProvinceID INT AUTO_INCREMENT PRIMARY KEY,
    ProvinceName VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS ProjectAssignments
(
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectID int not null,
    ContractorID int not null,
    ProvinceID   int not null,
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID),
    FOREIGN KEY (ContractorID) REFERENCES Contractors (ContractorID),
    FOREIGN KEY (ProvinceID) REFERENCES Provinces (ProvinceID)
);

-- Insert data into tables
INSERT INTO Contractors (CompanyName, HQCity) VALUES
('PCL Construction', 'Edmonton AB'),
('EllisDon Corporation', 'Mississauga ON'),
('Bird Construction Inc.', 'Mississauga ON'),
('Broccolini Construction Inc', 'Kirkland QC'),
('Maple Reinders', 'Mississauga ON'),
('Strike Group', 'Calgary AB'),
('Buttcon ltd.', 'Woodbridge ON'),
('On Side Restoration Services Ltd.', 'Vancouver BC'),
('Fillmore Construction Management Inc', 'Edmonton AB'),
('Urban One Builders', 'Vancouver BC');

INSERT INTO Provinces (ProvinceName) VALUES
('Ontario'),
('Alberta'),
('Quebec'),
('Manitoba'),
('Saskatchewan'),
('British Columbia'),
('New Brunswick'),
('Nova Scotia'),
('Newfoundland And Labrador'),
('Prince Edward Island'),
('Nunavut'),
('Northwest Territories'),
('Yukon');
/* Last 3 entries are actually territories but for the sake
of keeping things organised we're calling them provinces */

INSERT INTO Projects (ProjectName, Budget, Status) VALUES
('401 Rail Tunnel', 116900000, 'In Progress'),
('Kingston General Hospital Renovation', 142100000, 'Completed'),
('Highway 17 Road Repair', 56000000, 'Planned'),
('Highway 16 Avalanche Prevention', 543850000, 'Planned'),
('Parliament Hill Refurbishment', 253539000, 'In Progress'),
('Manitoulin Island Bridge Rebuild', 953826000, 'Planned'),
('Saskatoon International Airport Expansion', 1636860000, 'In Progress'),
('Newfoundland Ferry Expansion', 45000000, 'Completed'),
('James Bay Project', 13700000000, 'In Progress'),
('Winnipeg City Hall Upgrade', 235000000, 'Planned'),
('Pickering Nuclear Power Plant Expansion', 374730000, 'Planned'),
('Calgary Water Main Replacement', 346754730, 'In Progress'),
('Shearwater Air Base Runway Expansion', 56946000, 'In Progress');


INSERT INTO ProjectAssignments (ProjectID, ContractorID, ProvinceID) VALUES
(1, 2, 1),
(2, 7, 1),
(3, 3, 1),
(4, 8, 6),
(5, 2, 1),
(6, 3, 1),
(7, 1, 5),
(8, 4, 9),
(9, 4, 3),
(10, 2, 4),
(11, 7, 1),
(12, 6, 2),
(13, 4, 8);

-- Query 1
SELECT * FROM ProjectAssignments WHERE ProvinceID = 1;

-- Query 2
SELECT * FROM Projects WHERE Status = "In Progress";

-- Query 3
SELECT ContractorID, COUNT(*) AS ProjectNumber FROM ProjectAssignments
GROUP BY ContractorID;

-- Query 4
UPDATE Projects
SET Status = 'Completed'
WHERE ProjectName = 'Parliament Hill Refurbishment';

-- Query 5 (FINISH)
