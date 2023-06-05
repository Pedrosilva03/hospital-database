CREATE SCHEMA IF NOT EXISTS hospital;

USE hospital;

DROP TABLE IF EXISTS HistorialMedico;
DROP TABLE IF EXISTS Consulta;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Especialidade;
DROP TABLE IF EXISTS SeguroSaude;
DROP TABLE IF EXISTS Medicamentos;
DROP TABLE IF EXISTS Exames;
DROP TABLE IF EXISTS Inventario;

CREATE TABLE IF NOT EXISTS Paciente(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    nascimento date,
    idade INTEGER,
    genero char,
    morada VARCHAR(100),
    telefone INTEGER,
    email VARCHAR(100),
    emergencia INTEGER
);

CREATE TABLE IF NOT EXISTS Especialidade(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Medico(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idade INTEGER,
    genero char,
    morada VARCHAR(100),
    telefone INTEGER,
    email VARCHAR(100),
    idEspecialidade INTEGER,
    FOREIGN KEY (idEspecialidade) REFERENCES Especialidade(identificador) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Consulta(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    idEspecialidade INTEGER,
    idMedico INTEGER,
    idPaciente INTEGER,
    FOREIGN KEY (idEspecialidade) REFERENCES Especialidade(identificador) ON DELETE CASCADE,
    FOREIGN KEY (idMedico) REFERENCES Medico(identificador) ON DELETE CASCADE,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(identificador) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS SeguroSaude(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    seguradora VARCHAR(100),
    validade date,
    percentgem FLOAT,
    idPaciente INTEGER
);

CREATE TABLE IF NOT EXISTS Medicamentos(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Exames(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao VARCHAR(1000),
    idPaciente INTEGER
);

CREATE TABLE IF NOT EXISTS Inventario(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS HistorialMedico(
	identificador INTEGER PRIMARY KEY AUTO_INCREMENT,
	idPaciente INTEGER,
    medicamentos VARCHAR(100),
    diagnosticos VARCHAR(100),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(identificador) ON DELETE CASCADE
);