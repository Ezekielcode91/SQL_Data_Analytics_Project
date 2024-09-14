
--what are the most in demand skills for my role


SELECT 
    j.job_title,
    sd.skills,
    COUNT(sjd.skill_id) AS skill_count
FROM  sql_course.job_postings_fact j
INNER JOIN sql_course.skills_job_dim1 sjd
ON j.job_id = sjd.job_id
INNER JOIN sql_course.skills_dim sd
ON sjd.skill_id = sd.skill_id
WHERE
    j.job_title_short ='Data Analyst'
GROUP BY    
    j.job_title, sd.skills
ORDER BY 
    skill_count DESC
LIMIT 10;


