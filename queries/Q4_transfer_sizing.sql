-- Criminal behaviour tested: fragmentation of stolen funds into multiple
-- transfers, and reconciliation of total outflow against the amount stolen.
select count(*) as Tx_count, sum(value/power(10,18)) as Total_eth, avg(value/power(10,18)) as avg_eth, min(value/power(10,18)) as min_eth, max(value/power(10,18)) as max_eth
from ethereum.transactions
where "from" = 0x098B716B8Aaf21512996dC57EB0615e2383E2f96
AND block_time >= DATE '2022-03-23'
AND block_time < DATE '2022-05-10' AND value > 0
