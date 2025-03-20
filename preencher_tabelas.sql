USE LocadoraCarros;
GO

-- Regiões
INSERT INTO Regioes (Nome) VALUES 
('Sul'), ('Sudeste'), ('Nordeste'), ('Centro-Oeste'), ('Norte'),
('Interior SP'), ('Litoral RJ'), ('Serra Gaúcha'), ('Pantanal'), ('Chapada Diamantina');

-- Vendedores
INSERT INTO Vendedores (Nome, Email, RegiaoID) VALUES
('Carlos Mendes', 'carlos@locadora.com', 1),
('Ana Lima', 'ana@locadora.com', 2),
('Roberto Farias', 'roberto@locadora.com', 3),
('Juliana Paes', 'juliana@locadora.com', 4),
('Fernando Alves', 'fernando@locadora.com', 5),
('Paula Reis', 'paula@locadora.com', 6),
('Lucas Rocha', 'lucas@locadora.com', 7),
('Bianca Torres', 'bianca@locadora.com', 8),
('Rafael Dias', 'rafael@locadora.com', 9),
('Larissa Monteiro', 'larissa@locadora.com', 10);

-- Clientes
INSERT INTO Clientes (Nome, CPF, Email, Telefone) VALUES
('João Silva', '12345678901', 'joao@email.com', '11999990000'),
('Maria Souza', '98765432100', 'maria@email.com', '21988887777'),
('Pedro Santos', '11122233344', 'pedro@email.com', '31988885555'),
('Ana Paula', '55566677788', 'ana@email.com', '41977776666'),
('Carlos Eduardo', '99988877766', 'cadu@email.com', '31999998888'),
('Fernanda Lima', '22233344455', 'fernanda@email.com', '21966667777'),
('Rodrigo Matos', '44455566677', 'rodrigo@email.com', '51933334444'),
('Tatiane Rocha', '77788899900', 'tatiane@email.com', '61922221111'),
('Marcelo Cunha', '33344455566', 'marcelo@email.com', '71988889999'),
('Letícia Alves', '66677788899', 'leticia@email.com', '81977778888');

-- Categorias de Carros
INSERT INTO CategoriasCarros (Descricao) VALUES 
('Econômico'), ('SUV'), ('Luxo'), ('Esportivo'), ('Utilitário'),
('Pick-up'), ('Conversível'), ('Van'), ('Sedan'), ('Hatch');

-- Modelos
INSERT INTO Modelos (NomeModelo, CategoriaID) VALUES
('Gol 1.0', 1),
('Tracker', 2),
('BMW X1', 3),
('Camaro SS', 4),
('Fiat Strada', 5),
('Hilux', 6),
('Mini Cooper', 7),
('Renault Master', 8),
('Civic EX', 9),
('Onix LT', 10);

-- Carros
INSERT INTO Carros (Placa, ModeloID, AnoFabricacao, Cor, Disponivel) VALUES
('ABC1234', 1, 2020, 'Prata', 1),
('XYZ5678', 2, 2022, 'Preto', 1),
('QWE4321', 3, 2023, 'Branco', 1),
('ZXC0987', 4, 2021, 'Amarelo', 1),
('JKL6543', 5, 2022, 'Vermelho', 1),
('HGF3210', 6, 2021, 'Azul', 1),
('TGB9876', 7, 2023, 'Cinza', 1),
('MNB5432', 8, 2020, 'Branco', 1),
('VFR3456', 9, 2021, 'Prata', 1),
('BNM1234', 10, 2022, 'Preto', 1);

-- Locações
INSERT INTO Locacoes (ClienteID, CarroID, VendedorID, DataRetirada, DataDevolucaoPrevista, ValorTotal) VALUES
(1, 1, 1, '2025-03-01', '2025-03-05', 300.00),
(2, 2, 2, '2025-03-02', '2025-03-07', 600.00),
(3, 3, 3, '2025-03-03', '2025-03-08', 850.00),
(4, 4, 4, '2025-03-04', '2025-03-09', 1200.00),
(5, 5, 5, '2025-03-05', '2025-03-10', 500.00),
(6, 6, 6, '2025-03-06', '2025-03-11', 780.00),
(7, 7, 7, '2025-03-07', '2025-03-12', 950.00),
(8, 8, 8, '2025-03-08', '2025-03-13', 1100.00),
(9, 9, 9, '2025-03-09', '2025-03-14', 430.00),
(10, 10, 10, '2025-03-10', '2025-03-15', 520.00);

-- Pagamentos
INSERT INTO Pagamentos (LocacaoID, FormaPagamento, ValorPago, DataPagamento) VALUES
(1, 'Cartão de Crédito', 300.00, '2025-03-01'),
(2, 'Pix', 600.00, '2025-03-02'),
(3, 'Cartão Débito', 850.00, '2025-03-03'),
(4, 'Boleto', 1200.00, '2025-03-04'),
(5, 'Cartão Crédito', 500.00, '2025-03-05'),
(6, 'Pix', 780.00, '2025-03-06'),
(7, 'Cartão Débito', 950.00, '2025-03-07'),
(8, 'Boleto', 1100.00, '2025-03-08'),
(9, 'Pix', 430.00, '2025-03-09'),
(10, 'Cartão de Crédito', 520.00, '2025-03-10');

-- Faturamento
INSERT INTO Faturamento (VendedorID, Mes, Ano, TotalVendas) VALUES
(1, 3, 2025, 300.00),
(2, 3, 2025, 600.00),
(3, 3, 2025, 850.00),
(4, 3, 2025, 1200.00),
(5, 3, 2025, 500.00),
(6, 3, 2025, 780.00),
(7, 3, 2025, 950.00),
(8, 3, 2025, 1100.00),
(9, 3, 2025, 430.00),
(10, 3, 2025, 520.00);

-- Custos
INSERT INTO Custos (Descricao, Valor, DataCusto) VALUES
('Aluguel da sede', 5000.00, '2025-03-01'),
('Internet e sistema', 800.00, '2025-03-02'),
('Energia elétrica', 1200.00, '2025-03-03'),
('Seguros', 1500.00, '2025-03-04'),
('Marketing digital', 950.00, '2025-03-05'),
('Manutenção predial', 700.00, '2025-03-06'),
('Consultoria', 1200.00, '2025-03-07'),
('Uniformes', 400.00, '2025-03-08'),
('Combustível frota', 900.00, '2025-03-09'),
('Outros custos', 600.00, '2025-03-10');

-- Manutenção
INSERT INTO Manutencao (CarroID, Descricao, Custo, DataManutencao) VALUES
(1, 'Troca de óleo', 250.00, '2025-03-01'),
(2, 'Revisão completa', 700.00, '2025-03-02'),
(3, 'Alinhamento e balanceamento', 150.00, '2025-03-03'),
(4, 'Troca de pneus', 450.00, '2025-03-04'),
(5, 'Limpeza interna', 100.00, '2025-03-05'),
(6, 'Lavagem completa', 80.00, '2025-03-06'),
(7, 'Troca de freios', 320.00, '2025-03-07'),
(8, 'Reparo de pintura', 500.00, '2025-03-08'),
(9, 'Troca de bateria', 350.00, '2025-03-09'),
(10, 'Revisão elétrica', 400.00, '2025-03-10');
