-- Criminal behaviour tested: rapid movement of freezable stablecoin
-- holdings out of the primary attacker wallet before issuer intervention.
select "to", count(*) as Tx_count, sum (amount) as Total_USDC
from tokens_evm.transfers
Where "from"= 0x098B716B8Aaf21512996dC57EB0615e2383E2f96 AND blockchain='ethereum' AND symbol= 'USDC'
AND block_time > DATE '2022-03-23' AND block_time < DATE '2022-05-01'
group by "to"
order by Total_USDC DESC
