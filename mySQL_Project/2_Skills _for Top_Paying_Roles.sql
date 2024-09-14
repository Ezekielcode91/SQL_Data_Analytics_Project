
--what are the skills required for top paying jobs

SELECT 
    j.job_id,
    j.job_location,
    j.job_title,
    j.salary_year_avg,
    sd.skills,
    cd.name as company_name
FROM  sql_course.job_postings_fact j
LEFT JOIN sql_course.company_dim cd
ON j.company_id = cd.company_id
INNER JOIN sql_course.skills_job_dim1 sjd
ON j.job_id = sjd.job_id
INNER JOIN sql_course.skills_dim sd
ON sjd.skill_id = sd.skill_id
WHERE
    j.job_title_short ='Data Analyst' AND 
    j.salary_year_avg != 0 
ORDER BY 
    j.salary_year_avg DESC
LIMIT 10;