DELIMITER //
	create trigger entra_bem
	after insert on doacao 
	for each row 
	begin							-- da tabla audit										-- da tabela doacao
	insert into audit_Entrada (marca, descr, au_doador_ID, au_doacao_ID) values (new.Doa_marca, new.Doa_desc, new.d_fk_id,new.Doa_ID);
    END//
DELIMITER ;

/* dados de teste
	insert into doacao (Doa_desc ,Doa_marca, Doa_cor, Doa_tipo_ID, Doa_existe,doa_valor) value ("3patas",null,"cinzento",4,1,15);
    insert into doacao (Doa_desc ,Doa_marca, Doa_cor, Doa_tipo_ID, Doa_existe,doa_valor) value (null,null,"cinzento",4,1,20);
    insert into doacao (Doa_desc ,Doa_marca, Doa_cor, Doa_tipo_ID, Doa_existe,doa_valor) value (null,"cater","cinzento",4,1,15);
    */
    
-- --------------------------  
									
DELIMITER //		
	create trigger pedidos_sai
	after update on doacao
	for each row 
    begin
    if new.Doa_existe = 0
	then
	insert into audit_saida (Doa_ID,Doa_desc,Doa_marca,Doa_cor,existe) values (new.Doa_ID,new.Doa_desc,new.Doa_marca,new.Doa_cor,new.doa_existe);
    end if;
    END//
DELIMITER ;

-- drop trigger entra_bem;
/*  dados de teste 
UPDATE doacao SET Doa_cor= "verde" WHERE doa_ID = 4;
UPDATE doacao SET Doa_marca= "rart" WHERE doa_ID = 15;
UPDATE doacao SET Doa_existe= 0  WHERE doa_ID = 16;
UPDATE doacao SET Doa_existe= 0  WHERE doa_ID = 1;
UPDATE doacao SET Doa_existe= 0  WHERE doa_ID = 2;
*/

-- --------
DELIMITER //		
	create trigger comfimar_pedido
	after insert on registo_saida
	for each row 
    begin					-- audit_s				-- registo_saida															
	insert into audit_saida (Doa_ID,existe,    Doa_desc,Doa_marca,Doa_cor) values (new.Sai_Doa_ID, 0,"Nao disponivel","Nao disponivel","Nao disponivel");
    END//
DELIMITER ; 
-- drop trigger comfimar_pedido
