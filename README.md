Dalite cutover scripts
======================

This repository sets up a instance that can be used to move a data from a S3-based instance 
to open-stack based instance. 

It copies: 

1. Mysql database
2. Log downloader logs
3. S3 Container 

Prerequisites
-------------

1. You need to have access to old dalite instance
2. You need to have new dalite instance provisioned, with database, swift etc. set up. 
   See these repositories for how to: https://github.com/open-craft/deployment-deploy-services .  
3. Note following credentials: 

   * AWS S3 credentials for the old dalite
   * Bucket name for S3
   * Mysql credentials for old dalite
   * OpenStack Swift credentials for new dalite
   * Container name for new dalite 
   * Mysql Credentials for the new dalite. 
   
4. Note following things: 
   
   * Director instance does not need access to old production dalite mysql
   * Director instance does need access to download S3 bucket
   * Director instance does need access to new production dalite mysql 
   
Deploy director
---------------

1. Put director IP in hosts file
2. Create `private.vars` file containing required credentials, you'll need to set following variables there
       
    * DALITE_MEDIA_CONTAINER - Name of the container that will contain dalite media
    * DALITE_SWIFT_BACKUP_RC - Swift RC file containing a password, with access rw access to DALITE_MEDIA_CONTAINER
    * NEW_DALITE_HOST - Host or IP of the new dalite
    * OLD_DALITE_HOST - Host or IP of the new dalite
    * NEW_MYSQL_DALITE_DATABASE
    * NEW_MYSQL_DALITE_HOST
    * NEW_MYSQL_DALITE_PASSWORD
    * NEW_MYSQL_DALITE_USER
    * OLD_DALITE_MYSQL_HOST
    * OLD_DALITE_MYSQL_NAME
    * OLD_DALITE_MYSQL_PASSWORD
    * OLD_DALITE_MYSQL_USER
    * OLD_DALITE_AWS_S3_ACCESS_KEY_ID
    * OLD_DALITE_AWS_S3_SECRET_ACCESS_KEY
    * OLD_DALITE_AWS_STORAGE_BUCKET_NAME
   
3. Create a big OpenStack instance.
4. Download roles: `ansible-galaxy install -r requirements.yml -f`
5. Provision it using `deploy-director.yaml`.
 
Prepare director (manual steps ahead)
-------------------------------------

1. Install your ssh key to `ubuntu` user on old daltie production instance
2. Install your key to new `ubuntu` user on new daltie production instance
4. Add your key to `log-download` user in new dalite 
2. Login to director forwarding your auth there `ssh -A` 
3. Configure `awscli`: `aws configure` (copy settings to s3 from `private.vars`)

Testing steps
-------------

Before running cut off please: 

1. Inspect contents of all templates whether they make sense
2. Run commands one by one 
3. Run `run-all.sh`. 

Cutoff steps
------------

1. If everything is set up just run `run-all.sh`. 
