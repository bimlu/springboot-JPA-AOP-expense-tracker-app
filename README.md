# springboot-JPA-AOP-expense-tracker-app
Build Expense tracker application using springboot, JPA, AOP with containerization using Docker.

**DEMO**
 - Deployed to Heroku Cloud: 

	http://Expense-tracker-3.herokuapp.com
	
**Note:** 
1. It is only running on a free dyno, so it may take some time before it responds.
2. Data will be reset to default after every 15 mins by the scheduler.

**Steps for executing using docker:**
1. Clone/Download the repository.

2. Set all the required environmental variables which be impacted on docker-compose.yml.
   Eg.
        DB_HOST=<container-name> [Note: You can get container-name using "docker ps" command]
        DB_PASS=password
        DB_SCHEMA=expenese_tracker
        ACTIVE_PROFILE=dev [This will be always "**dev**" if it is ran locally. For "**prod**", 
                            it will use heroku.yml and application-prod.properties]
        PORT=7071 [we need to set PORT because the same dockerfile will be used in production build]

3. Build and run the app using docker-compose. This will build the jar file and run the application.
   ```
	    docker-compose up --build
   ```

**Steps to deploy on heroku using docker-compose:**

1. create heroku.yml as docker-compose.yml is not invoked on heroku.

2. If the application contains database then install mysql or any other database 
   from heroku marketplace[https://elements.heroku.com]. 
   
   Note: Before installing you need to add credit/debit card info. Without this it 
         wont allow you to install the database.

3. Set the config vars based on the database url.
         
4. Set the stack:container for the application in order to build with docker-compose.
   ```
      heroku stack:set container -a <application-name>
   ```
  
5. Deploy the application from heroku.

**References**	
1. https://www.thymeleaf.org/documentation.html
2. https://devcenter.heroku.com/articles/build-docker-images-heroku-yml
