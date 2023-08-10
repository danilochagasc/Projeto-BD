

-- Tabela Criada para utilização do DROP TABLE
CREATE TABLE `tabela-feia` (
  `numeral` int(11) NOT NULL,
  `palavra` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE `tabela-feia`;

-- Exemplos de UPDATES com um exemplo de update aninhado(último)
  UPDATE `hospital` SET `nomeHospital` = 'Hospital Mudado' WHERE `hospital`.`cnpj` = '01234567890123'; -- Realiza a alteração do nome do hospital com cnpj igual a '01234567890123'
  UPDATE `funcionario` SET `salario` = '5000' WHERE `funcionario`.`cpfFunc` = '123.456.789-01'; -- Realiza a alteração do salário do funcionário de cpf '123.456.789-01' para 5000
  UPDATE `estoque` SET `quantidade` = '160' WHERE `estoque`.`tipoEstoque` = 'B+'; -- Realiza a alteração da quantidade do estoque de tipo 'B+' para '160'
  UPDATE `doador` SET `nome` = 'Denilson Aleves' WHERE `doador`.`cpfDoador` = '012.345.678-90'; -- Realiza a alteração do doador de cpf '012.345.678-90' para 'Denilson Aleves'

  UPDATE `Funcionario` F -- Realiza um aumento salarial de 10% em todos os funcionarios que trabalham no centro de id igual a 2
  JOIN `Func_CentroDoacao` FC ON F.`cpfFunc` = FC.`cpfFunc`
  SET F.`salario` = F.`salario` * 1.1 
  WHERE FC.`idCentro` = 2; 



-- Deletes
  DELETE FROM funcionario WHERE `funcionario`.`cpfFunc` = '210.987.654-32'; -- Exclui o funcionario de cpf igual a '210.987.654-32'(Mas falha devido às restrições de exclusão)
  DELETE FROM hospital WHERE `hospital`.`cnpj` = '33333333333333'; -- Exclui o hospital de cnpj igual a '33333333333333'(Mas falha devido às restrições de exclusão)
  DELETE FROM sangue WHERE `sangue`.`idSangue` = 8; -- Exclui o sangue de id igual a 8(Mas falha devido às restrições de exclusão)
  DELETE FROM atendimento WHERE `atendimento`.`protocolo` = 10; -- Exclui o atendimento de protocolo igual a 10(Mas falha devido às restrições de exclusão)
  DELETE C FROM `centro-de-doacao` C JOIN `doador_centrodoacao` DC ON C.`idCentro` = DC.`idCentro` WHERE DC.`cpfDoador`= "222.222.222-22"

-- Selects
  SELECT cpfFunc FROM funcionario WHERE `salario` > 4000 -- Apresenta o cpf dos funcionarios com salario superior a 4000 reais

  SELECT nome FROM doador WHERE `cpfDoador` = "012.345.678-90" -- Apresenta o nome do funcionário de cpf igual a "012.345.678-90"

  SELECT cpfFunc, salario, tipoFunc FROM funcionario ORDER BY salario ASC -- Apresenta o cpf, salario e Tipo de cada funcionario ordenado do menor para o maior salario

  SELECT bairro, COUNT(*) AS `qtd_doador` FROM doador GROUP BY bairro HAVING `qtd_doador` >=5 -- Retorna a quantidade de doadores dos bairros que apresentam mais que 5 doadores

  SELECT D.nome, D.cpfDoador -- Apresenta os nomes e cpfs dos doadores que foram atendidos por médicos
  FROM doador D 
  JOIN atendimento A ON D.cpfDoador = A.cpfDoador 
  JOIN func_atendimento FA ON A.protocolo = FA.protocolo 
  JOIN funcionario F ON FA.cpfFunc = F.cpfFunc 
  WHERE F.tipoFunc = "M"     

  SELECT H.cnpj, H.nomeHospital, ES.tipoEstoque -- Apresenta o cnpj, nome dos hospitais e o tipo do estoque que possuem, os que não possuem estoque, apresentarão o campo tipoEstoque nulo
  FROM hospital H 
  LEFT OUTER JOIN estoquehosp ES ON ES.cnpj= H.cnpj -- Busca na tabela da esquerda chaves correspondentes às da direita, se não encontrar, os mesmos itens da tabela da direita são nulos
                                                    -- Right Outer Join segue a mesma lógica, porém a busca é feita com os itens da tabela à direita para os itens da tabela à esquerda

  SELECT cpfFunc, salario FROM funcionario WHERE coren IS NOT NULL AND salario < 3500 -- Apresenta o cpf e salario dos funcionarios que possuem coren e salario menor do que 3500 
  UNION                                                                               -- OU cpf e salario dos que apresentam o atributo tipoFunc = "O"(outros)
  SELECT cpfFunc, salario FROM funcionario WHERE tipoFunc = "O" 

  SELECT tipoEstoque FROM estoque WHERE quantidade BETWEEN 180 AND 250 -- Apresenta os tipos sanguíneos que possuem entre 180 e 250 no seu estoque.

  SELECT idCentro -- Apresenta os ID`s dos centros de doação que Estão localizados no Bairro A ou que o doador de cpf "111.111.111-11" tenha doado nele
  FROM `centro-de-doacao`
  WHERE bairro = "Bairro A" OR idCentro IN (SELECT idCentro FROM doador_centrodoacao WHERE cpfDoador = "111.111.111-11") 

  SELECT cpfFunc FROM funcionario WHERE tipoFunc = "E" and salario > SOME(SELECT salario FROM funcionario WHERE tipoFunc = "M") -- Apresenta os CPF`s dos enfermeiros que possuem salario maior que algum medico

  SELECT cpfFunc FROM funcionario WHERE tipoFunc = "O" and salario > ALL(SELECT salario FROM funcionario WHERE tipoFunc = "E") -- Apresenta os CPF`s dos funcionários que não são médicos nem enfermeiros que possuem salario maior que todos os enfermeiros

  SELECT idSangue, tipo, fatorRH FROM sangue S WHERE EXISTS(SELECT exame_AIDS FROM exame E WHERE exame_AIDS = 1 AND S.idSangue = E.idSangue) -- Apresenta os IDs, tipos e fatorRH dos sangues que apresentam o exame de aids positivo

  SELECT nome FROM doador WHERE nome LIKE "%ana%" -- Apresenta o nome dos doadores que possuem "ana" em qualquer lugar do nome
  
-- VIEWS
  CREATE VIEW podeDoar AS -- Apresenta os IDs dos sangues que podem ser doados(apresentam resultado total = 0)
  SELECT S.idSangue FROM exame E JOIN sangue S ON E.idSangue = S.idSangue WHERE E.resultado_total = 0 

  SELECT * FROM podeDoar -- Exemplo de Uso

  CREATE VIEW doador_qtd_doacoes AS -- Apresenta a quantidade que cada doador doou no intervalo entre 01/08/2022 a 01/08/2023
  SELECT cpfDoador, COUNT(protocolo) AS qtdDoacoes
  FROM atendimento
  WHERE data BETWEEN '2022-08-01' AND '2023-08-01'
  GROUP BY cpfDoador  

  SELECT * FROM doador_qtd_doacoes -- Exemplo de Uso

  CREATE VIEW doador_sangue(cpfDoador, nome, tipo_sanguineo) AS -- Apresenta o cpf, nome e tipo sanguineo de um doador
  SELECT D.cpfDoador,D.nome, tipoEstoque AS sangue_doado 
  FROM doador D JOIN atendimento A ON D.cpfDoador=A.cpfDoador JOIN sangue S ON S.idSangue = A.idSangue 

  SELECT * FROM doador_sangue WHERE nome= "Fulano de Tal"-- Exemplo de Uso(Retorna os dados apenas do Fulano de tal)



-- Usuarios
  CREATE USER 'danilo'@'127.0.0.1' IDENTIFIED BY 'senha1';
  GRANT ALL PRIVILEGES ON doacao_de_sangue TO 'danilo'@'127.0.0.1';
  REVOKE ALL PRIVILEGES ON doacao_de_sangue FROM 'danilo'@'127.0.0.1';

  SHOW GRANTS FOR 'danilo'@'127.0.0.1'; -- Mostra as permissões daquele usuario
  DROP USER 'danilo'@'127.0.0.1'; --Exemplo de exclusão de usuário


  CREATE USER 'marco'@'127.0.0.1' IDENTIFIED BY 'senha2';
  GRANT SELECT, INSERT, UPDATE, DELETE ON doacao_de_sangue.funcionario TO 'marco'@'127.0.0.1';
  REVOKE SELECT, INSERT, UPDATE, DELETE ON doacao_de_sangue.funcionario FROM 'marco'@'127.0.0.1';

-- Procedimentos/Funcoes
DELIMITER // -- O procedimento realiza o cadastro de um novo doador, passando seus dados nos parâmetros.
CREATE PROCEDURE CadastraDoador(
   pcpfDoador VARCHAR(14),
   pNome VARCHAR(80),
   pTelefone VARCHAR(16),
   pRua VARCHAR(30),
   pNumero INT,
   pBairro VARCHAR(30),
   pCep VARCHAR(10)
)
BEGIN 
   INSERT INTO doador (cpfDoador, nome, telefone, rua, numero, bairro, cep)
   VALUES (pcpfDoador, pNome, pTelefone, pRua, pNumero, pBairro, pCep);
END //
DELIMITER ;
CALL CadastraDoador("125.589.012-14", "Matheus Bertoldo", "(35) 98812-3940", "Rua Mamante Vitorino", 44, "Aquenta Sol", "30040-100" )


DELIMITER // -- O procedimento realiza um aumento geral para todos os funcionarios
CREATE PROCEDURE AumentoGeral()

BEGIN
	SET SQL_SAFE_UPDATES = 0; -- Desativa a atualização segura do MySql para que as atualizações sejam feitas. Esse modo serve para
    UPDATE funcionario      -- que não ocorram atualizações em massa acidentais, mas no nosso caso é uma atalização planejada
    SET salario = 
      CASE 
        WHEN tipoFunc = "M" THEN salario * 2
        WHEN tipoFunc = "E" THEN salario * 1.5
        WHEN tipoFunc = "O" THEN salario * 1.2
      END
    WHERE tipoFunc = "M" OR tipoFunc = "E" OR tipoFunc = "O";
    SET SQL_SAFE_UPDATES = 1; -- Aqui, reativamos o mesmo.
END //
DELIMITER ;

CALL AumentoGeral()

DELIMITER // -- O Procedimento retorna a quantidade de pessoas que moram no bairro informado em pQtd_Pessoas 
CREATE PROCEDURE qtd_por_bairro(IN pBairro VARCHAR(50), OUT pQtd_Pessoas INT)

BEGIN
  SELECT COUNT(*) INTO pQtd_Pessoas
  FROM doador
  WHERE bairro = pBairro;
END //
DELIMITER ;

CALL qtd_por_bairro("Bairro E", @numero); -- @numero = pQtd_Pessoas
SELECT @numero AS numero;

-- Triggers
  -- INSERT(Não deixa a pessoa inserir um sangue ruim como sendo bom ou um sangue bom como sendo ruim)
  DELIMITER //
  CREATE TRIGGER impede_erro
  BEFORE INSERT ON exame
  FOR EACH ROW
  BEGIN
      
      IF ((NEW.Exame_SIFILIS = 1 OR NEW.Exame_AIDS = 1 OR NEW.Exame_HEPATITE_A = 1 OR NEW.Exame_HEPATITE_B = 1) AND NEW.resultado_total = 0)
          OR ((NEW.Exame_SIFILIS = 0 AND NEW.Exame_AIDS = 0 AND NEW.Exame_HEPATITE_A = 0 AND NEW.Exame_HEPATITE_B = 0) AND NEW.resultado_total = 1) THEN
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Há um erro na inserção, por favor, verifique os dados inseridos e tente inserir novamente.'; 
      END IF;
  END;
  //
  DELIMITER ;


  INSERT INTO `exame`(resultado_total, Exame_AIDS, Exame_SIFILIS, Exame_HEPATITE_A, Exame_HEPATITE_B,idSangue) VALUES(0,1,1,0,0,26) --Ativa o trigger pois para o sangue ter o resultado total = 0, ele deve ter todos os campos iguais a 0

  -- UPDATE (Não deixa atualizar um sangue que está doente)
  DELIMITER //
  CREATE TRIGGER sangueDonte
  BEFORE UPDATE ON sangue 
  FOR EACH ROW 
  BEGIN
      DECLARE resultado_exames BOOLEAN;
      DECLARE idEstoque INT;
      DECLARE sangue INT;

      SET idEstoque = NEW.tipoEstoque;
      SET sangue = NEW.idSangue;

      SELECT resultado_total INTO resultado_exames
      FROM exame
      WHERE idSangue = sangue;

      IF resultado_exames = 1 AND idEstoque IS NOT NULL THEN
          SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sangue doente não pode ir para o estoque!';
      END IF;
  END;
  //
  DELIMITER ;

  UPDATE `sangue` SET `sangue`.`tipo` = "A" WHERE `sangue`.`idSangue`= 3
  

  -- DELETE (Salva o backup da tabela apagada para ter o historico de antigos centros)

  -- Passo 1: Criação do procedimento que cria uma tabela de backup
  DELIMITER // 
  CREATE PROCEDURE CriaBackup()
  BEGIN 
    CREATE TABLE IF NOT EXISTS `centros-deletados`(
      `idCentro` int(11) NOT NULL,
      `rua` varchar(30) DEFAULT NULL,
      `numero` int(11) DEFAULT NULL,
      `bairro` varchar(30) DEFAULT NULL,
      `cep` varchar(10) DEFAULT NULL,
      `data-exclusao` DATE DEFAULT NOW()
    );
  END //
  DELIMITER ;

  -- Passo 2: Chamada do procedimento Cria Backup para criar a tabela que será inseridos os dados do backup dos centros
    CALL CriaBackup();
  -- Passo 3: Criação do Trigger que pega e insere na tabela nova os dados da tabela apagada. OBS: foi necessária a  
  -- criação do procedimento porque não pode ser feita a criação da tabela diretamente pelo trigger
  DELIMITER //
  CREATE TRIGGER BackupCentros
  BEFORE DELETE ON `centro-de-doacao` 
  FOR EACH ROW 
  BEGIN
    INSERT INTO `centros-deletados`(idCentro, rua, numero, bairro, cep) VALUES(OLD.idCentro,OLD.rua,OLD.numero,OLD.bairro,OLD.cep);
  END;
  //
  DELIMITER ;

