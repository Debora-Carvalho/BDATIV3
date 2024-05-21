/*O asteristico representa todas as colunas da tabela*/
SELECT * FROM REGION;
SELECT * FROM STATE;
SELECT * FROM CITY;
SELECT * FROM PEOPLE;

/*Selecionando todos os estados da Região Sul*/
SELECT
R.REG_STR_DESC AS [Região],
S.STA_STR_DESC AS [Estado],
S.STA_STR_SIGLA AS [Sigla]
FROM REGION AS R INNER JOIN [STATE] AS S ON R.REG_INT_ID = S.REG_INT_ID
WHERE S.REG_INT_ID = 2;            /*ou posso utilizar WHERE S.REG_STR_DESC = 'Sul'*/

/*Utilizo AS para utilizar um apelido para a coluna*/
/*INNER JOIN linka somente as colunas que respeitam a condição*/


/*Selecionando também as cidades da Região Sul*/
SELECT
R.REG_STR_DESC AS [Região],
S.STA_STR_DESC AS [Estado],
S.STA_STR_SIGLA AS [Sigla]
FROM REGION AS R 
INNER JOIN [STATE] AS S ON R.REG_INT_ID = S.REG_INT_ID
INNER JOIN CITY AS C ON S.STA_INT_ID = C.STA_INT_ID
WHERE S.REG_INT_ID = 2;        


/*Criando uma VIEW*/
CREATE VIEW VW_REGSTACID AS 
SELECT
R.REG_STR_DESC AS [Região],
S.STA_STR_DESC AS [Estado],
S.STA_STR_SIGLA AS [Sigla]
FROM REGION AS R 
INNER JOIN [STATE] AS S ON R.REG_INT_ID = S.REG_INT_ID
INNER JOIN CITY AS C ON S.STA_INT_ID = C.STA_INT_ID
WHERE S.REG_INT_ID = 2;        

SELECT * FROM VW_REGSTACID;

/*Posso também utilizar WHERE em uma VIEW*/
SELECT * FROM VW_REGSTACID
WHERE Sigla = 'RS' OR Sigla = 'PR';


/*Reordenando e buscando as cidades que só pertencem ao Estado de São Paulo*/
SELECT 
C.CIT_STR_DESC AS [Cidade],
S.STA_STR_DESC AS [Estado],
S.STA_STR_SIGLA AS [Sigla],
S.STA_INT_ID,
C.CIT_INT_ID
FROM [STATE] AS S
INNER JOIN CITY AS C ON S.STA_INT_ID = C.STA_INT_ID
WHERE S.STA_STR_SIGLA = 'SP';  /*strings devem sempre estar entre o apóstrofo*/

/*Reordenando e buscando as cidades que só pertencem ao Estado de São Paulo*/
SELECT 
C.CIT_STR_DESC AS [Cidade],
S.STA_STR_DESC AS [Estado],
S.STA_STR_SIGLA AS [Sigla],
S.STA_INT_ID,
C.CIT_INT_ID
FROM [STATE] AS S
INNER JOIN CITY AS C ON S.STA_INT_ID = C.STA_INT_ID
WHERE S.STA_STR_SIGLA = 'SP' OR R.REG_INT_ID = 2;  

/*Buscando todas as cidades da Região Sul + Cidades do Estado de São Paulo*/
SELECT 
C.CIT_STR_DESC AS [Cidade],
S.STA_STR_DESC AS [Estado],       /*Coloco uma palavra entre conchetes para retirar as referências de palavras reservadas*/
S.STA_STR_SIGLA AS [Sigla]
FROM REGION AS R 
INNER JOIN [STATE] AS S ON R.REG_INT_ID = S.REG_INT_ID
INNER JOIN CITY AS C ON S.STA_INT_ID = C.STA_INT_ID
WHERE R.REG_INT_ID = 2 
OR S.STA_STR_SIGLA = 'SP';    

/*atualizando dados*/
UPDATE CITY
SET CIT_STR_DESC = 'Adamantina Fatec'    /*dado reescrito*/
WHERE CIT_STR_DESC = 'Adamantina'        /*dado que será substituído*/


