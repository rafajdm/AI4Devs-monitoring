# 1 - Copilot 4o

can you talk to me about this project. Do not repeat all the info in the #file:README.md try to provide a summary of what it does. 
Keep a perspective of a devsecops as our job is to deploy this project using terraform

# 2

@workspace what services, credentials and accounts do we need to deploy this on aws using terraform, from a github action deployment file

# 3

@workspace i dont have an s3 butcket created, do i create one or will terraform do that?

# 4

sounds good. Lets start with our first task first. Creating a github action to perform all the tasks needed. Lets modularize it and go step by step. 

For our first step we will create the base structure of our github action yml.

We will code it into #file:ci.yml 

# 5

@workspace our first job will be to build. our second job will be to run the tests, which i believe is an npm test on the backend and a cypress test on the frontend.
We will also run this job whenever a pull request is created to main branch

# 6

building backend failed. Full stacktrace is:

```
full stacktrace copied here
```

