set datestyle="ISO,MDY";

ALTER TABLE "employees" 
	ALTER "birth_date" TYPE date USING birth_date::date,
    ALTER "hire_date" TYPE date USING hire_date::date;
	
select * from employees limit 10;