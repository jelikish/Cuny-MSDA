## DATA622 HW #5
- Assigned on October 25, 2017
- Due on November 15, 2017 11:59 PM EST
- 15 points possible, worth 15% of your final grade

### Instructions:

Read the following:
- [Apache Spark Python 101](https://www.datacamp.com/community/tutorials/apache-spark-python)
- [Apache Spark for Machine Learning](https://www.datacamp.com/community/tutorials/apache-spark-tutorial-machine-learning)

Optional Readings:
- [Paper on RDD](https://www.usenix.org/system/files/conference/nsdi12/nsdi12-final138.pdf)
- [Advanced Analytics with Spark: Patterns for Learning from Data at Scale, 2nd Edition](https://www.amazon.com/_/dp/1491972955), Chapters 1 - 2

Additional Resources:
- [Good intro resource on PySpark](https://annefou.github.io/pyspark/slides/spark/#1)
- [Spark The Definitive Guide](https://github.com/databricks/Spark-The-Definitive-Guide)
- [Google Cloud Dataproc, Spark on GCP](https://codelabs.developers.google.com/codelabs/cloud-dataproc-starter/)


### Critical Thinking (8 points total)


1. (2 points) How is the current Spark's framework different from MapReduce?  What are the tradeoffs of better performance speed in Spark?

Spark provides the framework that is built for better recovery, optimized speed, much easier programming API and rich library support. 

Mapreduce is somewhat limited to batch processing and is limited in the type of operations one can perform and limited in the control of the flow.  Spark on the other hand provides an API that is very functional and familiar to anyone who has used dataframes or sql before and that results in a more productive framework as far as coding is concerned

Hadoop is using disk to store data, whereas Spark is using RAM ( and Disk ) which results in much faster processing speeds.

Spark is using a method called "lazy evaluation" when dealing with data assignments and operations - it does not do any operations until the result is requested, whereas mapreduce is somewhat linear in its process and is therefore less optimized. 

Spark does not have its own file system and can work with Hadoop FS or some other FS, Mapradecue is using its native HDFS and does not need any 3rd party Filesystem to run.

2. (2 points) Explain the difference between Spark RDD and Spark DataFrame/Datasets.

RDD - Is a scala object that stores the data, it is immutable and can be reconstructed in case of failure, RDD API provides access to a number of transformation operations. They are simply defining the action and are not ran until the output is actually requested. RDDs provide compile-time type-safety. The disadvantage of RDD is in the fact that java serialization is used in order to distribute the data for fault tolerance reasons and its somewhat slower process.

Dataframe - is a newer API that provides ability to code with an SQL and data frame style of coding, which is much more convenient to use and provides access to more functions and results in more flexibility. It is also using a different method using schema to pass data between nodes and the process is much more efficient then with serialization used by RDD. Dataframe does not have the same compile-time type-safety as RDD which is a disadvantage.


Dataset - is an even newer API which combines both flexibility of coding similar to dataframe and the compile-time type-safety of RDD.  It is using a new method of serialization that is faster then RDD.  Essentially it is the latest most optimized API for interacting with Spark. The biggest disadvantage is that we cannot use it with python, so for python users dataframes are the optimal option.

3. (1 point) Explain the difference between SparkML and Mahout. 

Both SparkML and Mahout provide ML capabilities. Mahout was built to work with mapreduce and disk whereas SparkML was built for spark.  Mahout however has a lot of capabilities and is a more mature product. SparkML is faaster and is easier to implement if you are running Spark based infrastructure. 

4. (1 point) Explain the difference between Spark.mllib and Spark.ml.

Spark.ml is a newer labrary and it is making use of dataframes. It is however less functional and does not support all algorithms.  It does help build ml pipelines of different transformations.

Spark.mllib is built on top of RDDs is more mature library and has more functionality.

4. (2 points) Explain the tradeoffs between using Scala vs PySpark.

Scala is a jvm based language and therefore it is faster and allows for better concurrency then python.

When working with Dataframes, python can be as fast as scala, but if using RDDs, pyspark will be significantly slower.

Spark is written in scala, so it is a more native and direct way to interact with spark then pySpark.

Pyspark can be easier to start using as python is normally considered easier to learn and code in, so for smaller projects where performance is not critical, pySpark might make more sense.



### Applied (7 points total)

Submit your Jupyter Notebook from following along with the code along in [Apache Spark for Machine Learning](https://www.datacamp.com/community/tutorials/apache-spark-tutorial-machine-learning)
