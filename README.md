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



vi src/main/resources/application.properties
  gcloud sql connect dev-pg11-instance --user=postgres --quiet
  vi src/main/resources/application.properties
 cat src/main/resources/application.properties
 mvn compile jib:dockerBuild
  docker images
  docker run -p 8080:8080 -t gcr.io/sen-tf-k8s-dev/rev-pg-app
  docker tag gcr.io/sen-tf-k8s-dev/rev-pg-app gcr.io/sen-tf-k8s-dev/rev-pg-app
  docker tags
docker push gcr.io/sen-tf-k8s-dev/rev-pg-app
  docker run -p 8080:8080 -t gcr.io/sen-tf-k8s-dev/rev-pg-app

  curl -X PUT http://35.225.22.63:8080/hello/nvwed -H 'cache-control: no-cache' -H 'content-type: application/json' -d '{ "dateOfBirth":"2020-01-18" }'

  gcloud container clusters get-credentials dev-sen-gke-cluster --region us-central1 --project sen-tf-k8s-dev