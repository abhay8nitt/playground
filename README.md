# playground
 All services should be developed in Python 3.7

1. API
   ```
   API should put the request in a Database Table and trigger an event in the Kafka Queue
   Add Request to carry out file statistics report
    Input: UserId, File
    Output: Timestamp, 200 - Success Status
            Timestamp, 400 - Success failure
   API should redirect to the reporting service
   View statistics report by date/time
    Input: UserId
    Output: Array of file statistics, Status 200
            Success.. User not found, 204
   ```
2. File Processor
   ```
   Get from Kafka queue, ensure that it is read once, update status and delete post processing. Also the file processor would      read the data from the database
   Flag the request status - Processing, Done, Delete Request
   Store the results in report table
   
   ```
   
3. Report Generator
   ```
   Exposes an internal EP for the customer 
   Input: User Id
   Output: Aggregated report from the DB table as a json report.
   
   ```

4. Queueing Service - Kafka etc
   ```
   Producer: UUID, Status/ Visibility
          API service will write to the Kafka topic
   Consumer: File Processor Service, Once done would delete the request
   
   ```
   
5. Database - PostGress/MySQl/SQLLite
   ```
   Table - Request Table
            Schema: UUID, CustomerID, File Blob, Created Time Stamp, Processed Time Stamp
            API updates Request Table
           Report Table
            Schema: UUID, CustomerID, FileName, Size, Word Count, Content-Type, Lines
            File Processor Updates it
    ```       
            
 6.  Shell Scripts to install database 4 and 5
 
 7. Since we are running 18.04 we have to implement systemd files instead of upstart service scripts.Looks like the user      specifc service files have been discontinued
 ```
     a) Create /etc/systemd/system/myapp.service
     b) Sample service - [myapp.service]
     
         [Unit]
         Description=myapp

         [Service]
         User=myapp
         Group=myapp
         ExecStart=/home/user/test.sh
         StandardOutput=syslog
         StandardError=syslog
         SyslogIdentifier=myapp
         Restart=on-failure
         RestartSec=50s
         StartLimitInterval=5min
         StartLimitBurst=5
         TimeoutSec=infinity

         [Install]
         WantedBy=multi-user.target
         
     c) Systemctl reload will be required
        systemctl daemon-reload
     d) Restarting/starting/stopping/status of service
        sudo systemctl restart myapp
        sudo systemctl start myapp
        sudo systemctl stop myapp
        sudo systemctl status myapp
     e) Check service logs
        journalctl -u myapp
     f) To filter logs one has to write filters
        Create a file myapp.conf and copy in the syslog path /etc/syslog-ng/conf.d/
        contents of the file should be as under
        
        filter f_myapp { match("myapp" value("LOGHOST")); };
        destination d_myapp { file("/var/log/myapp/myapp.log"); }; // Need to create a folder myapp in the ant script
        log { source(s_src); filter(f_myapp); destination(d_myapp); };
        
        More context here https://github.com/balabit/syslog-ng/issues/2344
  ```   
 
 # Ubuntu Environment Setup
   1. Install Ubuntu 16.04
   2. Install Python 3.7
      ```
        sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
        wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
        tar -xf Python-3.7.3.tar.xz
        cd Python-3.7.3
        ./configure --enable-optimizations
        sudo make altinstall
        python3.7 -V
      ``` 
   3. Install pycharm
      ```
      sudo snap install pycharm-community --classic
      pycharm-community { to open the app ]
      ```
   4. Install tilix on Ubuntu - equivalent of iterm
      ``` 
      Download: https://www.google.com/url?q=https://github.com/gnunn1/tilix/releases
      sudo unzip tilix.zip -d /
      sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
      tilix [ Search for the application ]
      ```
         
         
            
           
   
   
   
