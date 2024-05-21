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


