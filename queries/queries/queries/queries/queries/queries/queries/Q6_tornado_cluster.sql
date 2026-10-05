-- Criminal behaviour tested: volume and structure of mixing across the full
-- dispersal cluster, identifying which destination addresses deposited
-- directly into Tornado Cash and which routed through further hops first.
with cluster as (
select distinct "to" as address
from ethereum.transactions
where "from" = 0x098b716b8aaf21512996dc57eb0615e2383e2f96 
AND block_time >= DATE '2022-03-23'
AND block_time < DATE '2022-05-10'
AND value/power(10,18) > 100
)
select tx."from" as depositor, count(*) as deposits, sum(tx.value/power(10,18)) as Total_eth, min(tx.block_time) as first_deposit,
max(tx.block_time) as last_deposit
from ethereum.transactions tx
join cluster c on tx."from" = c.address
where tx."to" = 0xd90e2f925da726b50c4ed8d0fb90ad053324f31b
group by tx."from"
order by Total_eth DESC
