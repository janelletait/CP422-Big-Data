# CP422-Big-Data
Assignment 1:
Instructions
Now we have the the weather data set (same format as Lecture 6 Slide 13-14).

For the weather in the morning (at 6am) in Summer (May to August), what are the average of the air temperature each year? In the output, each line should be a year, followed by the average.

Use the given code to implement your map and reduce functions.  


Assignment 2:
Instructions
Write a pig script for the given data set for New York's AirBndB. The columns are: 

id,name,host_id,host_name,neighbourhood_group,neighbourhood,latitude,longitude,room_type,price,minimum_nights,number_of_reviews,last_review,reviews_per_month,calculated_host_listings_count,availability_365

Questions:
1. Write a Pig program to analyze the information of each neighbourhood group, and output to the folder under the home directory "AirBndB_ neighbourhood _ group".
Step 1. Only analyze the records with number_of_reviews > 10 and last review is in 2019.
Step 2. For The records from Step 1, get the general neighbourhood group information and store: neighbourhood_group as the 1st column, average price of the neighbourhood_group as the 2nd column, max number of availability days for the neighbourhood_group as 3rd column. 
Note: The number of lines in the output is the same as the number of neighbourhood groups. 

2. Write a Hive program (.sql) to show the information of each room type. Print on the Console the room_type, and the number of records for each room_type.
Note: The number of lines in the output is the same as the number of room types. 

Submit answer1.pig, and answer2.sql only.


Assignment 3:
Instructions
The training data set in LibSVM is given (Please refer to Slide 30 for the description of LibSVM data format). Submit a Python file to include the following implementations: 

1. Using Spark MLlib, train a linear regression model with 100 iterations and with intercept. Output the model weights and intercept.

2. Predict on the following example (features in LibSVM format, you can rewrite this example in your code to a vector representation and then predict its value):
 
"1:0.343158 2:0.762712 3:-0.27243 4:0.678756 5:-0.0348259 6:0.163445 7:-0.00635324 8:-0.295056 9:-0.396509 10:0.142857 11:-0.256757 12:-0.118812 13:0.294964 14:0.821429"
