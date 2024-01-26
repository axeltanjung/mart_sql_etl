-- mart_metrik
delete from mart_metrik;
insert into mart_metrik
select	year as "tahun",
		count(distinct user_id) as "user",
		count(bill_id) as "customer",
		sum(line_item_amount) as "penjualan",
		count(distinct description) as "barang",
		sum(bill_discount) as "diskon"
from fact_transaction
group by "tahun";

--mart_zone
delete from mart_zone;
insert into mart_zone
select	year as "tahun",
		zone_name as "zone",
		sum(line_item_amount) as "penjualan"
from fact_transaction
group by "tahun","zone"
order by "tahun" asc;

--mart_zone_day
delete from mart_zone_day;
insert into mart_zone_day
select	transaction_date as "tanggal",
		zone_name as "zone",
		sum(line_item_amount) as "penjualan"
from fact_transaction
group by "tanggal","zone"
order by "tanggal" asc;
