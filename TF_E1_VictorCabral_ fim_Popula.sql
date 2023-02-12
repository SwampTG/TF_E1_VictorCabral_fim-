-- ------------------------   << Trabalho Final (TF) - Tema E - Data Lake  >>   ------------------------
--
--                    					SCRIPT DE CRIACAO (DDL) 
--
-- Data Criacao ...........: 09/02/2023
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

-- POPULA
LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/part-00000-b7e405c1-20aa-4d8a-8f05-38b4f023f129.c000.csv'
        INTO TABLE ESTABELECIMENTO
    FIELDS TERMINATED BY ';'
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (
		@document_id,
		@paciente_id,
		@paciente_idade,
		@paciente_dataNascimento,
		@paciente_enumSexoBiologico,
		@paciente_racaCor_codigo,
		@paciente_racaCor_valor,
		@paciente_endereco_coIbgeMunicipio,
		@paciente_endereco_coPais,
		@paciente_endereco_nmMunicipio,
		@paciente_endereco_nmPais,
		@paciente_endereco_uf,
		@paciente_endereco_cep,
		@paciente_nacionalidade_enumNacionalidade,
		@estabelecimento_valor,
		@estabelecimento_razaoSocial,
		@estalecimento_noFantasia,
		@estabelecimento_municipio_codigo,
		@estabelecimento_municipio_nome,
		@estabelecimento_uf,
		@vacina_grupoAtendimento_codigo,
		@vacina_grupoAtendimento_nome,
		@vacina_categoria_codigo,
		@vacina_categoria_nome,
		@vacina_lote,
		@vacina_fabricante_nome,
		@vacina_fabricante_referencia,
		@vacina_dataAplicacao,
		@vacina_descricao_dose,
		@vacina_codigo,
		@vacina_nome,
		@sistema_origem
	)
    SET estabelecimento_valor=@estabelecimento_valor,
    estabelecimento_razaoSocial=@estabelecimento_razaoSocial,
    estalecimento_noFantasia=@estalecimento_noFantasia,
    estabelecimento_municipio_nome=@estabelecimento_municipio_nome,
    estabelecimento_uf=@estabelecimento_uf;

LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/part-00000-b7e405c1-20aa-4d8a-8f05-38b4f023f129.c000.csv'
	INTO TABLE SISTEMA
    FIELDS TERMINATED BY ';'
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS
    (
		@document_id,
		@paciente_id,
		@paciente_idade,
		@paciente_dataNascimento,
		@paciente_enumSexoBiologico,
		@paciente_racaCor_codigo,
		@paciente_racaCor_valor,
		@paciente_endereco_coIbgeMunicipio,
		@paciente_endereco_coPais,
		@paciente_endereco_nmMunicipio,
		@paciente_endereco_nmPais,
		@paciente_endereco_uf,
		@paciente_endereco_cep,
		@paciente_nacionalidade_enumNacionalidade,
		@estabelecimento_valor,
		@estabelecimento_razaoSocial,
		@estalecimento_noFantasia,
		@estabelecimento_municipio_codigo,
		@estabelecimento_municipio_nome,
		@estabelecimento_uf,
		@vacina_grupoAtendimento_codigo,
		@vacina_grupoAtendimento_nome,
		@vacina_categoria_codigo,
		@vacina_categoria_nome,
		@vacina_lote,
		@vacina_fabricante_nome,
		@vacina_fabricante_referencia,
		@vacina_dataAplicacao,
		@vacina_descricao_dose,
		@vacina_codigo,
		@vacina_nome,
		@sistema_origem
	) SET sistema_origem=@sistema_origem;
    
LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/part-00000-b7e405c1-20aa-4d8a-8f05-38b4f023f129.c000.csv'
	INTO TABLE PACIENTE
	FIELDS TERMINATED BY ';'
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS
	(
		@document_id,
		@paciente_id,
		@paciente_idade,
		@paciente_dataNascimento,
		@paciente_enumSexoBiologico,
		@paciente_racaCor_codigo,
		@paciente_racaCor_valor,
		@paciente_endereco_coIbgeMunicipio,
		@paciente_endereco_coPais,
		@paciente_endereco_nmMunicipio,
		@paciente_endereco_nmPais,
		@paciente_endereco_uf,
		@paciente_endereco_cep,
		@paciente_nacionalidade_enumNacionalidade,
		@estabelecimento_valor,
		@estabelecimento_razaoSocial,
		@estalecimento_noFantasia,
		@estabelecimento_municipio_codigo,
		@estabelecimento_municipio_nome,
		@estabelecimento_uf,
		@vacina_grupoAtendimento_codigo,
		@vacina_grupoAtendimento_nome,
		@vacina_categoria_codigo,
		@vacina_categoria_nome,
		@vacina_lote,
		@vacina_fabricante_nome,
		@vacina_fabricante_referencia,
		@vacina_dataAplicacao,
		@vacina_descricao_dose,
		@vacina_codigo,
		@vacina_nome,
		@sistema_origem
	) SET paciente_id=@paciente_id, 
		paciente_dataNascimento=@paciente_dataNascimento,
		paciente_idade=@paciente_idade,
		paciente_racaCor_valor=@paciente_racaCor_valor,
		paciente_racaCor_codigo=@paciente_racaCor_valor,
		paciente_nacionalidade_enumNacionalidade=@paciente_nacionalidade_enumNacionalidade,
		paciente_enumSexoBioIogico=@paciente_enumSexoBioIogico;
    
LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/part-00000-b7e405c1-20aa-4d8a-8f05-38b4f023f129.c000.csv'
		INTO TABLE endereco
	FIELDS TERMINATED BY ';'
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS
	(
		@document_id,
		@paciente_id,
		@paciente_idade,
		@paciente_dataNascimento,
		@paciente_enumSexoBiologico,
		@paciente_racaCor_codigo,
		@paciente_racaCor_valor,
		@paciente_endereco_coIbgeMunicipio,
		@paciente_endereco_coPais,
		@paciente_endereco_nmMunicipio,
		@paciente_endereco_nmPais,
		@paciente_endereco_uf,
		@paciente_endereco_cep,
		@paciente_nacionalidade_enumNacionalidade,
		@estabelecimento_valor,
		@estabelecimento_razaoSocial,
		@estalecimento_noFantasia,
		@estabelecimento_municipio_codigo,
		@estabelecimento_municipio_nome,
		@estabelecimento_uf,
		@vacina_grupoAtendimento_codigo,
		@vacina_grupoAtendimento_nome,
		@vacina_categoria_codigo,
		@vacina_categoria_nome,
		@vacina_lote,
		@vacina_fabricante_nome,
		@vacina_fabricante_referencia,
		@vacina_dataAplicacao,
		@vacina_descricao_dose,
		@vacina_codigo,
		@vacina_nome,
		@sistema_origem
	) SET paciente_id=@paciente_id, 
		paciente_endereco_cep=@paciente_endereco_cep, 
		paciente_endereco_uf=@paciente_endereco_uf,
		paciente_endereco_nmPais=@paciente_endereco_nmPais,
		paciente_endereco_nmMunicipio=@paciente_endereco_nmMunicipio,
		paciente_endereco_coPais=@paciente_endereco_coPais, 
		paciente_endereco_coIbgeMunicipio=@paciente_endereco_coIbgeMunicipio;
        
LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/VACINA.csv'
		INTO TABLE VACINA
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS
	(
		@dummy,
		@vacina_codigo,
        @vacina_nome,
        @vacina_fabricante_referencia
	) SET vacina_codigo=@vacina_codigo, vacina_nome=@vacina_nome, vacina_fabricante_referencia=@vacina_fabricante_referencia;

LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/SISTEMA_CADASTRO.csv'
		INTO TABLE SISTEMA_CADASTRO
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS
	(
		@dummy,
		@vacina_codigo,
		@sistema
	) SET vacina=@vacina_codigo, sistema=@sistema;
    
LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/ARMAZENADA_EST.csv'
		INTO TABLE ARMAZENADA_ESTABELECIMENTO
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS
	(
		@dummy,
		@estabelecimento_id,
		@idCadastro,
        @vacina_lote
	) SET estabelecimento=@estabelecimento_id, 
		cadastro=@idCadastro,
        vacina_lote=@vacina_lote;

LOAD DATA LOCAL INFILE '/home/adriansl/unb/2022_2/SBD2/tf_mysql/TF_E1_VictorCabral_fim/raw_data/recebe.csv'
		INTO TABLE recebe
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS
	(
		@dummy,
		@paciente_id,
		@armazenada,
        @vacina_dataAplicacao,
        @vacina_grupoAtendimento_codigo,
        @vacina_grupoAtendimento_nome,
        @vacina_descricao_dose,
        @vacina_categoria_nome,
        @vacina_categoria_codigo
	) SET paciente=@paciente_id,
		armazenada=@armazenada,
        vacina_dataAplicacao=@vacina_dataAplicacao,
        vacina_grupo_atendimento_code=@vacina_grupoAtendimento_codigo,
        vacina_grupo_atendimento_nome=@vacina_grupoAtendimento_nome,
        vacina_descricao_dose=@vacina_descricao_dose,
        vacina_categoria_nome=@vacina_categoria_nome,
        vacina_categoria_codigo=@vacina_categoria_codigo;