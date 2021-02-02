/************************************************************
	Grupo: 1    |  Curso: L-IG
  	UC: Bases de Dados

	Pojeto: ReUsed

  	Nome: João Pedro Pó (20190946)
  	Nome: João Afonso Águas (50039634)
************************************************************/

drop database if exists reused;
Create database reused;
use reused;

/************************************************************
*  Lista de Entidades Informaconais Primárias
************************************************************/

CREATE TABLE escala (
    Esc_ID INT AUTO_INCREMENT,
    PRIMARY KEY (Esc_ID),
    Esc_Descricao CHAR(20) NOT NULL UNIQUE CHECK (Esc_Descricao IN ('MAU' , 'MUITO BOM',
        'EXCELENTE',
        'USAVEL',
        'BOM'))
);

CREATE TABLE categoria (
    Cat_ID INT AUTO_INCREMENT,
    PRIMARY KEY (Cat_ID),
    Cat_nome VARCHAR(60) NOT NULL UNIQUE CHECK (Cat_nome IN ('Sem categoria' , 'Bronze', 'Prata', 'Ouro')),
    Cat_pontos INT
);

CREATE TABLE tipo_Doacao (
    tipoDoa_ID INT AUTO_INCREMENT,
    PRIMARY KEY (tipoDoa_ID),
    tipoDoa_nome VARCHAR(60) NOT NULL UNIQUE
);

create table codigoP(							
     /*
	ID_cp int auto_increment,	
	PRIMARY KEY (ID_cp),
    Cod_cidade varchar(30),
	Cod_distrito varchar(30),
	Para lisboa, Vtejo, entre D.e M., beira L, algarve */
	Cod_concelho varchar(30),
    Cod_postal_4D int check((Cod_postal_4D >= 1000 and Cod_postal_4D <= 4995) or (Cod_postal_4D >= 8000 and Cod_postal_4D <= 8995)) not null, 
	Cod_postal_3D int check(Cod_postal_3D >=000 and Cod_postal_3D <= 999 ) not null,
	ID_cp int unique auto_increment,
    PRIMARY KEY (Cod_postal_4D,Cod_postal_3D),
    unique (Cod_postal_4D,Cod_postal_3D)
);

create table audit_Entrada(
	auditID INT AUTO_INCREMENT,
		PRIMARY KEY (auditID),
	marca varchar (30),
	descr varchar (70),
	au_doador_ID INT,	-- id doador
	au_doacao_ID int	-- id doaçao
);

CREATE TABLE IF NOT EXISTS audit_saida (
    auditID INT AUTO_INCREMENT,
		PRIMARY KEY (auditID),
    Doa_desc VARCHAR(70),
    Doa_marca VARCHAR(30),
    existe BOOLEAN,
    Doa_cor VARCHAR(30),
    Doa_ID INT,
    auditd_date datetime default now()
);

/************************************************************
*  Lista de Entidades Informaconais com FK
************************************************************/
CREATE TABLE colaborador (
    C_ID INT AUTO_INCREMENT,
    PRIMARY KEY (C_ID),
    C_nomeP VARCHAR(60) NOT NULL,
    C_nomeU VARCHAR(60) NOT NULL,
    C_genero VARCHAR(1) CHECK (c_genero = 'M' OR c_genero = 'F'),
    C_nascimento DATE CHECK (C_nascimento <= '2003-01-01'
        AND C_nascimento >= '1901-01-01'),
    C_cp_ID INT,
    FOREIGN KEY (C_cp_ID)
        REFERENCES CodigoP (ID_cp)
);

CREATE TABLE doador (
    D_ID INT AUTO_INCREMENT,
    PRIMARY KEY (D_ID),
    D_nomeP VARCHAR(60) NOT NULL,
    D_nomeU VARCHAR(60) NOT NULL,
    D_genero VARCHAR(1) CHECK (D_genero = 'M' OR D_genero = 'F'),
    D_nascimento DATE CHECK (d_nascimento <= '2003-01-01'
        AND d_nascimento >= '1901-01-01'),
    D_cat_Cat_ID INT,
    FOREIGN KEY (D_cat_Cat_ID)
        REFERENCES categoria (Cat_ID),
    D_cp_ID INT,
    FOREIGN KEY (D_cp_ID)
        REFERENCES CodigoP (ID_cp)
);

