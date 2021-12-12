
set mapred.reduce.tasks=1;

DROP TABLE IF EXISTS abnb;

CREATE EXTERNAL TABLE abnb (
        id int,
	    name string,
		host_id int,
		host_name string,
		neighbourhood_group string,
		neighbourhood string,
		latitude double,
		longitude double,
		room_type string,
		price double,
		minimum_nights int,
		number_of_reviews int,
		last_review string,
		reviews_per_month double,
		calculated_host_listings_count int,
	    availability_365 int
       )
	   
	   
	   
	   
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	STORED AS TEXTFILE
	LOCATION "${INPUT}";

	

	INSERT OVERWRITE DIRECTORY "${OUTPUT}"
	SELECT room_type, count(room_type) FROM abnb group by room_type;
	
	   
	   
    
	   
       

