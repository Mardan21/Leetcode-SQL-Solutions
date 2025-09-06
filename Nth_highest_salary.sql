CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT salary
      FROM (
        SELECT 
            salary, 
            DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
        FROM Employee
      ) rankedEmpSalary
      WHERE rnk = N
      LIMIT 1
  );
END