CREATE TABLE recebedor (								
    R_ID INT AUTO_INCREMENT, 
    PRIMARY KEY (R_ID),
    R_nomeP VARCHAR(60) NOT NULL,
    R_nomeU VARCHAR(60) NOT NULL,
    R_genero VARCHAR(1) CHECK (r_genero = 'M' OR r_genero = 'F'),
    R_nascimento DATE CHECK (r_nascimento <= '2003-01-01'
        AND r_nascimento >= '1901-01-01')
    /*
    R_cp_ID INT
    FOREIGN KEY (R_cp_ID)		-- novo table  
        REFERENCES CodigoP (ID_cp)
	*/
);

CREATE TABLE doador_contacto (
    D_contacto VARCHAR(100),
    D_IDc INT NOT NULL,
    PRIMARY KEY (D_IDc , D_contacto),
    FOREIGN KEY (D_IDc)
        REFERENCES Doador (D_ID)
);

CREATE TABLE recebedor_contacto (
    R_contacto VARCHAR(100),
    R_IDc INT NOT NULL,
    PRIMARY KEY (R_IDc , R_contacto),
    FOREIGN KEY (R_IDc)
        REFERENCES Recebedor (R_ID)
);

CREATE TABLE colaborador_contacto (
    C_contacto VARCHAR(100),
    C_IDc INT NOT NULL,
    PRIMARY KEY (C_IDc , C_contacto),
    FOREIGN KEY (C_IDc)
        REFERENCES Colaborador (C_ID)
);

CREATE TABLE doacao (
    Doa_ID INT AUTO_INCREMENT,
    PRIMARY KEY (doa_ID),
    Doa_desc VARCHAR(70) DEFAULT NULL,
    Doa_marca VARCHAR(30) DEFAULT NULL,
    Doa_existe BOOLEAN DEFAULT "1",
    Doa_cor VARCHAR(30) DEFAULT NULL,
    Doa_tipo_ID INT,
    d_fk_id INT not null,		-- novo
    doa_valor DECIMAL(7) DEFAULT 0,
    FOREIGN KEY (Doa_tipo_ID)			-- tipo de doaçao
        REFERENCES tipo_doacao (tipoDoa_ID),
	FOREIGN KEY (d_fk_id)		-- novo fk do doador
        REFERENCES doador (D_ID)
);

CREATE TABLE avaliacao (
    classificacao CHAR(1) NOT NULL CHECK (classificacao IN ('A' , 'B', 'C', 'D', 'E')),
    dataAvalia DATE,
    Ava_esc_ID INT NOT NULL,
    FOREIGN KEY (Ava_esc_ID)
        REFERENCES escala (Esc_ID),
    Ava_do_ID INT UNIQUE NOT NULL,
    FOREIGN KEY (Ava_do_ID)
        REFERENCES doacao (Doa_ID),
    Ava_Colab_ID INT NOT NULL,
    FOREIGN KEY (Ava_Colab_ID)				
        REFERENCES colaborador (C_ID)
);


/************************************************************
*  Lista de Entidades de Associação 
************************************************************/
/*
CREATE TABLE entrada (
    DataEntrada DATE CHECK (DataEntrada >= '2020-02-02'),
    EntD_ID INT,
    EntDoa_ID INT,
    PRIMARY KEY (EntD_ID , EntDoa_ID),
    FOREIGN KEY (EntD_ID)
        REFERENCES Doador (D_ID),
    FOREIGN KEY (EntDoa_ID)
        REFERENCES Doacao (Doa_ID)
);*/

CREATE TABLE registo_saida (
    DataSaida DATEtime default now() CHECK (Datasaida >= '2020-02-02'),	-- DATA DE REFERENCIA DA EMPRESA REUSED !!!!
    Sai_Doa_ID INT,
    Sai_R_ID INT,
    PRIMARY KEY (Sai_Doa_ID , Sai_R_ID),
    FOREIGN KEY (Sai_Doa_ID)
        REFERENCES Doacao (Doa_ID),
    FOREIGN KEY (Sai_R_ID)
        REFERENCES Recebedor (R_ID)
);

create table habita (
	codigop_fk_id int,
	r_fk_id int,
    tipo_habitacao varchar (30),
    PRIMARY KEY (codigop_fk_id, r_fk_id),
    FOREIGN KEY (codigop_fk_id)
        REFERENCES CodigoP (ID_cp),
	FOREIGN KEY (r_fk_id)
        REFERENCES recebedor (R_id)
);
