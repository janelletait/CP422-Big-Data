DEFINE CSVLoader org.apache.pig.piggybank.storage.CSVLoader();

NY_ABNB = LOAD '$INPUT' USING CSVLoader(',') AS
       (id:int,
	    name:chararray,
		host_id:int,
		host_name:chararray,
		neighbourhood_group:chararray,
		neighbourhood:chararray,
		latitude:double,
		longitude:double,
		room_type:chararray,
		price:double,
		minimum_nights:int,
		number_of_reviews:int,
		last_review:chararray,
		reviews_per_month:double,
		calculated_host_listings_count:int,
	    availability_365:int);
		
		
		
	ABNB = filter NY_ABNB by number_of_reviews >= 10;
	ABNB_2019 = filter ABNB by STARTSWITH(last_review, '2019') == true;
	ABNB_COL = FOREACH ABNB_2019 GENERATE $4, $9, $15;
	ABNB_GROUP = group ABNB_COL by neighbourhood_group;
	ABNB_FLAT = FOREACH ABNB_GROUP GENERATE FLATTEN(group) AS neighbourhood_group, AVG(ABNB_COL.price) as price, MAX(ABNB_COL.availability_365) as availability_365;
	
	
	

	STORE ABNB_FLAT into '$OUTPUT' USING PigStorage('\t');
		
		
