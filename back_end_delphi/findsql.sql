select n.nn,
n.name,
n.data,
n.ed_izm,
n.kol_vo,
n.cenasnds,
n.cenareal,
j.post_name from 
tmp.tprihnakl n,tmp.tprihj j
where n.nom=j.nom
