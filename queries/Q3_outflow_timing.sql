-- Criminal behaviour tested: operational tempo of the laundering. Measures
-- the delay between theft and first movement, and how transfers were paced
-- across the dispersal window.
select block_time, "to", value/power(10,18) as eth
from ethereum.transactions
where "from"= 0x098B716B8Aaf21512996dC57EB0615e2383E2f96 AND block_time >= DATE '2022-03-23'
order by block_time
