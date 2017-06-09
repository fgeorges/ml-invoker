# Tests

To load modules and deploy test code:

    # setup databases and server
    > mlproj setup
    
    # load docs on Documents
    > mlproj load -B Documents test/data/
    
    # deploy modules
    # option -b modules not necessary
    > mlproj deploy test/src/
    
    # deploy modules on 2d db
    > mlproj deploy -b db-two test/db-two/

Then go to the root of the test app server, at the following URL
(adapt the host and port number as required):

    http://ml9ea3:8050/
