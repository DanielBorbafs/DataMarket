-- QUANTOS $ ESTAMOS GASTANDO COM SALÁRIO DE FUNCIONÁRIOS
SELECT SUM(SALARIO) AS GASTO_SALARIOS_FUNCIONARIOS
FROM FUNCIONARIOS;

-- QUANTOS $ ESTAMOS GASTANDO COM SALÁRIOS DE MÉDICOS - R$ 85000.00
SELECT SUM(SALARIO) AS GASTO_SALARIOS_MEDICOS
FROM MEDICOS;

-- QUANTOS $ ESTAMOS GASTANDO MENSALMENTE COM TODOS OS SALARIOS - R$ 170600.00
SELECT 
(SELECT SUM(SALARIO) FROM funcionarios) +
(SELECT SUM(SALARIO) FROM medicos AS GASTO_TOTAL_SALARIOS)

-- Gastos gerais  - R$ 101500.00
SELECT SUM(VALOR) AS VALOR_DESPESAS
FROM gastos

-- TOTAL GASTO -  > R$ 272100.00
SELECT 
(SELECT SUM(SALARIO) FROM funcionarios) +
(SELECT SUM(SALARIO) FROM medicos) + 
(SELECT SUM(VALOR) FROM gastos AS VALOR_GASTO_MARÇO)

-- LUCRO TOTAL -> R$ 6480.00
SELECT SUM(VALOR) AS TOTAL_LUCRO 
FROM CONSULTAS ;


-- QUERY QUE TRAZ O LUCRO APENAS DE MAIO POR CATEGORIA
SELECT M.ESPECIALIDADE, SUM(C.VALOR) AS LUCRO
FROM medicos M 
INNER JOIN CONSULTAS C ON C.ID_MEDICO = M.ID_MEDICO
where data_consulta > '2024-04-30'
GROUP BY M.ESPECIALIDADE
ORDER BY LUCRO

-- QUERY QUE VERIFICA O PERÍODO POR UMA DATA
SELECT SUM(VALOR) AS CONSULTA 
FROM CONSULTAS
WHERE data_consulta BETWEEN '2024-05-31' AND  '2024-06-30'

-- QUERY QUE TRAZ O GASTO COM BASE NO MÊS
SELECT SUM(VALOR) AS GASTO_MES
FROM GASTOS
WHERE DATA BETWEEN '2024-07-01' AND '2024-07-31'


-- QUERY MENOS PERFORMÁTICA PARA TRAZER O LUCRO COM BASE EM UM MÊS
SELECT SUM(VALOR) AS CONSULTA
FROM CONSULTAS 
WHERE MONTH(DATA_CONSULTA) = 7 AND YEAR(DATA_CONSULTA) = 2024;