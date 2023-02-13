## MAC/Ubuntu/Unix only
## REMEMBER TO CONFIGURE .env file properly before you proceed
include .env
export

##############################
##  Essential tools: LOCAL  ##
##############################

default:
	@echo "dotenv loaded? ${ADMIN_NAME}"

build: #in case you want to create all the images
	sudo docker-compose build

push: #push your service to the remote docker hub for deployment
	sudo docker-compose push

###############################
##  Essential tools: REMOTE  ##
###############################

# copy docker-compose.yml, Makefile, .env to the remote server

#remember to test if the service runs properly!!
pull:
	sudo docker-compose pull

#check if any error messages will come out
testrun:
	sudo docker-compose up

#after confirming you can run as demon
run:
	sudo docker-compose up -d

cleanrun:
	sudo docker-compose up --force-recreate

stop:
	sudo docker-compose down

#########################
##  Other useful tools ##
#########################

cleanrebuild: #make sure you know what you are doing
	sudo docker-compose rm -f

buildclient:
	sudo docker-compose build client
	sudo docker-compose push client

buildserver:
	sudo docker-compose build server
	sudo docker-compose push server

runmysql:
	sudo docker-compose up mysql

fixdockerconfig:
	rm ~/.docker/config.json