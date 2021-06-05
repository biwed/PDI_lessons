CREATE TABLE test_write (
    id UInt64,
    host_name String,
    even_type String,
    event_count Int64 
  ) ENGINE = MergeTree()
  ORDER BY (id); 


SELECT count(*)
FROM default.test_write