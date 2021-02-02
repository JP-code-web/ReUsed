create view Utilizadores_da_aplicacao as
select concat( "D", D_ID) as "ID" ,D_nomeP as "Primeiro Nome", D_nomeU as "Apelido" ,D_nascimento as "data de nacimento", "doador" as status
from doador
union
select concat( "R", R_ID) as "ID", R_nomeP as "Primeiro Nome", R_nomeU as "Apelido", R_nascimento as "data de nacimento", "recebedor" as status
from recebedor;

--

create view doadores_doacoes as
select D_ID, concat( D_nomeP ," ", D_nomeU ) as "Nome", count(d_fk_id) as "Numero de doaçoes"
from doacao
right join doador
on D_ID = d_fk_id
group by D_ID
order by count(d_fk_id) desc;