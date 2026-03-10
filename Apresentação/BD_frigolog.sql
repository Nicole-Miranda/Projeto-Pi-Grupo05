create database projeto;
use projeto;

/*
	Amanda Tavares
    Lucas Gama
    Nicole Miranda
    Marina Santos
    Matheus Jacob
    Pedro Ludovic
    Vitor da Luz
*/

create table usuario(
	idUsuario int primary key auto_increment,
    nomeUsuario varchar(40) default 'Admin',
    email varchar(40) not null,
    senha varchar(30) not null
);

insert into usuario (nomeUsuario, email, senha) values
('Lucas Gama', 'gama@yahoo.com', '123456'),
('Marina Santos', 'marina@gmail.com', 'abc123'),
('Pedro Ludovic', 'pedro@gmail.com', 'admin123');

-- Temperatura seria medida a cada 3 minutos com base em uma média calculada por valores do arduino a cada 10 segundos.

create table sensor(
	idSensor int primary key auto_increment,
    temperatura int,
    dtRegistro datetime,
    localSensor varchar(40),
    constraint cLocalSensor check(localSensor in('Armazenamento Inicial', 'Transporte', 'Armazenamento Final'))
);

insert into sensor (temperatura, dtRegistro, localSensor) values
(-2, '2026-02-28 08:00:00', 'Armazenamento Inicial'),
(3, '2026-02-28 12:30:00', 'Transporte'),
(0, '2026-02-28 16:45:00', 'Armazenamento Final');

create table lote(
	idLote int primary key auto_increment,
    codigo varchar(30) not null,
    valorLote decimal(5,2),
    valorProduto decimal(5,2),
    dtSaida datetime,
    dtEntrega datetime,
    qldEntrega varchar(15),
    localLote varchar(40),
    constraint qldEntregaC check(qldEntrega in('Conservado', 'Estragado')),
    constraint localLoteC check(localLote in('Transporte', 'Ponto de Venda')),
);

insert into lote (codigo, valorLote, valorProduto, dtSaida, dtEntrega, qldEntrega, localLote) values
('C001', 150.00, 15,'2026-02-27 07:00:00', '2026-02-28 15:00:00', 'Conservado', 'Ponto de Venda'),
('C002', 80.00, 8,'2026-02-27 09:30:00', '2026-02-28 18:00:00', 'Estragado', 'Transporte'),
('C003', 200.00, 20,'2026-02-27 06:15:00', '2026-02-28 14:20:00', 'Conservado', 'Ponto de Venda');

select * from usuario;

select codigo, produto, valorLote from lote
where qldEntrega = 'Estragado';

select codigo, produto, tempMedia from lote
where tempMedia > 4;

select codigo, produto, valorLote from lote
where valorLote > 100;

select * from lote
where qldentrega = 'Conservado';

select * from lote;

select temperatura, localSensor from sensor;