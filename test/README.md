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

Then go to the following URL, on the test app server (adapt the host
and port number as required):

    http://ml9ea3:8050/hello.xqy
