## DATA622 HW #4
- Assigned on October 11, 2017
- Due on October 25, 2017 11:59 PM EST
- 15 points possible, worth 15% of your final grade

### Instructions:

Use the two resources below to complete both the critical thinking and applied parts of this assignment.

1. Listen to all the lectures in Udacity's [Intro to Hadoop and Mapreduce](https://www.udacity.com/course/intro-to-hadoop-and-mapreduce--ud617) course.  

2. Read [Hadoop A Definitive Guide Edition 4]( http://javaarm.com/file/apache/Hadoop/books/Hadoop-The.Definitive.Guide_4.edition_a_Tom.White_April-2015.pdf), Part I Chapters 1 - 3.

### Critical Thinking (10 points total)

Submit your answers by modifying this README.md file.

1. (1 points) What is Hadoop 1's single point of failure and why is this critical?  How is this alleviated in Hadoop 2?

Hadoop 1's single point of failure is Namenode.  Since Namenode contains the mapping of all the data chunks all over the DataNodes, if that information is lost the data chunks from all the Datanodes will become useless as we won’t have a way of putting the chunks back together, therefore a failure of NameNode can result in loss of all of the data.

Hadoop 2 addresses the issue of single point of failure by introducing an ability to configure cluster of Namenodes in an active/standby configuration. The data is synchronized between the 2 Namenode servers and in the case of a failure of an active server, the standby server takes over and ensures continuity of service.

2. (2 points) What happens when a data node fails?

If a data node fails, name node will detect the failure and will locate available data node and will replicate data from the 2 data nodes that still have this data to the new datanode, therefore making sure that the data is spread out among 3 data nodes.
 

3. (1 point) What is a daemon?  Describe the role task trackers and job trackers play in the Hadoop environment.

-	Daemon is a program running at all times tasked with a specific task.
-	JobTracker is responsible for splitting job into tasks and distributing work to tasktrackers and monitoring an overall progress of the job.  It knows where the data chunks are located and which task trackers it needs to locate.  It can also react to failed task by rescheduling it on the same or different node.
-	Task tracker runs on each of the nodes and is responsible for coordinating all the work done on a specific data node.  It is responsible for organizing the load on the specific data node and reporting back to jobtracker.


4. (1 point) Why is Cloudera's VM considered pseudo distributed computing?  How is it different from a true Hadoop cluster computing?

Cloudera's VM is designed as a good testing and education platform where you have all the components of hadoop running within one VM.  It makes no sense to run this configuration in actual production as you are limited to one server and the whole idea of Hadoop is a distributed computing, but since building out hadoop infrastructure requires a lot of work and resources, it is great for testing as you have all the components within one vm and can fully test your code.


5. (1 point) What is Hadoop streaming? What is the Hadoop Ecosystem?

Hadoop streaming refers to API which allows to use standard input/output to read files and output results line by line. This means you can use any programming language or use pipe in linux to direct data line by line from mapper to reducer or any other program.

Hadoop Ecosystem refers to different systems, tools and software built to interact with Hadoop and extend its functionality. It includes various software that generates map/reduce code from sql code or other regular simpler code, databases that allow to access data stored on hadoop file system, various system monitoring and other tools that interact with hadoop.

6. (1 point) During a reducer job, why do we need to know the current key, current value, previous key, and cumulative value, but NOT the previous value?

- We do not care about previous value since we are only interesting in the total, so if we are adding up numbers once we added the number to the total, we do not care about that number as long as we have the total stored.

- we need to know the current key since we only want to add up one key and want to make sure we are still using the same key

- we need current value since we need to add it to the total

- we need a way of tracking keys, so if we just start out we set the old key to None, once we encounter the new key, we know we are done with the current key and store it as an old key and start working with the new key, so it’s a mechanism of knowing when the key ends.
- we need to know the cumulative value as this is our storage of the total we are looking for and once we are done with the key it will have the total.



7. (3 points) A large international company wants to use Hadoop MapReduce to calculate the # of sales by location by day.  The logs data has one entry per location per day per sale.  Describe how MapReduce will work in this scenario, using key words like: intermediate records, shuffle and sort, mappers, reducers, sort, key/value, task tracker, job tracker.  

Jobtracker will start the new job.  It will locate the appropriate tasktrackers close to the data chunks, split the tasks into map and reduce and tasks and then distribute tasks to tasktrackers
Next the mappers will start working on the individual tasks, going through the chunks of data collecting keys = sale per location, value = sale amount.  Once done they will produce intermediate records containing Key and value.  Then the Shuffle and sort takes place, The shuffle is the process of moving the intermediate records from mappers to reducers and the sort takes place where reducers will organize the records into the sorted order.  Finally the reducers will take the sorted reports and will add up the values for all the keys and will produce the final output.



### Applied (5 points total)

Submit the mapper.py and reducer.py and the output file (.csv or .txt) for the first question in lesson 6 for Udacity.  (The one labelled "Quiz: Sales per Category")  Instructions for how to get set up is inside the Udacity lectures.  
