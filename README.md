# README

* Description: With this project you are
- Being able to create a service specifying the origin and delivery address with its latitude and longitude.
- Create a one stop service.
- List all the services you have requested.
- Cancel a requested service.
- For each service, see a detail where you can see addresses of origin, collection, service status, if there is already an assigned driver you can see license plates, driver's name and position -- driver's GPS. - Each time you create a service, a record is stored in the database with the log returned by the picap server.

* Ruby version: 2.7.2

* Configuration: Clone the project to your local, run bundle install, run rails yarn:install to install all dependencies, create a neew file .env and copy from .env.example, include your personal tokens, finally run rails server
