CREATE SCHEMA meu_banco;
USE meu_banco;

-- Tabela info_pessoais_funcionario
CREATE TABLE info_pessoais_funcionario (
    cpf VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    tel_celular VARCHAR(15) NOT NULL,
    tel_residencial VARCHAR(15),
    email_pessoal VARCHAR(40) NOT NULL,
    status_info BOOL DEFAULT 1
);

-- Tabela departamento
CREATE TABLE departamento (
    codigo_depto BIGINT AUTO_INCREMENT PRIMARY KEY,
    sigla_depto VARCHAR(15) NOT NULL,
    nome_depto VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    quantidade_funcionarios_depto INT NOT NULL CHECK (quantidade_funcionarios_depto >= 0),
    status_depto BOOL DEFAULT 1
);

-- Tabela funcionario
CREATE TABLE funcionario (
    codigo_funcionario BIGINT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(100) NOT NULL,
    data_admissao DATE NOT NULL,
    email_funcionario VARCHAR(40) NOT NULL,
    data_demissao DATE,
    cpf_funcionario VARCHAR(15) UNIQUE NOT NULL,
    codigo_depto_funcionario BIGINT,
    status_funcionario BOOL DEFAULT 1,
    CONSTRAINT fk_cpf_funcionario FOREIGN KEY (cpf_funcionario) REFERENCES info_pessoais_funcionario(cpf),
    CONSTRAINT fk_codigo_depto_funcionario FOREIGN KEY (codigo_depto_funcionario) REFERENCES departamento(codigo_depto)
);

-- Tabela projeto
CREATE TABLE projeto (
    codigo_projeto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_projeto VARCHAR(50) NOT NULL,
    duracao_horas_projeto INT NOT NULL,
    descricao_depto TEXT NOT NULL,
    codigo_depto_projeto BIGINT,
    status_projeto BOOL DEFAULT 1,
    CONSTRAINT fk_codigo_depto_projeto FOREIGN KEY (codigo_depto_projeto) REFERENCES departamento(codigo_depto)
);

-- Tabela funcionário alocado em projeto
CREATE TABLE func_alocado_em_proj (
    codigo_associacao BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo_funcionario BIGINT,
    codigo_projeto BIGINT,
    FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo_funcionario),
    FOREIGN KEY (codigo_projeto) REFERENCES projeto(codigo_projeto)
);
