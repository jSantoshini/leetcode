

-- Create table
CREATE TABLE Students23 (
    id INT PRIMARY KEY,
    student VARCHAR(50)
);

-- Insert data
INSERT INTO Students23 (id, student) VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');

-- Select data
SELECT * FROM Students;

select case when id%2=0 then  id-1
			when id%2=1 then id+1
			when max(id)%2=1 then id 
		end as id , student
from Students23
order by id

select case when x.id%2=0 then  x.id-1
			when x.id = x.maxid and x.id%2 =1 then id
			when x.id <> x.maxid and x.id%2 =1 then id+1
			end as id ,x.student
from
(select *,max(id) over() as maxid from Students23)x
order by id

--another method

select id,case when id%2=1 
then lead(student,1,student) over(order by id) 
else lag(student) over(order by id) end as studens from Students23