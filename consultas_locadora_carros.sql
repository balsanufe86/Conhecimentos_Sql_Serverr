USE LocadoraCarros;
GO

-- 1. Listar todos os clientes com suas últimas locações
SELECT 
    c.Nome AS Cliente,
    CONVERT(VARCHAR(10), l.DataRetirada, 103) AS DataRetirada,
    CONVERT(VARCHAR(10), l.DataDevolucaoPrevista, 103) AS DataDevolucaoPrevista,
    l.ValorTotal
FROM Clientes c
JOIN Locacoes l ON c.ClienteID = l.ClienteID
ORDER BY c.Nome, l.DataRetirada DESC;

-- 2. Faturamento total por vendedor
SELECT 
    v.Nome AS Vendedor,
    SUM(f.TotalVendas) AS FaturamentoTotal
FROM Faturamento f
JOIN Vendedores v ON v.VendedorID = f.VendedorID
GROUP BY v.Nome
ORDER BY FaturamentoTotal DESC;

-- 3. Total de locações por categoria de carro
SELECT 
    cc.Descricao AS Categoria,
    COUNT(*) AS TotalLocacoes
FROM Locacoes l
JOIN Carros c ON c.CarroID = l.CarroID
JOIN Modelos m ON m.ModeloID = c.ModeloID
JOIN CategoriasCarros cc ON cc.CategoriaID = m.CategoriaID
GROUP BY cc.Descricao
ORDER BY TotalLocacoes DESC;

-- 4. Valor total pago por forma de pagamento
SELECT 
    FormaPagamento,
    SUM(ValorPago) AS TotalPago
FROM Pagamentos
GROUP BY FormaPagamento
ORDER BY TotalPago DESC;

-- 5. Custo total por tipo de manutenção
SELECT 
    Descricao,
    COUNT(*) AS QtdServicos,
    SUM(Custo) AS TotalGasto
FROM Manutencao
GROUP BY Descricao
ORDER BY TotalGasto DESC;

-- 6. Receita líquida (faturamento - custos)
SELECT 
    (SELECT SUM(TotalVendas) FROM Faturamento) -
    (SELECT SUM(Valor) FROM Custos) AS ReceitaLiquida;

-- 7. Lista de carros disponíveis para locação
SELECT 
    c.Placa,
    m.NomeModelo,
    cc.Descricao AS Categoria,
    c.AnoFabricacao,
    c.Cor
FROM Carros c
JOIN Modelos m ON m.ModeloID = c.ModeloID
JOIN CategoriasCarros cc ON cc.CategoriaID = m.CategoriaID
WHERE c.Disponivel = 1;

-- 8. Ranking de clientes que mais alugaram
SELECT 
    cl.Nome AS Cliente,
    COUNT(*) AS QtdeLocacoes,
    SUM(l.ValorTotal) AS TotalGasto
FROM Locacoes l
JOIN Clientes cl ON cl.ClienteID = l.ClienteID
GROUP BY cl.Nome
ORDER BY QtdeLocacoes DESC;

-- 9. Total de locações e média de valor por vendedor
SELECT 
    v.Nome AS Vendedor,
    COUNT(l.LocacaoID) AS QtdeLocacoes,
    CAST(AVG(l.ValorTotal) AS DECIMAL(10,2)) AS MediaValor
FROM Locacoes l
JOIN Vendedores v ON v.VendedorID = l.VendedorID
GROUP BY v.Nome
ORDER BY QtdeLocacoes DESC;

-- 10. Carros que passaram por mais de 1 manutenção
SELECT 
    c.Placa,
    COUNT(m.ManutencaoID) AS QtdeManutencoes
FROM Carros c
JOIN Manutencao m ON m.CarroID = c.CarroID
GROUP BY c.Placa
HAVING COUNT(m.ManutencaoID) > 1;
