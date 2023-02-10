-- ------------------------   << Trabalho Final (TF) - Tema E - Data Lake  >>   ------------------------
--
--                    					SCRIPT DE CRIACAO (DDL) 
--
-- Data Criacao ...........: 07/02/2023
-- Autor(es) ..............: Adrian Soares Lopes, Pedro Lucas Cassiano Martins e Victor de Souza Cabral
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_TemaE_VictorCabral
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--
-- ----------------------------------------------------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS TF_TemaE_VictorCabral;

USE TF_TemaE_VictorCabral;

-- TABELAS
CREATE TABLE ESTABELECIMENTO (
    estabelecimento_id BIGINT NOT NULL AUTO_INCREMENT, 
    estabelecimento_valor INT NOT NULL,
    estabelecimento_razaoSocial VARCHAR(50) NOT NULL,
    estalecimento_noFantasia INT(6) NOT NULL,
    estabelecimento_municipio_nome VARCHAR(50) NOT NULL,
    estabelecimento_uf VARCHAR(2) NOT NULL,

    CONSTRAINT ESTABELECIMENTO_PK PRIMARY KEY (estabelecimento_id)   
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE SISTEMA (
    sistema_id INT NOT NULL AUTO_INCREMENT, 
    sistema_origem VARCHAR(30) NOT NULL,

    CONSTRAINT SISTEMA_PK PRIMARY KEY (sistema_id)   
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VACINA (
    vacina_codigo INT NOT NULL, 
    vacina_lote VARCHAR(8) NOT NULL,
    vacina_descricao_dose VARCHAR(10) NOT NULL,
    vacina_nome VARCHAR(30) NOT NULL,
    vacina_fabricante_referencia VARCHAR(30) NOT NULL,
    vacina_categoria_nome VARCHAR(15) NOT NULL,
    vacina_categoria_codigo INT NOT NULL,
    vacina_grupo_atendimento_code INT NOT NULL,
    vacina_grupo_atendimento_nome VARCHAR(80) NOT NULL,
    estabelecimento_id BIGINT NOT NULL,
    sistema_id INT NOT NULL,

    CONSTRAINT VACINA_PK PRIMARY KEY (vacina_codigo),
    
    CONSTRAINT VACINA_ESTABELECIMENTO_FK 
		FOREIGN KEY (estabelecimento_id)
        REFERENCES ESTABELECIMENTO (estabelecimento_id)
        ON DELETE RESTRICT,
    CONSTRAINT VACINA_SISTEMA_FK 
		FOREIGN KEY (sistema_id)
        REFERENCES SISTEMA (sistema_id)
        ON DELETE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PACIENTE (
    paciente_id VARCHAR(100) NOT NULL, 
    paciente_dataNascimento DATE NOT NULL,
    paciente_idade INT NOT NULL,
    paciente_racaCor_valor VARCHAR(15) NOT NULL,
    paciente_racaCor_codigo ENUM('1', '2', '3', '4', '99') NOT NULL,
    paciente_nacionalidade_enumNacionalidade ENUM('B', 'E', 'N', 'None'),
    paciente_enumSexoBioIogico ENUM('M', 'F') NOT NULL,

    CONSTRAINT PACIENTE_PK PRIMARY KEY (paciente_id)
) ENGINE = InnoDB;

CREATE TABLE endereco (
	paciente_id VARCHAR(100) NOT NULL, 
    paciente_endereco_cep INT(8) NOT NULL, 
    paciente_endereco_uf VARCHAR(2) NOT NULL,
    paciente_endereco_nmPais VARCHAR(30) NOT NULL,
    paciente_endereco_nmMunicipio VARCHAR(30) NOT NULL,
    paciente_endereco_coPais INT NOT NULL, 
    paciente_endereco_coIbgeMunicipio INT NOT NULL,     

    CONSTRAINT endereco_UK UNIQUE KEY (paciente_endereco_cep, paciente_id),
    CONSTRAINT endereco_paciente_FK 
		FOREIGN KEY (paciente_id)
        REFERENCES PACIENTE (paciente_id)
        ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE recebe (
	paciente VARCHAR(100) NOT NULL,
    vacina INT NOT NULL,
    vacina_dataAplicacao DATE NOT NULL,
    CONSTRAINT recebeu_PACIENTE_FK 
		FOREIGN KEY (paciente)
        REFERENCES PACIENTE (paciente_id)
        ON DELETE RESTRICT,
	CONSTRAINT recebeu_VACINA_FK
		FOREIGN KEY (vacina)
        REFERENCES VACINA (vacina_codigo)
        ON DELETE RESTRICT
);
