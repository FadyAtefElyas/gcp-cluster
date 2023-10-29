
# HELLO_WORLD_THIS_IS_FADY

this is a full project to deploy mongodb statefulset on a gke cluster managed by sidecar container and also deploying a simple nodejs app to test the database it will count the visits on the load balancer external ip

To build this structure you should follow those steps

1- download the terraform folder

2- insert the right variables for the terra form code and “starup-script.sh” also the image name in statefulset.yaml at (line "20,37") and deployment.yaml at (line 19) 
(ALL OF THEM IS REQUIRED)

3- change the credential file and override the file path

4- connect to your machine and run this comands

gcloud container clusters get-credentials <cluster-name> --region <cluster-region> --project <project-name>

git clone https://github.com/FadyAtefElyas/yaml-files.git
   
cd yaml-files/

### dont forget to override the image name in statefulset.yaml and deployment.yaml
   
kubectl apply -f .
   
cd ../

after applying those steps it will create 

mongo-0 , mongo-1 , mongo-2 

3 pods with mongodb iamge with keyfile , and sidecar container

that will take care of the statefulset configrations 

the default username for this database is “fady”
and the password is “123”

and you can change them from statefulset.yaml file in lines (30,32,48,50)

