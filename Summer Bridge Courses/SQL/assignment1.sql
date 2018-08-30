#1.	
Select * from flights order by distance desc limit 1

#2.	First query shows the count of all engine types
select engines as 'number of engines', count(engines) from planes group by engines

#The next 4 queries show tailnum of the plane with largest number of seats per group
select engines, seats, tailnum  from planes where engines=1 order by seats desc limit 1
select engines, seats, tailnum  from planes where engines=2 order by seats desc limit 1
select engines, seats, tailnum  from planes where engines=3 order by seats desc limit 1
select engines, seats, tailnum  from planes where engines=4 order by seats desc limit 1

#3.	
select count(*) from flights

#4.	
select carrier, count(*) from flights group by carrier

#5.	
select carrier, sum(flight) from flights group by carrier order by sum(flight) desc

#6.
select carrier, sum(flight) from flights group by carrier order by sum(flight) desc limit 5

#7.	
select carrier, sum(flight) from flights where distance>=1000 group by carrier order by sum(flight) desc limit 5


#8.	Show the airline with the highest average departure delay
select carrier, avg(dep_delay) from flights group by carrier order by avg(dep_delay) desc limit 1