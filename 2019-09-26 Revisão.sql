--
-- Database: `senai`
--

CREATE DATABASE IF NOT EXISTS  senai;
USE senai;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `primeiroNome` varchar(60) NOT NULL,
  `sobrenome` varchar(60) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `CEP` int(11) NOT NULL,
  `salario` decimal(6,2) NOT NULL
);

--
-- Inserindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `primeiroNome`, `sobrenome`, `cidade`, `CEP`, `salario`) VALUES
(1, 'Capitão', 'América', 'Guabiruba', 88360000, 4000.99),
(2, 'Homem', 'de Ferro', 'Gaspar', 89114206, 3599.55),
(3, 'Incrível', 'Hulk', 'Nova Trento', 88270000, 1250),
(4, 'Mulher ', 'Maravilha', 'Itajaí', 88301000, 3700),
(5, 'Capitã', 'Marvel', 'Balneário Camboriú', 88330118, 3700),
(6, 'Viúva', 'Negra', 'Brusque', 88353202, 4000),
(7, 'Peter', 'Quill', 'Blumenau', 89010602, 4000),
(8, 'Máquina', 'de Combate', 'Balneário Camboriú', 88330250, 7899.99);

SELECT * FROM cliente;

-- Mostrar Banco de Dados
SHOW DATABASES;

-- Exibir tabelas de um detreminado banco de dados
SHOW TABLES FROM sakila;
SHOW TABLES FROM senai;

-- Mostrar as colunas de uma detreminada tabela
SHOW COLUMNS FROM cliente;
SHOW COLUMNS FROM sakila.actor;

-- Selecionar e mostrar o primeiro nome
SELECT primeironome FROM cliente;

-- Selecionar por primeiroNome e a cidade
SELECT PrimeiroNome, cidadE FROM cliente;
-- SQL é case insensitive, tantufas!
-- Maiúsculas e Minúsculas!

-- Selecionar todas as colunas da tabela
SELECT * FROM cliente;

-- Mostrar dados sem repetição
SELECT DISTINCT cidade FROM cliente ORDER BY cidade;

-- Limitando o numero de linhas na consulta
SELECT id, sobrenome, cep FROM cliente LIMIT 5;

-- O primeiro numero é o elemento no qual irá começar a contagem, e o segundo mostra a quantidade
SELECT id, sobrenome, cep FROM cliente LIMIT 3,4;

-- Ordenando a consulta pela coluna primeiroNome
SELECT primeiroNome, sobrenome FROM cliente
ORDER BY primeiroNome;
-- ASC pode ser omitido!

-- Ordenando em ordem descendente
SELECT primeiroNome, sobrenome FROM cliente
ORDER BY primeiroNome DESC;

-- Filtrando os resultados com a clausula WHERE
SELECT * FROM cliente WHERE id = 7;

-- Filtrando resultado dentro de uma faixa de valores
-- utilizando o BETWEEN

SELECT * FROM cliente WHERE primeiroNome
 BETWEEN "Homem" AND "Peter" ORDER BY primeiroNome;
 
 -- Funciona com numeros!
 SELECT * FROM cliente WHERE id BETWEEN 3 AND 6;

-- Comando semelhante sem uso do BETWEEN!
SELECT * FROM cliente WHERE id >= 3 and  id <= 6;

-- Concatenar strings
SELECT CONCAT(PrimeiroNome,' ', sobrenome)
AS 'Nome Completo' FROM cliente;

-- Funções no SQL raíz quadrada e arredondamento
SELECT primeiroNome, salario, round(sqrt(salario)) AS Prêmio,
salario + round(sqrt(salario)) AS Bonificação
FROM cliente;

-- Função agregadora media (AVG)
-- Retorna apenas uma linha por agrupamento
SELECT round (AVG(salario),2) AS "Média Salarial"
 FROM cliente;
 
 -- Nome e salario das pessoas acima da media
 SELECT CONCAT(primeiroNome, " ", sobrenome) AS Nome, cidade, salario FROM cliente WHERE 
 salario > (SELECT AVG(salario) FROM cliente);
 
 -- Contando os registros
 SELECT COUNT(*) FROM cliente;
 
-- Agrupando clientes
SELECT cidade, count(*) FROM cliente
GROUP BY cidade;

-- Filtrando agrupamentos
-- Nesse caso where não substitui o having(Não recomendado)
SELECT cidade, count(*) AS Quantidade FROM cliente
GROUP BY cidade HAVING Quantidade = 2;

