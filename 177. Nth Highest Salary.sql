CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    SELECT CASE
      WHEN N <= 0 THEN NULL
      WHEN (SELECT COUNT(DISTINCT salary) FROM Employee) < N THEN NULL
      ELSE (
        SELECT MIN(salary) FROM (
          SELECT DISTINCT salary
          FROM Employee
          ORDER BY salary DESC
          LIMIT N
        ) AS topN
      )
    END
  );
END;
