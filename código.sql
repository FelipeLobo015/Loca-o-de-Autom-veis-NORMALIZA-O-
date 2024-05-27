CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE Veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo VARCHAR(50) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    placa VARCHAR(10) NOT NULL,
    diaria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Locacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_locacao INT NOT NULL,
    cliente_id INT,
    veiculo_id INT,
    dias INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id),
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(id)
);

INSERT INTO Clientes (nome, cpf, nascimento) VALUES
('Ariano Suassuna', '123.456.789-01', '1022-05-21'),
('Grace Hopper', '543.765.987-23', '2002-04-29'),
('Richard Feynman', '987.654.231-90', '2001-10-12'),
('Edgar Poe', '432.765.678-67', '1998-12-14'),
('Gordon Freeman', '927.384.284-44', '1984-11-26');

INSERT INTO Veiculos (veiculo, cor, placa, diaria) VALUES
('Fusca', 'Preto', 'WER-3456', 30.00),
('Variante', 'Rosa', 'FDS-8384', 60.00),
('Comodoro', 'Preto', 'CVB-9933', 20.00),
('Deloriam', 'Azul', 'FGH-2256', 80.00),
('Brasília', 'Amarela', 'DDI-3948', 45.00);

INSERT INTO Locacoes (cod_locacao, cliente_id, veiculo_id, dias, total) VALUES
(101, 1, 1, 3, 90.00),
(102, 2, 2, 7, 420.00),
(103, 3, 3, 1, 20.00),
(104, 4, 4, 3, 240.00),
(105, 5, 5, 7, 315.00);


CREATE VIEW LocacoesDetalhadas AS
SELECT
    l.id AS locacao_id,
    l.cod_locacao,
    l.dias,
    l.total,
    c.id AS cliente_id,
    c.nome AS cliente_nome,
    c.cpf AS cliente_cpf,
    c.nascimento AS cliente_nascimento,
    v.id AS veiculo_id,
    v.veiculo AS veiculo_nome,
    v.cor AS veiculo_cor,
    v.placa AS veiculo_placa,
    v.diaria AS veiculo_diaria
FROM
    Locacoes l
INNER JOIN
    Clientes c ON l.cliente_id = c.id
INNER JOIN
    Veiculos v ON l.veiculo_id = v.id;
    
    select * from LocacoesDetalhadas
