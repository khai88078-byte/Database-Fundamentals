-- =========================================================
-- PROJECT: AI SERVER SYSTEM (SISTEM PELAYAN AI)
-- DESCRIPTION: Database for managing AI servers, agents, and performance logs.
-- AUTHOR: (Your Name)
-- =========================================================

-- 1. CREATE DATABASE
CREATE DATABASE SISTEM_PELAYAN_AI;
USE SISTEM_PELAYAN_AI;

-- 2. CREATE TABLES
CREATE TABLE SERVER(
    SERVER_ID VARCHAR(100) PRIMARY KEY,
    SERVER_NAME VARCHAR(100) NOT NULL,
    RAM_GB INT NOT NULL,
    OS_TYPE VARCHAR(100) NOT NULL,
    STATUS VARCHAR(100) NOT NULL
);

CREATE TABLE AGENT (
    AGENT_ID VARCHAR(100) PRIMARY KEY,
    AGENT_NAME VARCHAR(100) NOT NULL,
    MODEL_TYPE VARCHAR(100) NOT NULL,
    SERVER_ID VARCHAR(100) NOT NULL,
    DEPLOY_DATE DATE NOT NULL,
    FOREIGN KEY (SERVER_ID) REFERENCES SERVER (SERVER_ID)
);

CREATE TABLE PERFORMANCE_LOG (
    LOG_ID VARCHAR(100) PRIMARY KEY,
    SERVER_ID VARCHAR(100) NOT NULL,
    AGENT_ID VARCHAR(100) NOT NULL,
    LOG_DATE DATE NOT NULL,
    CPU_USAGE_PERCENT INT NOT NULL,
    FOREIGN KEY (SERVER_ID) REFERENCES SERVER (SERVER_ID),
    FOREIGN KEY (AGENT_ID) REFERENCES AGENT (AGENT_ID)
);

-- 3. INSERT DATA
INSERT INTO SERVER VALUES
('SRV01', 'Hermes-Main', 64, 'Ubuntu', 'Online'),
('SRV02', 'Llama-Test', 16, 'Debian', 'Offline'),
('SRV03', 'Vex-Node-1', 32, 'Ubuntu', 'Online'),
('SRV04', 'Cpp-Compiler', 8, 'Arch Linux', 'Maintenance'), -- Fixed spelling
('SRV05', 'Data-Node', 128, 'Ubuntu', 'Online');

INSERT INTO AGENT VALUES 
('AGT01', 'Vex-Core', 'Llama-3-8B', 'SRV01', '2026-10-01'),
('AGT02', 'Viro-Parser', 'Custom-CPP', 'SRV04', '2026-10-02'),
('AGT03', 'Vex-Learner', 'Mistral-7B', 'SRV01', '2026-10-03'),
('AGT04', 'Data-Scraper', 'Gemini-Pro', 'SRV03', '2026-10-04'),
('AGT05', 'Backup-Bot', 'Llama-3-8B', 'SRV05', '2026-10-05');

INSERT INTO PERFORMANCE_LOG VALUES
('LOG01', 'SRV01', 'AGT01', '2026-10-06', 85),
('LOG02', 'SRV03', 'AGT04', '2026-10-06', 45),
('LOG03', 'SRV01', 'AGT03', '2026-10-07', 92),
('LOG04', 'SRV04', 'AGT02', '2026-10-07', 15),
('LOG05', 'SRV05', 'AGT05', '2026-10-08', 30);


-- =========================================================
-- EXAM PRACTICE QUERIES (LEVEL 1)
-- =========================================================

-- Q3: SELECT (Display all servers with RAM greater than 32GB)
SELECT * FROM SERVER 
WHERE RAM_GB > 32;

-- Q4: WHERE (Display agents using the 'Llama-3-8B' model)
SELECT AGENT_ID, AGENT_NAME, MODEL_TYPE 
FROM AGENT 
WHERE MODEL_TYPE = 'Llama-3-8B';

-- Q5: ORDER BY (Display servers sorted by RAM in descending order)
SELECT * FROM SERVER 
ORDER BY RAM_GB DESC;

-- Q8: AND (Display Llama-3-8B agents deployed on '2026-10-01')
SELECT AGENT_NAME, SERVER_ID 
FROM AGENT 
WHERE MODEL_TYPE = 'Llama-3-8B' AND DEPLOY_DATE = '2026-10-01';

-- Q9: BETWEEN (Display logs where CPU usage is between 20% and 80%)
SELECT * FROM PERFORMANCE_LOG 
WHERE CPU_USAGE_PERCENT BETWEEN 20 AND 80;

-- Q6: UPDATE (Change SRV04 status from Maintenance to Online)
UPDATE SERVER 
SET STATUS = 'Online' 
WHERE SERVER_ID = 'SRV04';

-- Q7: DELETE (Delete the log entry for LOG02)
DELETE FROM PERFORMANCE_LOG 
WHERE LOG_ID = 'LOG02';

-- Verify the UPDATE and DELETE worked
SELECT * FROM SERVER;
SELECT * FROM PERFORMANCE_LOG;
