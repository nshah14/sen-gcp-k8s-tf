# sen-gcp-k8s-tf

Pre-Requisiste -
1) google project in GCP.
2) Service account which has access of Read/Write/Delete
   * Cloud sql 
   * Compute Instance 
   * Kubernetes Engine 
   * Service Account User
   * Storage 
3) Set up GOOGLE_APPLICATION_CREDENTIALS by pointing to json key file
export GOOGLE_APPLICATION_CREDENTIALS=~/Downloads/sa-json-key.json



# Browse to tf/dev dirctory and run (user terraform verion >.12 )
terraform init

# Create a plan
terraform plan -out out.plan 

# execute the plan
terraform apply out.plan

# To connect with kuberentes cluster 

gcloud container clusters get-credentials CLSUTER_NAME --region REGION_NAME --project PROJECT_NAME


# to deploy web app run build this repo

https://github.com/nshah14/gcp-pg-app.git

# If you dont have java/setup use gcloud console
  1) Run command. 
     mvn compile jib:build
  2) It should create a image and uplaod into gcr repo.

# Modify app-deploy.yaml with the repo name with variable  image= name of the image
# Modify app-deploy.yaml for postgressql database name ( which created after terraform script execution and apperead in output of console)
   SPRING_DATABASE_INSTANCE_NAME =
# Run app-secrets.yaml to create secret which are encoded.(retrieved from  terrafrom console)
# Run app-deploy.yaml to create the deployment
# Run app-service.yaml to deploy the service as loadbalancer on GCP.
# Retrieve Loadbalancer IP  to test
 http://{Your-Loadbalancer-ip}:8080/hello/tom (Should see user doesn't exist)
# To create data 
curl -X PUT http://{Your-Loadbalancer-ip}:8080/hello/tom -H 'cache-control: no-cache' -H 'content-type: application/json' -d '{ "dateOfBirth":"2020-01-18" }'
# To test data 
http://{Your-Loadbalancer-ip}:8080/hello/tom (Should see  msg with number of days left for tom's bday.)


# FURTHER CHANGES
  Ingress to deploy multiple services.
  Add some firewall rules for restricting the access.
  




