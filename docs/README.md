# project title
National infrastructure project

## Project Scope
The project involves creating a proof-of-concept 
National Infrastructure Project Database for a new 
Canadian government department. The work includes designing 
an ERD, building a relational database schema, creating sample 
JSON/XML datasets, writing meaningful SQL queries, and developing 
a simple webpage that displays project data.

In scope:
-ERD design
-Database schema (tables, keys, relationships)
-Sample JSON and XML files
-SQL queries for reporting
-Simple webpage to show JSON data

Out of scope:
-Full production system
-Security, authentication, or live data
-Advanced analytics or mapping


## Project Requirements
The system must:
-Store; project, location, contractor, budget, and milestone data.
-Track project status and progress.
-Support users assigned to projects.
-Provide sample JSON and XML datasets.
-Allow SQL queries such as project summaries, budgets, and delays.
-Display basic project info on a simple webpage.

Non-Functional Requirements:
-Use consistent naming and normalized tables (3NF).
-Maintain referential integrity through keys.
-Be portable across common SQL databases.
-Be simple, readable, and easy to demo.


## Project Assumptions

-All data is fictional and created for testing.
-No backend or real system integration is required.
-Team members share the workload.
-Webpage uses static JSON only.
-Budgets, dates, and contractor details are simplified.
-Province/city values are manually entered without validation.