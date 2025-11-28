# National Infrastructure Project

## Project Scope
The project involves creating a proof-of-concept 
National Infrastructure Project Database for a new 
Canadian government department. The work includes designing 
an ERD, building a relational database schema, creating sample 
JSON/XML datasets, writing meaningful SQL queries, and developing 
a simple webpage that displays project data.

### In scope:
- ERD design
- Database schema (tables, keys, relationships)
- Sample JSON and XML files
- SQL queries for reporting
- Simple webpage to show JSON data

### Out of scope:
- Full production system
- Security, authentication, or live data
- Advanced analytics or mapping

## Project Requirements
### The system must:
- Store; project, Province, contractor, and project assignment data.
- Track project status and progress.
- Support users assigned to projects.
- Provide sample JSON and XML datasets.
- Allow SQL queries such as project summaries, budgets, and delays.
- Display basic project info on a simple webpage.

### Non-Functional Requirements:
- Use consistent naming and normalized tables (3NF).
- Maintain referential integrity through keys.
- Be portable across common SQL databases.
- Be simple, readable, and easy to demo.


## Project Assumptions
- All data is fictional and created for testing.
- No backend or real system integration is required.
- Team members share the workload.
- Webpage uses static JSON only.
- The relationship between entities; 
  - project assignment M:1 contractors
  - project assignment M:1 Province
  - project assignment 1:1 project

# Step-by-Step Instructions

## Prerequisites
1. Database Software
    - MySQL or MariaDB installed on your machine.
2. Database Client Tools
    - MySQL Workbench, MySQL Shell, or another SQL client to run queries and manage the database.
3. Web Browser
    - Chrome, Firefox, Edge, or another modern browser to view the proof-of-concept webpage.
4. Basic Knowledge
    - Understanding of SQL queries and relational databases.
    - Familiarity with JSON and XML formats.
    - Basic HTML and CSS to view the webpage.

## Database Creation
- Run the database schema to create all required tables.
- Load sample data including projects, provinces, contractors, and budget.
- Ensure parent tables (like provinces and contractors) are loaded before child tables.
- Create a JSON file with at least 5 Planned projects.
- Create an XML file with at least 5 In-Progress projects.
- Make sure both files are valid and reflect the database content.

## Run the script
- Open your database client (e.g., MySQL Workbench).
- Open the database script file that contains the schema and sample data.
- Execute the script to create all tables and insert the sample data. 
    In most clients, you can run the entire script at once (for example, by clicking the “Execute” or “Run” button).
- Verify that all tables have been created and that the sample data is loaded correctly by browsing the tables or running simple queries.

## Verification 
- Open your database client and connect to the database.
- Browse the Projects table (or equivalent table) to check that the sample data is loaded.
- Verify the number of sample projects: there should be at least 8–10 projects across multiple provinces.
- Check that related tables (like Contractors and Provinces) also contain the sample data.
- Optionally, run a simple query to view all projects and confirm their names, status, and budgets.


