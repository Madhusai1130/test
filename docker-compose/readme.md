--------------------docker-compose-microservices----------------------

* In this project there are two services. one is billings and another is orders.
* They have two seperate Dockerfiles. 
* A docker-compose file is used to deploy all the microservices in one go.
* To run the apps. Try

        docker-compose -f docker-compose.yml up

* To destroy the services. Try
  
        docker-compose -f docker-compose.yml down
