create database Hr_analytics_dataset;

use Hr_analytics_dataset;

Employee Behavior Insights :
1.retention by Education Field - 

SELECT EducationField,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) AS Retained,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS RetentionRate
FROM [dbo].[Sheet1$]
GROUP BY EducationField
ORDER BY RetentionRate DESC;

#Compensation & Promotion
1.Attrition by Job Level

SELECT JobLevel,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM [dbo].[Sheet1$]
GROUP BY JobLevel
ORDER BY JobLevel;


2.High Income, High Satisfaction Employees Who Still Left

SELECT *
FROM [dbo].[Sheet1$]
WHERE MonthlyIncome > 10000 AND JobSatisfaction = 4 AND Attrition = 'Yes';


Department Dynamics;
1.Department-wise Performance Ratings :

SELECT Department, 
       ROUND(AVG(PerformanceRating), 2) AS AvgPerformance
FROM [dbo].[Sheet1$]
GROUP BY Department
ORDER BY AvgPerformance DESC;

2.Department + Job Role Combination with Most Attrition

SELECT Department, JobRole,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM [dbo].[Sheet1$]
GROUP BY Department, JobRole
ORDER BY AttritionRate DESC;

#Risk & Predictive Indicators ;
1.Tenure and Attrition Combined Analysis

SELECT YearsAtCompany,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
       ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS AttritionRate
FROM [dbo].[Sheet1$]
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

2.Potential Flight Risks: High Performer, Low Satisfaction

SELECT [EmpID], JobRole, PerformanceRating, JobSatisfaction, Attrition
FROM [dbo].[Sheet1$]
WHERE PerformanceRating = 4 AND JobSatisfaction <= 2 AND Attrition = 'No';

Ranking and Distribution :
1.Top 5 Job Roles with Highest Avg Monthly Income

SELECT JobRole, 
       ROUND(AVG(MonthlyIncome), 2) AS AvgIncome
FROM [dbo].[Sheet1$]
GROUP BY JobRole
ORDER BY AvgIncome DESC
limit 10;

2.Job Roles with Longest Average Tenure

SELECT JobRole, 
       ROUND(AVG(YearsAtCompany), 2) AS AvgTenure
FROM [dbo].[Sheet1$]
GROUP BY JobRole
ORDER BY AvgTenure DESC;


