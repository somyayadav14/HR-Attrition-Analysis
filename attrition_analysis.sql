CREATE TABLE employee_attrition (
    EmployeeID INT,
    Department VARCHAR(50),
    JobRole VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    MonthlySalary INT,
    ExperienceYears INT,
    PerformanceRating INT,
    Attrition VARCHAR(5)
);

INSERT INTO employee_attrition VALUES
(1001,'IT','Software Engineer',26,'F',35000,2,3,'Yes'),
(1002,'HR','HR Executive',29,'M',28000,4,4,'No'),
(1003,'Finance','Analyst',35,'F',55000,9,3,'Yes'),
(1004,'IT','Data Analyst',31,'M',48000,6,4,'No'),
(1005,'Sales','Sales Executive',27,'F',30000,3,2,'Yes');

SELECT * FROM employee_attrition;

SELECT Department,
       COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM employee_attrition
GROUP BY Department;

SELECT
CASE
WHEN MonthlySalary < 40000 THEN 'Low Salary'
WHEN MonthlySalary BETWEEN 40000 AND 70000 THEN 'Medium Salary'
ELSE 'High Salary'
END AS Salary_Band,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition
FROM employee_attrition
GROUP BY
CASE
WHEN MonthlySalary < 40000 THEN 'Low Salary'
WHEN MonthlySalary BETWEEN 40000 AND 70000 THEN 'Medium Salary'
ELSE 'High Salary'
END;

SELECT ExperienceYears,
COUNT(*) AS Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM employee_attrition
GROUP BY ExperienceYears
ORDER BY ExperienceYears;


