# IoT-Data-with-Amazon-Kinesis

Build a Visualization and Monitoring Dashboard for IoT Data with Amazon Kinesis Analytics and Amazon QuickSight


![image](https://user-images.githubusercontent.com/48589838/77183351-357a6680-6af4-11ea-92a6-8f86db978554.png)

Implementation
AWS IoT, Amazon Kinesis, and Amazon QuickSight are all fully managed services, which means you can complete the entire setup in just a few steps using the AWS Management Console.


### Step 1. Set up your AWS IoT data source


Generate sample Data
Running the sbs.py Python script generates fictitious AWS IoT messages from multiple SBS devices. The IoT rule sends the message to Firehose for further processing.


### Step 2. Create three Firehose delivery streams

you require three Firehose delivery streams:  one to batch raw data from AWS IoT, and two to batch output device data and aggregated data from Analytics.


### Step 3. Set up AWS IoT to receive and forward incoming data


### Step 4: Create an Analytics application to process data


sample SQL query that generates two output streams:

DESTINATION_SQL_BASIC_STREAM contains the device ID, device parameter, its value, and the time stamp from the incoming stream.
DESTINATION_SQL_AGGREGATE_STREAM aggregates the maximum and minimum values of temperatures from the sensors over a one-minute period from the incoming data.


### Step 5: Connect the Analytics application to output Firehose delivery streams


### Step 6: Set up Amazon QuickSight to analyze the data


To build the visualization dashboard, ingest the processed CSV files from the S3 bucket into Amazon QuickSight.

![image](https://user-images.githubusercontent.com/48589838/77183723-cf421380-6af4-11ea-963a-f090a624b3b9.png)
![image](https://user-images.githubusercontent.com/48589838/77183746-d701b800-6af4-11ea-9884-18174f9d6803.png)



###### reference material:https://aws.amazon.com/blogs/big-data/build-a-visualization-and-monitoring-dashboard-for-iot-data-with-amazon-kinesis-analytics-and-amazon-quicksight/
