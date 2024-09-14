
-- What are the most optimal skills to learn (High Demand and Hugh average paye)

WITH demand_skills AS(
SELECT 
    sd.skills,
    sd.skill_id,
    j.job_country,
    COUNT(sjd.skill_id) AS skill_count
FROM  sql_course.job_postings_fact j
INNER JOIN sql_course.skills_job_dim1 sjd
ON j.job_id = sjd.job_id
INNER JOIN sql_course.skills_dim sd
ON sjd.skill_id = sd.skill_id
WHERE
    j.job_title_short ='Data Analyst' AND
    salary_year_avg!=0
GROUP BY    
    sd.skills,sd.skill_id, j.job_country

), 
Avg_salary AS(
SELECT 
    sd.skills,
    sd.skill_id,
   ROUND(AVG(j.salary_year_avg),2) AS Average_salary
FROM  sql_course.job_postings_fact j
INNER JOIN sql_course.skills_job_dim1 sjd
ON j.job_id = sjd.job_id
INNER JOIN sql_course.skills_dim sd
ON sjd.skill_id = sd.skill_id
WHERE
    j.job_title_short ='Data Analyst' 
    AND
     salary_year_avg!=0
GROUP BY    
     sd.skills, sd.skill_id
)

SELECT 
   Av.Average_salary,
    ds.skill_count,
    ds.skills
FROM
    demand_skills ds
    JOIN Avg_salary Av
    ON ds.skill_id = Av.skill_id
WHERE   ds.skill_count>10 AND
    ds.job_country = 'United States'
ORDER BY 
    Av.Average_salary DESC,
    ds.skill_count DESC
LIMIT 30;