delete from tmp.tprihnakl;
delete from tmp.tprihj;
delete from tmp.trashnakl;
delete from tmp.trashj;
delete from tmp.tperemnakl;
delete from tmp.tperemj;
delete from tmp.tinvent;
delete from tmp.tskladj;
delete from tmp.tprice;
delete from tmp.tpricej;
delete from tmp.tpart;
update tmp.trashj set reg=0;
update tmp.tperemj set reg=0;
update tmp.tprihj set reg=0;
delete from tmp.kniga;
delete from tmp.tkatalog;
delete from tmp.tbarcode;
insert into tmp.tkatalog (
plu,
name,
ecrname,
shtuka,
ed_izm,
price,
cennik1,
cennik2,
cennik3,
cennik4
)
select 
to_number(plu),
name,
ecrname,
shtuka,
ed_izm,
price,
cennik1,
cennik2,
cennik3,
cennik4
from pos.tkatalog;
insert into tmp.tbarcode
select to_number(plu),barcode from pos.tkatalog
where barcode is not null;
update tmp.tkatalog set ed_izm='кг' where shtuka=1;
update tmp.tkatalog set ed_izm='кг' where ed_izm='кг.';
update tmp.tkatalog set ed_izm='шт.' where ed_izm='шт';
update tmp.tkatalog set ed_izm='бут.' where ed_izm='бут';
update tmp.tkatalog set ed_izm='бан.' where ed_izm='бан';
update tmp.tkatalog set ed_izm='шт.' where ed_izm is null;
commit;
