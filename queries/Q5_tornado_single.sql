-- Criminal behaviour tested: structure and tempo of deposits into a mixing
-- service, marking the point at which the trail is severed.
select count(*) as deposit_count, sum(value/power(10,18)) as Total_eth, min(block_time) as first_deposit, max(block_time) as last_deposit
from ethereum.transactions
where "from"= 0x77532Dd2eB6E8EaF416F39C65f48cD2369782828 AND "to"= 0xd90e2f925DA726b50C4Ed8D0Fb90Ad053324F31b
