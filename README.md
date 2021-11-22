# MBSchallenges
---------------------

Challenge 1
----------------------
A 3 tier environment is a common setup. Use a tool of your choosing/familiarity create these resources. Please remember we will not be judged on the outcome but more focusing on the approach, style and reproducibility.

1. Problem Statement -
A three-tier architecture is a software architecture pattern where the application is broken down into three logical tiers: the presentation layer, the business logic layer and the data storage layer. This architecture is used in a client-server application such as a web application that has the frontend, the backend and the database. Each of these layers or tiers does a specific task and can be managed independently of each other. 

2. We shall be making use of the following AWS services to design and build a three-tier cloud infrastructure: Elastic Compute Cloud (EC2), Auto Scaling Group, Virtual Private Cloud(VPC), Elastic Load Balancer (ELB), Security Groups and the Internet Gateway. Our infrastructure will be designed to be highly available and fault tolerant. Below is the proposed architecture in the intrest of time, I have borrowed it from this link

![image](https://user-images.githubusercontent.com/94715481/142690837-24e03e0d-9fe5-42c2-bfad-d4f13cda8605.jpeg)

Challenge 2
----------------------
We need to write code that will query the meta data of an instance within AWS/Azure/GCP and provide a JSON formatted output. The choice of language and implementation is up to you.

1. Problem Statement -
We need to write code that will query the meta data of an instance within AWS/Azure/GCP and provide a JSON formatted output. The choice of language and implementation is up to you.

2. Approach -Programming Language that needs to use? PYTHON -
The IMDS service of AWS, Azure and GCP are simple rest API's and can be implemented in wide range of programming languages.

3. I am going to choose AWS here as it is widely used by many enterprises for IAAS. There are two API's IMDSv1 and IMDSv2, I am going to use IMDSv1 for this challenge IMDSv2 there is a new requirement to pass a

X-aws-ec2-metadata-token and X-aws-ec2-metadata-token-ttl-seconds
The AWS IMDSv1 has an API

http://169.254.169.254/latest/meta-data/
The first call will return the top level Keys and we need to iterate the list of keys with the same API with the key amended at the end. Some of the keys may return another array of keys.

http://169.254.169.254/latest/meta-data/{key}
Finally we need to keep track all the keys and the values and build the JSON Object.

To obtain a value for a single key we still might need to retrieve the entire meta-data and traverse through the JSON tree to find the value for the given key. For further info refer to AWS docs

In Azure it is fairly easy to retrieve meta data information. On a linux terminal

curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01"
Would give the JSON output of metadata

In GCP it is again similar to the AWS the first request will return a directory and the users have to make further calls to the api to get the values.

curl "http://metadata.google.internal/computeMetadata/v1/instance/" -H "Metadata-Flavor: Google"

3. What we need?
- VPC
- Internet gateway
- 4 Subnets (2 public and 2 private in 2 AZ's)
- Create two Route tables (public for internet and private for the traffic through NAT Gateway)
- Create NAT Gateway
- ELB (Internet and the Internal Load balancer)
- Auto Scaling group

Challenge 3
----------------------
We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
