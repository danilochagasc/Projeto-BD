-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Jul-2023 às 00:32
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `doacao_de_sangue`
--

CREATE SCHEMA IF NOT EXISTS `doacao_de_sangue`;
USE `doacao_de_sangue`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `protocolo` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `idSangue` int(11) DEFAULT NULL,
  `cpfDoador` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `centro-de-doacao`
--

CREATE TABLE `centro-de-doacao` (
  `idCentro` int(11) NOT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `centro-de-doacao`
--

INSERT INTO `centro-de-doacao` (`idCentro`, `rua`, `numero`, `bairro`, `cep`) VALUES
(1, 'Rua A', 123, 'Centro', '12345-678'),
(2, 'Rua J', 456, 'Bairro A', '98765-432'),
(3, 'Rua U', 789, 'Bairro D', '54321-876'),
(4, 'Rua S', 321, 'Bairro E', '23456-789'),
(5, 'Rua E', 654, 'Centro', '54321-987'),
(6, 'Rua B', 987, 'Bairro E', '87654-321'),
(7, 'Rua C', 210, 'Bairro E', '76543-210'),
(8, 'Rua T', 567, 'Bairro B', '01234-567'),
(9, 'Rua V', 901, 'Bairro B', '45678-901'),
(10, 'Rua K', 234, 'Bairro C', '90123-456'),
(11, 'Rua V', 543, 'Bairro B', '78901-234'),
(12, 'Rua L', 876, 'Bairro D', '67890-123'),
(13, 'Rua Q', 219, 'Bairro D', '56789-012'),
(14, 'Rua N', 765, 'Bairro A', '45678-901'),
(15, 'Rua O', 432, 'Bairro B', '34567-890'),
(16, 'Rua P', 987, 'Bairro C', '23456-789'),
(17, 'Rua Q', 321, 'Bairro D', '12345-678'),
(18, 'Rua C', 654, 'Bairro E', '01234-567'),
(19, 'Rua S', 876, 'Bairro E', '90123-456'),
(20, 'Rua P', 210, 'Bairro C', '78901-234'),
(21, 'Rua K', 543, 'Bairro C', '67890-123'),
(22, 'Rua J', 901, 'Bairro A', '56789-012'),
(23, 'Rua Q', 234, 'Bairro D', '45678-901'),
(24, 'Rua K', 765, 'Bairro C', '34567-890'),
(25, 'Rua B', 432, 'Bairro E', '23456-789');

-- --------------------------------------------------------

--
-- Estrutura da tabela `doador`
--

CREATE TABLE `doador` (
  `cpfDoador` varchar(14) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `doador`
--

INSERT INTO `doador` (`cpfDoador`, `nome`, `telefone`, `rua`, `numero`, `bairro`, `cep`) VALUES
('012.345.678-90', 'Mateus Oliveira', '(90) 66666-7777', 'Rua S', 876, 'Bairro E', '90123-456'),
('111.111.111-11', 'Fulano de Tal', '(11) 98765-4321', 'Rua A', 123, 'Centro', '12345-678'),
('123.456.789-01', 'Camila Lima', '(01) 77777-8888', 'Rua J', 234, 'Bairro A', '90123-456'),
('210.987.654-32', 'Amanda Sousa', '(32) 77777-8888', 'Rua T', 210, 'Bairro B', '78901-234'),
('222.222.222-22', 'Ciclana Silva', '(22) 99999-8888', 'Rua B', 456, 'Bairro E', '98765-432'),
('234.567.890-12', 'Rafaela Santos', '(12) 88888-9999', 'Rua K', 543, 'Bairro C', '78901-234'),
('321.098.765-43', 'Bruno Costa', '(43) 88888-9999', 'Rua U', 543, 'Bairro D', '67890-123'),
('333.333.333-33', 'Beltrano Pereira', '(33) 12345-6789', 'Rua C', 789, 'Bairro E', '54321-876'),
('345.678.901-23', 'Gustavo Oliveira', '(23) 99999-0000', 'Rua L', 876, 'Bairro D', '67890-123'),
('432.109.876-54', 'Letícia Santos', '(54) 99999-0000', 'Rua V', 901, 'Bairro B', '56789-012'),
('444.444.444-44', 'João da Silva', '(44) 11111-2222', 'Rua P', 321, 'Bairro C', '23456-789'),
('456.789.012-34', 'Carolina Sousa', '(34) 00000-1111', 'Rua J', 219, 'Bairro A', '56789-012'),
('543.210.987-65', 'Rafael Lima', '(65) 00000-1111', 'Rua W', 234, 'Bairro D', '45678-901'),
('555.555.555-55', 'Maria Souza', '(55) 22222-3333', 'Rua E', 654, 'Centro', '54321-987'),
('567.890.123-45', 'André Costa', '(45) 11111-2222', 'Rua N', 765, 'Bairro A', '45678-901'),
('654.321.098-76', 'Mariana Oliveira', '(76) 11111-2222', 'Rua X', 765, 'Bairro D', '34567-890'),
('666.666.666-66', 'Pedro Santos', '(66) 33333-4444', 'Rua F', 987, 'Bairro B', '87654-321'),
('678.901.234-56', 'Juliana Silva', '(56) 22222-3333', 'Rua O', 432, 'Bairro B', '34567-890'),
('765.432.109-87', 'Carlos Costa', '(87) 22222-3333', 'Rua Y', 432, 'Bairro B', '23456-789'),
('777.777.777-77', 'Ana Oliveira', '(77) 44444-5555', 'Rua J', 210, 'Bairro A', '76543-210'),
('789.012.345-67', 'Ricardo Santos', '(67) 33333-4444', 'Rua P', 987, 'Bairro C', '23456-789'),
('888.888.888-88', 'Mariana Costa', '(88) 55555-6666', 'Rua H', 567, 'Bairro A', '01234-567'),
('890.123.456-78', 'Fernanda Lima', '(78) 44444-5555', 'Rua Q', 321, 'Bairro D', '12345-678'),
('901.234.567-89', 'Larissa Almeida', '(89) 55555-6666', 'Rua S', 654, 'Bairro E', '01234-567'),
('999.999.999-99', 'Lucas Almeida', '(99) 66666-7777', 'Rua I', 901, 'Bairro A', '45678-901');

-- --------------------------------------------------------

--
-- Estrutura da tabela `doador_centrodoacao`
--

CREATE TABLE `doador_centrodoacao` (
  `idCentro` int(11) NOT NULL,
  `cpfDoador` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `tipoEstoque` char(3) NOT NULL,
  `quantidade` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`tipoEstoque`, `quantidade`) VALUES
('A+', 100),
('A-', 150),
('AB+', 80),
('AB-', 90),
('B+', 200),
('B-', 180),
('O+', 220),
('O-', 160);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoquehosp`
--

CREATE TABLE `estoquehosp` (
  `tipoEstoque` char(3) NOT NULL,
  `cnpj` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `exame`
--

CREATE TABLE `exame` (
  `resultado_total` tinyint(4) NOT NULL,
  `Exame_AIDS` tinyint(4) NOT NULL,
  `Exame_SIFILIS` tinyint(4) NOT NULL,
  `Exame_HEPATITE_A` tinyint(4) NOT NULL,
  `Exame_HEPATITE_B` tinyint(4) NOT NULL,
  `idSangue` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cpfFunc` varchar(14) NOT NULL,
  `salario` float NOT NULL,
  `coren` varchar(8) DEFAULT NULL,
  `crm` varchar(8) DEFAULT NULL,
  `tipoFunc` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`cpfFunc`, `salario`, `coren`, `crm`, `tipoFunc`) VALUES
('012.345.678-90', 3700, NULL, 'CRM012', 'M'),
('111.111.111-11', 3000, 'COREN111', NULL, 'E'),
('123.456.789-01', 2600, NULL, NULL, 'O'),
('210.987.654-32', 2800, NULL, 'CRM210', 'M'),
('222.222.222-22', 2500, NULL, 'CRM222', 'M'),
('234.567.890-12', 3300, NULL, NULL, 'O'),
('321.098.765-43', 3900, NULL, NULL, 'O'),
('333.333.333-33', 4000, 'COREN333', NULL, 'E'),
('345.678.901-23', 2800, 'COREN345', NULL, 'E'),
('432.109.876-54', 3400, NULL, 'CRM432', 'M'),
('444.444.444-44', 3500, 'COREN444', NULL, 'E'),
('456.789.012-34', 4000, NULL, 'CRM456', 'M'),
('543.210.987-65', 2900, 'COREN543', NULL, 'E'),
('555.555.555-55', 2800, 'COREN555', NULL, 'E'),
('567.890.123-45', 2900, NULL, 'CRM567', 'M'),
('654.321.098-76', 4100, NULL, 'CRM654', 'M'),
('666.666.666-66', 3200, NULL, 'CRM666', 'M'),
('678.901.234-56', 3800, NULL, NULL, 'O'),
('765.432.109-87', 3200, 'COREN765', NULL, 'E'),
('777.777.777-77', 2700, 'COREN777', NULL, 'E'),
('789.012.345-67', 3100, NULL, NULL, 'O'),
('876.543.210-98', 3700, NULL, NULL, 'O'),
('888.888.888-88', 3900, NULL, NULL, 'O'),
('890.123.456-78', 4200, NULL, 'CRM890', 'M'),
('901.234.567-89', 3300, 'COREN901', NULL, 'E'),
('999.999.999-99', 4100, NULL, NULL, 'O');

-- --------------------------------------------------------

--
-- Estrutura da tabela `func_atendimento`
--

CREATE TABLE `func_atendimento` (
  `protocolo` int(11) NOT NULL,
  `cpfFunc` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `func_centrodoacao`
--

CREATE TABLE `func_centrodoacao` (
  `idCentro` int(11) NOT NULL,
  `cpfFunc` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospital`
--

CREATE TABLE `hospital` (
  `cnpj` varchar(18) NOT NULL,
  `nomeHospital` varchar(50) DEFAULT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `hospital`
--

INSERT INTO `hospital` (`cnpj`, `nomeHospital`, `rua`, `numero`, `bairro`, `cep`) VALUES                                
('01234567890123', 'Hospital S', 'Rua S', 876, 'Bairro E', '90123-456'),
('11111111111111', 'Hospital A', 'Rua A', 123, 'Centro', '12345-678'),
('12345678901234', 'Hospital J', 'Rua J', 234, 'Bairro A', '90123-456'),
('22222222222222', 'Hospital B', 'Rua U', 456, 'Bairro D', '98765-432'),
('23456789012345', 'Hospital K', 'Rua K', 543, 'Bairro C', '78901-234'),
('33333333333333', 'Hospital P', 'Rua K', 789, 'Bairro C', '54321-876'),
('34567890123456', 'Hospital P', 'Rua P', 876, 'Bairro C', '67890-123'),
('43210987654321', 'Hospital Y', 'Rua U', 432, 'Bairro D', '23456-789'),
('44444444444444', 'Hospital D', 'Rua W', 321, 'Bairro D', '23456-789'),
('45678901234567', 'Hospital M', 'Rua W', 219, 'Bairro D', '56789-012'),
('54321098765432', 'Hospital Y', 'Rua X', 765, 'Bairro B', '34567-890'),
('55555555555555', 'Hospital E', 'Rua E', 654, 'Centro', '54321-987'),
('56789012345678', 'Hospital N', 'Rua N', 765, 'Bairro B', '45678-901'),
('65432109876543', 'Hospital W', 'Rua W', 234, 'Bairro B', '45678-901'),
('66666666666666', 'Hospital J', 'Rua F', 987, 'Bairro A', '87654-321'),
('67890123456789', 'Hospital O', 'Rua Q', 432, 'Bairro D', '34567-890'),
('76543210987654', 'Hospital V', 'Rua V', 901, 'Bairro A', '56789-012'),
('77777777777777', 'Hospital S', 'Rua G', 210, 'Bairro E', '76543-210'),
('78901234567890', 'Hospital P', 'Rua P', 987, 'Bairro C', '23456-789'),
('87654321098765', 'Hospital V', 'Rua U', 543, 'Bairro B', '67890-123'),
('88888888888888', 'Hospital H', 'Rua H', 567, 'Bairro A', '01234-567'),
('89012345678901', 'Hospital O', 'Rua Q', 321, 'Bairro B', '12345-678'),
('90123456789012', 'Hospital O', 'Rua R', 654, 'Bairro B', '01234-567'),
('98765432109876', 'Hospital P', 'Rua P', 210, 'Bairro C', '78901-234'),
('99999999999999', 'Hospital C', 'Rua I', 901, 'Bairro E', '45678-901');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sangue`
--

CREATE TABLE `sangue` (
  `idSangue` int(11) NOT NULL,
  `tipo` varchar(2) DEFAULT NULL,
  `fatorRH` char(1) DEFAULT NULL,
  `tipoEstoque` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `sangue`
--

INSERT INTO `sangue` (`idSangue`, `tipo`, `fatorRH`, `tipoEstoque`) VALUES
(1, 'A', '+', 'A+'),
(2, 'A', '-', 'A-'),
(3, 'B', '+', 'B+'),
(4, 'B', '-', 'B-'),
(5, 'O', '+', 'O+'),
(6, 'O', '-', 'O-'),
(7, 'AB', '+', 'AB+'),
(8, 'AB', '-', 'AB-'),
(9, 'A', '+', 'A+'),
(10, 'A', '-', 'A-'),
(11, 'B', '+', 'B+'),
(12, 'B', '-', 'B-'),
(13, 'O', '+', 'O+'),
(14, 'O', '-', 'O-'),
(15, 'AB', '+', 'AB+'),
(16, 'AB', '-', 'AB-'),
(17, 'A', '+', 'A+'),
(18, 'A', '-', 'A-'),
(19, 'B', '+', 'B+'),
(20, 'B', '-', 'B-'),
(21, 'O', '+', 'O+'),
(22, 'O', '-', 'O-'),
(23, 'AB', '+', 'AB+'),
(24, 'AB', '-', 'AB-'),
(25, 'A', '+', 'A+');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`protocolo`),
  ADD KEY `fk_Atendimento_Sangue1_idx` (`idSangue`),
  ADD KEY `fk_Atendimento_Doador1_idx` (`cpfDoador`);

--
-- Índices para tabela `centro-de-doacao`
--
ALTER TABLE `centro-de-doacao`
  ADD PRIMARY KEY (`idCentro`),
  ADD UNIQUE KEY `idCentro-de-Doacao_UNIQUE` (`idCentro`);

--
-- Índices para tabela `doador`
--
ALTER TABLE `doador`
  ADD PRIMARY KEY (`cpfDoador`),
  ADD UNIQUE KEY `idDoador_UNIQUE` (`cpfDoador`);

--
-- Índices para tabela `doador_centrodoacao`
--
ALTER TABLE `doador_centrodoacao`
  ADD PRIMARY KEY (`idCentro`,`cpfDoador`),
  ADD KEY `fk_Centro-de-Doacao_has_Doador_Doador1_idx` (`cpfDoador`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`tipoEstoque`);

--
-- Índices para tabela `estoquehosp`
--
ALTER TABLE `estoquehosp`
  ADD PRIMARY KEY (`tipoEstoque`,`cnpj`),
  ADD KEY `fk_Estoque_has_Hospital_Hospital1_idx` (`cnpj`),
  ADD KEY `fk_Estoque_has_Hospital_Estoque1_idx` (`tipoEstoque`);

--
-- Índices para tabela `exame`
--
ALTER TABLE `exame`
  ADD KEY `fk_Exame_Sangue1_idx` (`idSangue`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cpfFunc`),
  ADD UNIQUE KEY `idFuncionário_UNIQUE` (`cpfFunc`);

--
-- Índices para tabela `func_atendimento`
--
ALTER TABLE `func_atendimento`
  ADD PRIMARY KEY (`protocolo`,`cpfFunc`),
  ADD KEY `fk_Atendimento_has_Funcionário_Funcionário1_idx` (`cpfFunc`),
  ADD KEY `fk_Atendimento_has_Funcionário_Atendimento1_idx` (`protocolo`);

--
-- Índices para tabela `func_centrodoacao`
--
ALTER TABLE `func_centrodoacao`
  ADD PRIMARY KEY (`idCentro`,`cpfFunc`),
  ADD KEY `fk_Centro-de-Doacao_has_Funcionário_Funcionário1_idx` (`cpfFunc`),
  ADD KEY `fk_Centro-de-Doacao_has_Funcionário_Centro-de-Doacao1_idx` (`idCentro`);

--
-- Índices para tabela `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`cnpj`),
  ADD UNIQUE KEY `idHospital_UNIQUE` (`cnpj`);

--
-- Índices para tabela `sangue`
--
ALTER TABLE `sangue`
  ADD PRIMARY KEY (`idSangue`,`tipoEstoque`),
  ADD UNIQUE KEY `idSangue_UNIQUE` (`idSangue`),
  ADD KEY `fk_Sangue_Estoque2_idx` (`tipoEstoque`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `protocolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `centro-de-doacao`
--
ALTER TABLE `centro-de-doacao`
  MODIFY `idCentro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `sangue`
--
ALTER TABLE `sangue`
  MODIFY `idSangue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_Atendimento_Doador1` FOREIGN KEY (`cpfDoador`) REFERENCES `doador` (`cpfDoador`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Atendimento_Sangue1` FOREIGN KEY (`idSangue`) REFERENCES `sangue` (`idSangue`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `doador_centrodoacao`
--
ALTER TABLE `doador_centrodoacao`
  ADD CONSTRAINT `cpfDoador` FOREIGN KEY (`cpfDoador`) REFERENCES `doador` (`cpfDoador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idCentro` FOREIGN KEY (`idCentro`) REFERENCES `centro-de-doacao` (`idCentro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estoquehosp`
--
ALTER TABLE `estoquehosp`
  ADD CONSTRAINT `fk_Estoque_has_Hospital_Estoque1` FOREIGN KEY (`tipoEstoque`) REFERENCES `estoque` (`tipoEstoque`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Estoque_has_Hospital_Hospital1` FOREIGN KEY (`cnpj`) REFERENCES `hospital` (`cnpj`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `fk_Exame_Sangue1` FOREIGN KEY (`idSangue`) REFERENCES `sangue` (`idSangue`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `func_atendimento`
--
ALTER TABLE `func_atendimento`
  ADD CONSTRAINT `fk_Atendimento_has_Funcionário_Atendimento1` FOREIGN KEY (`protocolo`) REFERENCES `atendimento` (`protocolo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Atendimento_has_Funcionário_Funcionário1` FOREIGN KEY (`cpfFunc`) REFERENCES `funcionario` (`cpfFunc`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `func_centrodoacao`
--
ALTER TABLE `func_centrodoacao`
  ADD CONSTRAINT `fk_Centro-de-Doacao_has_Funcionário_Centro-de-Doacao1` FOREIGN KEY (`idCentro`) REFERENCES `centro-de-doacao` (`idCentro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Centro-de-Doacao_has_Funcionário_Funcionário1` FOREIGN KEY (`cpfFunc`) REFERENCES `funcionario` (`cpfFunc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `sangue`
--
ALTER TABLE `sangue`
  ADD CONSTRAINT `fk_Sangue_Estoque2` FOREIGN KEY (`tipoEstoque`) REFERENCES `estoque` (`tipoEstoque`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `atendimento` (`protocolo`, `data`, `idSangue`, `cpfDoador`) VALUES
(1, '2023-01-01', 1, '111.111.111-11'),
(2, '2023-02-05', 2, '222.222.222-22'),
(3, '2023-03-10', 3, '333.333.333-33'),
(4, '2023-04-15', 4, '444.444.444-44'),
(5, '2023-05-20', 5, '555.555.555-55'),
(6, '2023-06-25', 6, '666.666.666-66'),
(7, '2023-07-30', 7, '777.777.777-77'),
(8, '2023-08-04', 8, '888.888.888-88'),
(9, '2023-09-09', 9, '999.999.999-99'),
(10, '2023-10-14', 10, '123.456.789-01'),
(11, '2023-11-19', 11, '234.567.890-12'),
(12, '2023-12-24', 12, '345.678.901-23'),
(13, '2024-01-01', 13, '456.789.012-34'),
(14, '2024-02-05', 14, '567.890.123-45'),
(15, '2024-03-10', 15, '678.901.234-56'),
(16, '2024-04-15', 16, '789.012.345-67'),
(17, '2024-05-20', 17, '890.123.456-78'),
(18, '2024-06-25', 18, '901.234.567-89'),
(19, '2024-07-30', 19, '012.345.678-90'),
(20, '2024-08-04', 20, '210.987.654-32'),
(21, '2024-09-09', 21, '321.098.765-43'),
(22, '2024-10-14', 22, '432.109.876-54'),
(23, '2024-11-19', 23, '543.210.987-65'),
(24, '2024-12-24', 24, '654.321.098-76'),
(25, '2025-01-01', 25, '765.432.109-87');


INSERT INTO `doador_centrodoacao` (`idCentro`, `cpfDoador`) VALUES
(1, '111.111.111-11'),
(2, '222.222.222-22'),
(3, '333.333.333-33'),
(4, '444.444.444-44'),
(5, '555.555.555-55'),
(6, '666.666.666-66'),
(7, '777.777.777-77'),
(8, '888.888.888-88'),
(9, '999.999.999-99'),
(10, '123.456.789-01'),
(11, '234.567.890-12'),
(12, '345.678.901-23'),
(13, '456.789.012-34'),
(14, '567.890.123-45'),
(15, '678.901.234-56'),
(16, '789.012.345-67'),
(17, '890.123.456-78'),
(18, '901.234.567-89'),
(19, '012.345.678-90'),
(20, '210.987.654-32'),
(21, '321.098.765-43'),
(22, '432.109.876-54'),
(23, '543.210.987-65'),
(24, '654.321.098-76'),
(25, '765.432.109-87');

INSERT INTO `estoquehosp` (`tipoEstoque`, `cnpj`) VALUES
('A+', '11111111111111'),
('A-', '22222222222222'),
('B+', '33333333333333'),
('B-', '44444444444444'),
('O+', '55555555555555'),
('O-', '66666666666666'),
('AB+', '77777777777777'),
('AB-', '88888888888888'),
('A+', '99999999999999'),
('A-', '11111111111111'),
('B+', '44444444444444'),
('B-', '77777777777777'),
('O+', '77777777777777'),
('O-', '99999999999999'),
('AB+', '99999999999999'),
('AB-', '99999999999999'),
('A+', '55555555555555'),
('A-', '55555555555555'),
('B+', '55555555555555'),
('B-', '33333333333333'),
('O+', '33333333333333'),
('O-', '33333333333333'),
('AB+', '66666666666666'),
('AB-', '66666666666666'),
('A+', '66666666666666'),
('A-', '66666666666666');

INSERT INTO `exame` (`resultado_total`, `Exame_AIDS`, `Exame_SIFILIS`, `Exame_HEPATITE_A`, `Exame_HEPATITE_B`, `idSangue`) VALUES
(0, 0, 0, 0, 0, 1),
(0, 0, 0, 0, 0, 2),
(1, 0, 1, 1, 0, 3),
(0, 0, 0, 0, 0, 4),
(1, 1, 1, 0, 1, 5),
(1, 0, 1, 0, 0, 6),
(1, 0, 0, 1, 1, 7),
(1, 1, 1, 1, 0, 8),
(0, 0, 0, 0, 0, 9),
(1, 1, 0, 0, 1, 10),
(1, 1, 1, 1, 1, 11),
(0, 0, 0, 0, 0, 12),
(0, 0, 0, 0, 0, 13),
(0, 0, 0, 0, 0, 14),
(0, 0, 0, 0, 0, 15),
(0, 0, 0, 0, 0, 16),
(0, 0, 0, 0, 0, 17),
(0, 0, 0, 0, 0, 18),
(0, 0, 0, 0, 0, 19),
(0, 0, 0, 0, 0, 20),
(0, 0, 0, 0, 0, 21),
(0, 0, 0, 0, 0, 22),
(1, 1, 1, 0, 1, 23),
(1, 0, 1, 0, 0, 24),
(1, 0, 0, 1, 1, 25);

INSERT INTO `func_atendimento` (`protocolo`, `cpfFunc`) VALUES
(1, '111.111.111-11'),
(2, '222.222.222-22'),
(3, '333.333.333-33'),
(4, '444.444.444-44'),
(5, '555.555.555-55'),
(6, '666.666.666-66'),
(7, '777.777.777-77'),
(8, '888.888.888-88'),
(9, '999.999.999-99'),
(10, '123.456.789-01'),
(11, '234.567.890-12'),
(12, '345.678.901-23'),
(13, '456.789.012-34'),
(14, '567.890.123-45'),
(15, '678.901.234-56'),
(16, '789.012.345-67'),
(17, '890.123.456-78'),
(18, '901.234.567-89'),
(19, '012.345.678-90'),
(20, '210.987.654-32'),
(21, '321.098.765-43'),
(22, '432.109.876-54'),
(23, '543.210.987-65'),
(24, '654.321.098-76'),
(25, '765.432.109-87');

INSERT INTO `func_centrodoacao` (`idCentro`, `cpfFunc`) VALUES
(1, '111.111.111-11'),
(2, '222.222.222-22'),
(3, '333.333.333-33'),
(4, '444.444.444-44'),
(5, '555.555.555-55'),
(6, '666.666.666-66'),
(7, '777.777.777-77'),
(8, '888.888.888-88'),
(9, '999.999.999-99'),
(10, '123.456.789-01'),
(11, '234.567.890-12'),
(12, '345.678.901-23'),
(13, '456.789.012-34'),
(14, '567.890.123-45'),
(15, '678.901.234-56'),
(16, '789.012.345-67'),
(17, '890.123.456-78'),
(18, '901.234.567-89'),
(19, '012.345.678-90'),
(20, '210.987.654-32'),
(21, '321.098.765-43'),
(22, '432.109.876-54'),
(23, '543.210.987-65'),
(24, '654.321.098-76'),
(25, '765.432.109-87');
