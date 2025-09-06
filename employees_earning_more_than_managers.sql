WITH EmployeeManagerPairings AS (   
    SELECT 
        e.id AS employeeId, 
        e.name, 
        e.salary AS employeeSalary, 
        m.id AS managerId, 
        m.salary AS managerSalary
    FROM Employee e
    JOIN Employee m ON e.managerId = m.id
)

SELECT name AS Employee
FROM EmployeeManagerPairings
WHERE employeeSalary > managerSalary;
