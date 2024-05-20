CREATE DATABASE ATIV3;  

USE ATIV3;  

CREATE TABLE REGION  
(  
    REG_INT_ID INT NOT NULL IDENTITY(1,1),  
    REG_STR_DESC VARCHAR(50) NOT NULL,  

    CONSTRAINT PK_REGION_ID PRIMARY KEY(REG_INT_ID) 
); 


CREATE TABLE STATE 
(  
    STA_INT_ID INT NOT NULL IDENTITY(1,1),  
    REG_INT_ID INT NOT NULL, 
    STA_STR_DESC VARCHAR(70) NOT NULL,  
    STA_STR_SIGLA CHAR(2),  

    CONSTRAINT PK_STATE_ID PRIMARY KEY(STA_INT_ID),
	CONSTRAINT FK_STATE_REGION_ID FOREIGN KEY(REG_INT_ID) REFERENCES REGION(REG_INT_ID)
);  


CREATE TABLE CITY( 
    CIT_INT_ID INT NOT NULL IDENTITY(1,1), 
    STA_INT_ID INT NOT NULL, 
    CIT_STR_DESC VARCHAR(70), 

    CONSTRAINT PK_CITY_ID PRIMARY KEY(CIT_INT_ID),
	CONSTRAINT  FK_CITY_STATE_ID FOREIGN KEY(STA_INT_ID) REFERENCES STATE(STA_INT_ID)
); 

CREATE TABLE PEOPLE 
( 
    PEO_INT_ID INT NOT NULL IDENTITY(1,1), 
    CIT_INT_ID INT NOT NULL, 
    PEO_STR_NOME VARCHAR(70) NOT NULL,  
    PEO_STR_CPF CHAR(11) NOT NULL,  

    CONSTRAINT PK_PEOPLE_ID PRIMARY KEY(PEO_INT_ID), 
    CONSTRAINT UK_PEOPLE_CPF UNIQUE(PEO_STR_CPF),
	CONSTRAINT FK_PEOPLE_CITY_ID FOREIGN KEY(CIT_INT_ID) REFERENCES CITY(CIT_INT_ID)
);  

/* inserindo as regiões*/
INSERT INTO REGION (REG_STR_DESC) VALUES ('Sudeste');
INSERT INTO REGION (REG_STR_DESC) VALUES ('Sul');
INSERT INTO REGION (REG_STR_DESC) VALUES ('Centro-oeste');
INSERT INTO REGION (REG_STR_DESC) VALUES ('Nordeste');
INSERT INTO REGION (REG_STR_DESC) VALUES ('Norte');

/*inserindo os estados com suas respectivas siglas*/
INSERT INTO STATE (STA_STR_DESC, STA_STR_SIGLA, REG_INT_ID ) VALUES
    ('São Paulo', 'SP', 1),
    ('Rio de Janeiro', 'RJ', 1),
    ('Espírito Santo', 'ES', 1),
    ('Minas Gerais', 'MG', 1),
    ('Paraná', 'PR', 2),
    ('Rio Grande do Sul', 'RS', 2),
    ('Santa Catarina', 'SC', 2),
    ('Goiás', 'GO', 3),
    ('Mato Grosso', 'MT', 3),
    ('Mato Grosso do Sul', 'MS', 3),
    ('Alagoas', 'AL', 4),
    ('Bahia', 'BA', 4),
    ('Ceará', 'CE', 4),
    ('Maranhão', 'MA', 4),
    ('Pernambuco', 'PE', 4),
    ('Paraíba', 'PB', 4),
    ('Piauí', 'PI', 4),
    ('Rio Grande do Norte', 'RN', 4),
    ('Sergipe', 'SE', 4),
    ('Acre', 'AC', 5),
    ('Amapá', 'AP', 5),
    ('Amazonas', 'AM', 5),
    ('Pará', 'PA', 5),
    ('Rondônia', 'RO', 5),
    ('Roraima', 'RR', 5),
    ('Tocantins', 'TO', 5);

