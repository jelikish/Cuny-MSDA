## DATA622 HW #3
- Assigned on September 27, 2017
- Due on October 11, 2017 11:59 PM EST
- 15 points possible, worth 15% of your final grade

### Instructions:
1. Get set up with free academic credits on both Google Cloud Platform (GCP) and Amazon Web Services (AWS).  Instructions has been sent in 2 separate emails to your CUNY inbox.

2. Research the products that AWS and GCP offer for storage, computing and analytics.  A few good starting points are:
    - [GCP product list](https://cloud.google.com/products/)
    - [AWS product list](https://aws.amazon.com/products)
    - [GCP quick-start tutorials](https://codelabs.developers.google.com/)
    - [AWS quick-start tutorials](https://aws.amazon.com/getting-started/tutorials/)
    - [Mapping GCP to AWS products Azure](https://stackify.com/microsoft-azure-vs-amazon-web-services-vs-google-compute-comparison/)
    - [Evaluating GCP against AWS](http://blog.armory.io/choosing-between-aws-gcp-and-azure/)


3. Design 2 different ways of migrating homework 2's outputs to *GCP*.  Evaluate the strength and weakness of each method using the Agile Data Science framework.

4. Design 2 different ways of migrating homework 2's outputs to *AWS*.  Evaluate the strength and weakness of each method using the Agile Data Science framework.

### Critical Thinking (8 points total)

- Fill out the critical thinking section by modifying this README.md file.
- If you want to illustrate using diagrams, check out [draw.io](https://www.draw.io/), which has a nice integration with github.

**AWS Method 1** (2 points)

Description:
Setup an instance of AWS server, install all required packages, migrate the scripts over and run them on a standalone aws server.

Strengths:
Fast deployment, minimal time required for this setup, do not have to deal with docker migration which can be a painful process

Weaknesses:
If we need to scale this in the future, we have no process, basically each machine will have to be built individually or alternative image of linux will have to be created before being deployed.  Also we will need to make sure all the packages are similar across all the servers.

**AWS Method 2** (2 points)

Description: 
Migrate docker image directly to the cloud.


Strengths: 
This is scalable, we can just deploy the image on 100 servers if we need to and be up and running and have a similar environment on all machines.


Weaknesses:
I personally find working directly with vms easier and to have more flexibility and not being limited to os running within docker. I understand the benefits of docker and definitely see that if the project is not supported by sys admins/engineers, docker might be a better fit, but if there is the needed support, I would go with managing images directly, creating a single image that is being deployed across all the servers and then building a system where all the package dependencies are centrally managed. Having said that, I spoke to a friend who works for a major bank and was surprised that they use docker, so I guess it comes down to saving your dev environment and being able to pass it along. So it is clear there is more for me to learn about docker in real work environment and  I think docker is great for a lot of situations and simply since I need to outline the weakness I think docker limits your ability to tune the OS and is less flexible then having files outside of container.


**GCP Method 1** (2 points)

Quick Note: Not sure if you are looking for 4 distinct methods or not, because to me it comes down to first deciding between GCP or AWS and then deciding between the methods, so realistically  I see a choice of 2 methods once I have decided on GCP vs.AWS.  So technically, I see the same 2 methods for GCP as for AWS, but I will go with different methods, since I think this is what you are looking for so realistically we can use any of the 4 methods for either AWS or GCP.



Description:
Setup a GCP server, setup up cloud storage and have the GCP instance connect to the cloud storage as NAS. Upload the scripts ( or docker image) into the instance, Save the generated pickle and csv files onto the cloud storage.


Strengths:
The benefit of this is that if we are working in the environment where we share our data with other teams or servers, it would be much easier to have a central file storage that would house the project files and would make it available to other processes. I think this is the most Agile friendly setup as it would do 2 things, it would make our work available before it is delivered and would make accessibility to final files very easy instead of having the files ftped or scped over to other locations. I think this step is pretty important, I won’t be using it this time because of the time limitations, but in any real production environment that has 3+ servers I would definitely look into setting up some kind of shared storage.

Weaknesses:
The weakness of this approach is added complexity and cost. We have to pay for cloud storage, we have to spend time setting it up and maintaining it. Troubleshooting becomes a bit more complicated as now we have to deal with extra component and there might be a slight potential performance drop (this is very small chance of this, but still I think it is worth mentioning).  Also the weakness of this method is that if you have just 1 server, there is very little benefit from having cloud storage attached, so this is really a better solution for a multi-server environment.


**GCP Method 2** (2 points)

Description:
Setup an instance, move the scripts over to the instance, setup Cloud based machine learning, rewrite scripts to use cloud based machine learning.

Strengths:
The benefit of this approach is that you can have unlimited power behind your machine learning if you are dealing with large datasets. From what I can see there are some nice features also available that make process somewhat simpler when everything is setup.

Weaknesses:
The downside is that you are limited to what the cloud based machine learning can do for you. There is limited number of methods available so the capabilities are not as flexible as you would have with python based machine learning. Also you are really moving towards one particular platform, in other words if you setup cloud storage and then cloud based machine learning it will be much harder for you to move somewhere else if you decide so in the future or move everything locally (for whatever reason).  So Staying with python based machine learning could with or without docker, gives you flexibility of migrating where you want fast.  In my opining the last is a considerable downside and needs to be considered very carefully before fully committing to the ecosystem.




### Applied (7 points total)

Choose one of the methods described above, and implement it using your work from homework 2.  Submit screenshots in the *screenshot* folder on this repo to document the completion of your process.


## Please read readme.md located in screenshots folder