create database projetoTemp;
use projetoTemp;

create table distribuidora(
	idDistribuidora int primary key auto_increment,
	nome varchar(40),
	cnpj CHAR(14),
	produto varchar(30),
	estoque varchar(5)
);

create table lote(
	idLote int primary key auto_increment,
    codigo varchar(30) not null,
    produto varchar(30),
    dtSaida datetime,
    dtEstimada date,
    tempoEstimado time,
    tempMedia decimal(3,1),
    dtEntrega datetime,
    qldEntrega varchar(30),
    constraint qldEntregaC check(qldEntrega in('Bom Estado', 'Qualidade Prejudicada', 'Produto Deteriorado'))
);

create table produto(
	idProduto int primary key auto_increment,
    codigo varchar(30) not null,
    nomeProduto varchar(30),
    tempMax decimal (4,1),
    tempMin decimal (4,1)
);

create table sensor(
	idSensor int primary key auto_increment,
    tempAtual decimal (4,1),
    condicao varchar(20),
    constraint condicaoC check(condicao in ('Funcionando', 'Defeituoso'))
);
create table registroTemperatura(
	idRegistro int primary key auto_increment,
	temperatura decimal(4,1),
	dtRegistro datetime,
	localSensor varchar(50),
);