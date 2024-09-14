
-- What are the top paying jobs for Data Roles?

SELECT 
    job_id,
    job_location,
    job_title,
    salary_year_avg,
    job_schedule_type,
    name AS company_name
FROM  sql_course.job_postings_fact
LEFT JOIN sql_course.company_dim -- bonus addition
ON sql_course.job_postings_fact.company_id = sql_course.company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND 
    salary_year_avg !=0 AND 
    job_location = 'Anywhere'
    ORDER BY salary_year_avg DESC
    LIMIT 10;
 