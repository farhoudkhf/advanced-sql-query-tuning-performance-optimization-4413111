-- Range Partition 
-- create a table with range partition
CREATE TABLE iot_measurement
(location_id INT NOT NULL,
measurement_datetime TIMESTAMP NOT NULL,
temp_celcius INT,
rel_humidity_pct INT)
PARTITION BY RANGE (measurement_datetime)

-- define particular partition
CREATE TABLE iot_measurement_wk1_2024 
PARTITION OF iot_measurement
FOR VALUES FROM ('2024-01-01') TO ('2024-01-08');


CREATE TABLE iot_measurement_wk2_2024 
PARTITION OF iot_measurement
FOR VALUES FROM ('2024-01-08') TO ('2024-01-15');

CREATE TABLE iot_measurement_wk3_2024 
PARTITION OF iot_measurement
FOR VALUES FROM ('2024-01-15') TO ('2024-01-22');

-- LIST partitioning 
CREATE TABLE products 
  (product_id INT NOT NULL,
  product_name TEXT NOT NULL,
  product_descr TEXT,
  product_category TEXT)
PARTITION BY LIST (product_category);

-- create partition
CREATE TABLE product_clothing
PARTITION OF products 
FOR VALUES IN ('casual', 'business', 'formal');

CREATE TABLE product_electronics
PARTITION OF products 
FOR VALUES IN ('mobile', 'tablet', 'laptop');

CREATE TABLE product_kitchen
PARTITION OF products 
FOR VALUES IN ('food-processor', 'cutlery', 'blenders');

-- HASH partitioning
CREATE TABLE customer_interactions 
  (ci_id INT NOT NULL,
  ci_url TEXT NOT NULL,
  time_at_url INT NOT NULL,
  click_sequence INT NOT NULL)
PARTITION BY HASH (ci_id);

-- will allow to create 5 different partitions
CREATE TABLE customer_interactions_1 
PARTITION OF customer_interactions
FOR VALUES WITH (MODULUS 5, REMAINDER 0);

CREATE TABLE customer_interactions_2 
PARTITION OF customer_interactions
FOR VALUES WITH (MODULUS 5, REMAINDER 1);

CREATE TABLE customer_interactions_3 
PARTITION OF customer_interactions
FOR VALUES WITH (MODULUS 5, REMAINDER 2);

CREATE TABLE customer_interactions_4 
PARTITION OF customer_interactions
FOR VALUES WITH (MODULUS 5, REMAINDER 3);

CREATE TABLE customer_interactions_5 
PARTITION OF customer_interactions
FOR VALUES WITH (MODULUS 5, REMAINDER 4);