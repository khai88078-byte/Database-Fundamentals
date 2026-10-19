# AI Server System Database

This repository contains the SQL script for a relational database designed to manage an AI Lab Server infrastructure. It was built as part of my Database Fundamentals coursework.

## 🗄️ Database Schema
The database (`SISTEM_PELAYAN_AI`) consists of three related tables:
1. **SERVER**: Stores hardware specs and OS details for physical/virtual servers.
2. **AGENT**: Stores AI models deployed on specific servers.
3. **PERFORMANCE_LOG**: Tracks CPU usage and logging dates for each agent.

## 🔗 Entity Relationships
- One `SERVER` can host multiple `AGENT`s (1-to-Many).
- Both `SERVER` and `AGENT` are referenced in the `PERFORMANCE_LOG` to track which agent on which server is using CPU resources.

## 🛠️ Technologies Used
- **MySQL / MySQL Workbench**
- **SQL (DDL & DML)**

## 🚀 How to Run
1. Open MySQL Workbench.
2. Open the `SYSTEM SERVER AI (1.0).sql` file.
3. Execute the entire script to create the database, tables, and insert the sample data.
