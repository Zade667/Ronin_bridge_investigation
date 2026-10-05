-- Criminal behaviour tested: dispersal of stolen ETH from the primary
-- attacker wallet. Measures how many destination addresses were used and
-- how concentrated the outflow was across them
select "to", count(*) as Tx_count, sum(value/power(10,18)) as Total_ETH
from ethereum.transactions
where "from" = 0x098b716b8aaf21512996dc57eb0615e2383e2f96
  and block_time >= DATE '2022-03-23'
  and block_time < DATE '2022-05-04'
group by "to"
order by Total_ETH DESC
