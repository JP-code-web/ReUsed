
-- Inventario de doacoes disponiveis e os seus atributos
select tipoDoa_nome as "Nome do objecto", Doa_desc as "Descricao", ifnull(Doa_marca, "sem marca") as "Marca" , Doa_cor as "Cor", doa_valor as "Valor em euro" ,ifnull(classificacao, "por avaliar") as "Classificacao"  -- teste
from doacao D 
inner join tipo_doacao T
on D.Doa_tipo_ID = T.tipoDoa_ID and D.Doa_existe = 1 
left join avaliacao A
on  a.Ava_do_ID = d.Doa_ID or a.Ava_do_ID = null 
order by "Nome do objecto";

-- Numero do tipo de doaçoes "fogao" disponiveis em inventario avaliadas com classificação B 
select distinct count( tipoDoa_nome) as "fogoes disponiveis"
from tipo_doacao
inner join doacao
on tipo_doacao.tipoDoa_ID = doacao.Doa_tipo_ID
left join avaliacao A 
on  a.Ava_do_ID = doacao.Doa_ID  
where tipoDoa_nome = "fogao" and doacao.Doa_existe = 1 and a.classificacao = "B";


-- Numeros de doadores e Numero de recebedores
select
	(select count(*)
	from doador 
	) as "Numero de doadores",
    (select count(*)
	from recebedor) as "Numero de recebedores"
from dual;

-- Total de doacoes diponiveis por tipo
select distinct tipoDoa_nome as "Doaçoes por tipo", count( tipoDoa_nome )as "Total" 
from tipo_doacao
inner join doacao 
on tipo_doacao.tipoDoa_ID = doacao.Doa_tipo_ID and doacao.Doa_existe = 1 
group by tipoDoa_ID
order by count( tipoDoa_nome );


-- Concelhos onde existem pelo menos cinco doadores 
select  Cod_concelho "Concelho", count(Cod_concelho) as " Numero de Doadores " 
from doador 
inner join codigop
on ID_cp = D_cp_ID
group by Cod_concelho
having count(Cod_concelho) >= 5;

-- Lista de doadores e o seu numero de doacoes ordenadas de forma decendente
select D_ID, concat( D_nomeP ," ", D_nomeU ) as "Nome", count(d_fk_id) as "Numero de doaçoes"
from doacao
right join doador
on D_ID = d_fk_id
group by D_ID
order by count(d_fk_id) desc;









						-- queries muito simples!!
-- Contactos dos Colaboradores
select concat("Colaborador - ",C_nomeP, " ", C_nomeU, " contactável com ",C_contacto) 
from colaborador c, colaborador_contacto x
where x.C_IDc = c.C_ID;
 
-- Informaçoes sobre os Recebedores 
SELECT r_ID as "ID", r_nomeP as "Nome", r_nomeU as "Apelido", r_nascimento as "Data de nascimento",
TIMESTAMPDIFF(YEAR,r_nascimento,CURDATE()) AS "Idade", r_genero as "Genero" 
FROM recebedor;

