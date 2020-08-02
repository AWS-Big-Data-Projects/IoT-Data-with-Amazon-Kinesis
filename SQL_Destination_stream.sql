CREATE OR REPLACE STREAM "DESTINATION_SQL_BASIC_STREAM" (dateTime TIMESTAMP, deviceId VARCHAR(8), deviceParameter VARCHAR(16), deviceValue INTEGER);

-- Create a pump that continuously selects from the source stream and inserts it into the output data stream
CREATE OR REPLACE PUMP "STREAM_PUMP_1" AS INSERT INTO "DESTINATION_SQL_BASIC_STREAM"

-- Filter specific columns from the source stream
SELECT STREAM "dateTime", "deviceId", "deviceParameter", "deviceValue" FROM "SOURCE_SQL_STREAM_001";

-- Create a second output stream with three columns, which is used to send aggregated min/max data to the destination
CREATE OR REPLACE STREAM "DESTINATION_SQL_AGGREGATE_STREAM" (dateTime TIMESTAMP, highestTemp SMALLINT, lowestTemp SMALLINT);

-- Create a pump that continuously selects from a source stream 
CREATE OR REPLACE PUMP "STREAM_PUMP_2" AS INSERT INTO "DESTINATION_SQL_AGGREGATE_STREAM"

-- Extract time in minutes, plus the highest and lowest value of device temperature in that minute, into the destination aggregate stream, aggregated per minute
SELECT STREAM FLOOR("SOURCE_SQL_STREAM_001".ROWTIME TO MINUTE) AS "dateTime", MAX("deviceValue") AS "highestTemp", MIN("deviceValue") AS "lowestTemp" FROM "SOURCE_SQL_STREAM_001" WHERE "deviceParameter"='Temperature' GROUP BY FLOOR("SOURCE_SQL_STREAM_001".ROWTIME TO MINUTE);