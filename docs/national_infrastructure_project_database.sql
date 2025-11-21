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
    Budget DECIMAL (12 , 2) NOT NULL,
    Status ENUM ('Planned', 'In progress', 'Completed')
);

CREATE TABLE IF NOT EXISTS Provinces (
	ProvinceID INT AUTO_INCREMENT PRIMARY KEY,
    ProvinceName VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS ProjectAssignments (
	AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (ProjectID) REFERENCES Projects(tProjectID),
    FOREIGN KEY (ContractorID) REFERENCES Contractors(ContractorID),
    FOREIGN KEY (ProvinceID) REFERENCES Provinces(ProvinceID)
);

-- Insert data into tables
INSERT INTO Contractors (CompanyName, HQCity) VALUES
('PCL Construction', 'Edmonton AB'),
('EllisDon Corporation', 'Mississauga ON'),
('Bird Construction Inc.', 'Mississauga ON'),
('Broccolini Construction Inc,' 'Kirkland QC'),
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

INSERT INTO Projects (Name, Budget, Status) VALUES
('POPULATE TABLE WITH DATA', 1.00, 'Planned');
