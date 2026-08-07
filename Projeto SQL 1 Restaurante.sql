/* Restaurante Beira Mar */

create database Restaurante_Beira_Mar;

use Restaurante_Beira_Mar;

desc funcionarios; 

create table funcionarios(
	id_funcionario int auto_increment primary key,
	nome varchar(255),
	cpf varchar(14),
	data_nascimento date,
	endereco varchar(255),
	telefone varchar(15),
    email varchar(100),
    cargo varchar(100),
    salario decimal(10, 2),
    data_admissao date
);

drop table if exists funcionarios;

desc clientes;

create table clientes(
	id_cliente int auto_increment primary key,
    nome varchar(255),
    cpf varchar(14),
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(15),
    email varchar(100),
    data_cadastro date
    );

drop table if exists clientes;

desc produtos;

create table produtos(
	id_produto int auto_increment primary key,
	nome varchar(255),
    descricao text,
    preco decimal(10, 2),
    categoria varchar(100)
);

drop table if exists produtos;

desc pedidos;

create table pedidos(
	id_pedido int auto_increment primary key,
    id_cliente int,
    foreign key (id_cliente) references clientes (id_cliente),
	id_funcionario int,
    foreign key (id_funcionario) references funcionarios (id_funcionario),
    id_produto int,
    foreign key (id_produto) references produtos (id_produto),
    quantidade int,
    preco decimal(10,2),
    data_pedido date,
    status varchar(50)
    );
 
drop table if exists pedidos;

desc info_produtos;

create table info_produtos(
	id_info int auto_increment primary key,
	id_produto int,
    foreign key (id_produto) references produtos (id_produto),
	ingredientes text,
    fornecedor varchar(255)
);

drop table if exists info_produtos