/*-- 
CREATE DATABASE DBTESTEWK;
DROP DATABASE DBTESTEWK;
*/

/*
 DROP TABLE DBTESTEWK.t004_pedidos_produtos;
 DROP TABLE DBTESTEWK.t003_pedidos;
 DROP TABLE DBTESTEWK.t001_clientes;
 DROP TABLE DBTESTEWK.t002_produtos;
*/

-- 2. Campos da tabela de clientes (Código, Nome, Cidade, UF)
CREATE TABLE t001_clientes (
    t001_clienteID INT PRIMARY KEY AUTO_INCREMENT,  
    t001_nome VARCHAR(60) NOT NULL, 
    t001_cidade VARCHAR(60) NOT NULL,
    t001_uf CHAR(2) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 3. Campos da tabela de produtos (Código, Descrição, Preço de venda)
CREATE TABLE t002_produtos (
    t002_produtoID INT PRIMARY KEY AUTO_INCREMENT,  
    t002_descricao VARCHAR(60) NOT NULL,
    t002_preco_venda DECIMAL(10, 2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 14. Campos da tabela de pedidos dados gerais (Número pedido, Data emissão, Código cliente, Valor total) 
CREATE TABLE t003_pedidos (
    t003_pedidoID INT PRIMARY KEY AUTO_INCREMENT, 
    t003_data_emissao DATE NOT NULL,
    t003_clienteID INT NOT NULL, 
    t003_vlr_total DECIMAL(10, 2) NOT NULL,  
    FOREIGN KEY (t003_clienteID) REFERENCES t001_clientes(t001_clienteID)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 15. Campos da tabela de pedidos produtos (Autoincrem, Número pedido, Código produto, Quantidade, Vir. Unitário, Vir. Total)
CREATE TABLE t004_pedidos_produtos (
    t004_pedido_produtoID INT PRIMARY KEY AUTO_INCREMENT,  
    t003_pedidoID INT NOT NULL,
    t002_produtoID INT NOT NULL,
    t004_quantidade INT NOT NULL,  
    t004_vlr_unitario DECIMAL(10, 2) NOT NULL,
    t004_vlr_total DECIMAL(10, 2), 
    FOREIGN KEY (t003_pedidoID) REFERENCES t003_pedidos(t003_pedidoID),
    FOREIGN KEY (t002_produtoID) REFERENCES t002_produtos(t002_produtoID)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO t001_clientes (t001_nome, t001_cidade, t001_uf) VALUES
('Goku', 'São Paulo', 'SP'),
('Naruto Uzumaki', 'Rio de Janeiro', 'RJ'),
('Luffy', 'Salvador', 'BA'),
('Sasuke Uchiha', 'Belo Horizonte', 'MG'),
('Zoro', 'Fortaleza', 'CE'),
('Kenshin Himura', 'Curitiba', 'PR'),
('Natsu Dragneel', 'Porto Alegre', 'RS'),
('Edward Elric', 'Brasília', 'DF'),
('Light Yagami', 'Recife', 'PE'),
('Eren Yeager', 'Goiânia', 'GO'),
('Hinata Hyuga', 'Manaus', 'AM'),
('Sakura Haruno', 'Campo Grande', 'MS'),
('Inuyasha', 'Florianópolis', 'SC'),
('Yu Yu Hakusho', 'Teresina', 'PI'),
('Shinji Ikari', 'Belém', 'PA'),
('Asuka Langley', 'Natal', 'RN'),
('Kagome Higurashi', 'João Pessoa', 'PB'),
('Lelouch vi Britannia', 'Vitória', 'ES'),
('Todoroki Shoto', 'Maceió', 'AL');

INSERT INTO t002_produtos (t002_descricao, t002_preco_venda) VALUES
('Processador Intel i9', 2899.90),
('Placa de Vídeo NVIDIA RTX 3080', 4999.90),
('Memória RAM Corsair 16GB', 799.90),
('SSD Kingston 1TB', 499.90),
('HD Seagate 2TB', 349.90),
('Placa-mãe ASUS ROG', 1499.90),
('Fonte Corsair 750W', 599.90),
('Gabinete NZXT H510', 499.90),
('Monitor Acer 27"', 1399.90),
('Teclado Mecânico Logitech', 399.90),
('Mouse Razer DeathAdder', 299.90),
('Headset HyperX Cloud II', 499.90),
('Webcam Logitech C920', 379.90),
('Microfone Blue Yeti', 899.90),
('Caixas de Som Logitech Z313', 299.90),
('Cooler Noctua NH-D15', 899.90),
('Controle Xbox Series X', 499.90),
('Roteador TP-Link Archer C7', 299.90),
('Placa de Captura Elgato HD60 S', 1199.90),
('Carregador Portátil Anker 20000mAh', 199.90);

INSERT INTO t003_pedidos (t003_data_emissao, t003_clienteID, t003_vlr_total) VALUES
('2024-10-10', 1, 499.90), 
('2024-10-11', 2, 899.90), 
('2024-10-12', 3, 799.90),  
('2024-10-13', 4, 1299.90), 
('2024-10-14', 5, 399.90); 

-- Pedido de Goku (Pedido ID 1)
INSERT INTO t004_pedidos_produtos (t003_pedidoID, t002_produtoID, t004_quantidade, t004_vlr_unitario, t004_vlr_total) VALUES
(1, 1, 1, 29.90, 29.90),  
(1, 2, 2, 79.90, 159.80); 

-- Pedido de Naruto Uzumaki (Pedido ID 2)
INSERT INTO t004_pedidos_produtos (t003_pedidoID, t002_produtoID, t004_quantidade, t004_vlr_unitario, t004_vlr_total) VALUES
(2, 3, 1, 149.90, 149.90), 
(2, 4, 2, 299.90, 599.80); 

-- Pedido de Luffy (Pedido ID 3)
INSERT INTO t004_pedidos_produtos (t003_pedidoID, t002_produtoID, t004_quantidade, t004_vlr_unitario, t004_vlr_total) VALUES
(3, 5, 1, 89.90, 89.90), 
(3, 6, 2, 19.90, 39.80); 

-- Pedido de Sasuke Uchiha (Pedido ID 4)
INSERT INTO t004_pedidos_produtos (t003_pedidoID, t002_produtoID, t004_quantidade, t004_vlr_unitario, t004_vlr_total) VALUES
(4, 7, 1, 129.90, 129.90),  
(4, 8, 2, 199.90, 399.80), 
(4, 9, 1, 49.90, 49.90);   

-- Pedido de Zoro (Pedido ID 5)
INSERT INTO t004_pedidos_produtos (t003_pedidoID, t002_produtoID, t004_quantidade, t004_vlr_unitario, t004_vlr_total) VALUES
(5, 10, 1, 89.90, 89.90),  
(5, 11, 1, 99.90, 99.90),  
(5, 12, 2, 69.90, 139.80); 

/*
SELECT * FROM t001_clientes
SELECT * FROM t002_produtos
SELECT * FROM t003_pedidos
SELECT * FROM t004_pedidos_produtos

SELECT t003.t003_pedidoID,
       t003.t003_clienteID,
       t003.t003_data_emissao,
       t001.t001_nome,
       t001.t001_cidade,
       t001.t001_uf,
       t003.t003_vlr_total      
  FROM t003_pedidos t003
  JOIN t001_clientes t001 ON t003.t003_clienteID = t001.t001_clienteID
  
SELECT t003.t003_pedidoID,
       t003.t003_data_emissao,
       t001.t001_nome,
       t001.t001_cidade,
       t001.t001_uf,
       t002.t002_descricao,
       t004.t004_pedido_produtoID,
       t004.t004_quantidade,
       t004.t004_vlr_unitario, 
       t004.t004_vlr_total,
       t003.t003_vlr_total       
  FROM t004_pedidos_produtos t004
  JOIN t003_pedidos t003 ON t003.t003_pedidoID = t004.t003_pedidoID
  JOIN t001_clientes t001 ON t003.t003_clienteID = t001.t001_clienteID
  JOIN t002_produtos t002 ON t004.t002_produtoID = t002.t002_produtoID
  ORDER BY t004.t004_pedido_produtoID
*/