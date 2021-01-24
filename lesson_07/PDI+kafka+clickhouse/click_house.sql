/*DROP TABLE queue;*/
CREATE TABLE queue (
    host_name String,
    host_role String,
    id UInt64,
    host_time  String
  ) ENGINE = Kafka('kafka:29092', 'worker_live_status_clickhouse', 'group', 'JSONEachRow');

/*DROP TABLE stat_queue;  */
CREATE TABLE stat_queue (
    host_time String,
    host_name String,
    host_role String,
    id UInt64
  ) ENGINE = MergeTree()
  ORDER BY (id); 

CREATE MATERIALIZED VIEW host_status TO stat_queue
    AS SELECT host_time, host_name, host_role, id
    FROM queue;


SELECT count(*)
FROM default.stat_queue