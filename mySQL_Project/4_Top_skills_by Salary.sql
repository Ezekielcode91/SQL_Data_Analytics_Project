--- What are the top skills based on the salary for my role


SELECT 
    sd.skills,
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
    AND job_work_from_home = TRUE
GROUP BY    
     sd.skills
ORDER BY 
    Average_salary DESC
LIMIT 20;