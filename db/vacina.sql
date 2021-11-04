-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 04-Nov-2021 às 03:29
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vacina`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_hora` timestamp NOT NULL,
  `vagas` int NOT NULL,
  `grupo_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agenda_grupo_id_foreign` (`grupo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agenda`
--

INSERT INTO `agenda` (`id`, `data_hora`, `vagas`, `grupo_id`, `created_at`) VALUES
(1, '2021-11-12 01:12:00', 2, 1, '2021-11-04 00:12:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
CREATE TABLE IF NOT EXISTS `agendamento` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `agenda_id` int NOT NULL,
  `grupo_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `protocolo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agendamento_agenda_id_foreign` (`agenda_id`),
  KEY `agendamento_grupo_id_foreign` (`grupo_id`),
  KEY `agendamento_paciente_id_foreign` (`paciente_id`),
  KEY `agendamento_usuario_id_foreign` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `agendamento`
--

INSERT INTO `agendamento` (`id`, `agenda_id`, `grupo_id`, `paciente_id`, `usuario_id`, `created_at`, `protocolo`) VALUES
(1, 1, 1, 1, 1, '2021-11-04 00:13:00', 'B215SS8');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `idade_min` int DEFAULT NULL,
  `idade_max` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`id`, `nome`, `created_at`, `idade_min`, `idade_max`) VALUES
(1, 'Grupo 18 a 23 anos', '2021-11-03 23:59:41', 18, 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-03-09-175503', 'App\\Database\\Migrations\\AddUsuario', 'default', 'App', 1635994550, 1),
(2, '2021-03-09-180526', 'App\\Database\\Migrations\\AddGrupo', 'default', 'App', 1635994550, 1),
(3, '2021-03-09-182335', 'App\\Database\\Migrations\\AddAgenda', 'default', 'App', 1635994550, 1),
(4, '2021-03-09-184450', 'App\\Database\\Migrations\\AddPaciente', 'default', 'App', 1635994550, 1),
(5, '2021-03-09-185324', 'App\\Database\\Migrations\\AddAgendamento', 'default', 'App', 1635994550, 1),
(6, '2021-04-05-132245', 'App\\Database\\Migrations\\Addidadegrupo', 'default', 'App', 1635994550, 1),
(7, '2021-04-05-190744', 'App\\Database\\Migrations\\Addacessosusuario', 'default', 'App', 1635994550, 1),
(8, '2021-04-08-134730', 'App\\Database\\Migrations\\AddProtocoloAgendamento', 'default', 'App', 1635994550, 1),
(9, '2021-04-08-183110', 'App\\Database\\Migrations\\AddIdadePaciente', 'default', 'App', 1635994550, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_mae` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `idade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id`, `cpf`, `nome`, `nome_mae`, `data_nascimento`, `telefone`, `created_at`, `idade`) VALUES
(1, '11683575431', 'Allan Ranier', 'Edilza Cristina de Vasconcelos', '1999-04-18', '(81) 98129-7900', '2021-11-03 23:58:46', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_ultimo_acesso` timestamp NULL DEFAULT NULL,
  `ip_ultimo_acesso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `senha`, `created_at`, `dt_ultimo_acesso`, `ip_ultimo_acesso`) VALUES
(1, 'Admin', 'admin@admin.com', '$2y$10$9ywoo4Hu60EyBMa19Xxee.nST31jgpgUx9NvSkBL6Th5.7Oqvv/WW', '2021-11-03 23:56:27', '2021-11-04 00:56:57', '::1'),
(2, 'Allan', 'allan@localhost.com', '$2y$10$L7BFGd6PZhHeGXXgUFdVReqILazhaLNa4PQfglN7lQBvEh2NNdbiy', '2021-11-03 23:58:10', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
