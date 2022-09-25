create database oficina_mecanica;
use oficina_mecanica;

-- criando tabelas e inserindo dados

drop table Clientes;
create table Clientes(
idCliente varchar(10),
Nome_cliente varchar (100) not null,
Endereço varchar (200) not null,
Bairro varchar (20),
Contato int,
idchassi_veiculo char(7),
idveiculoModelo varchar (20,)
primary key(idCliente, idchassi_veiculo));

insert into Clientes (idCliente, Nome_cliente, Endereço, Bairro, Contato, idchassi_veiculo,idveiculoModelo) values
('C1', 'Nicolas Teixeira', 'Rua 8, 10', 'Alvorada', 924884612, '1234567','Renage'),
('C2', 'Helena Maria', 'Av Boulervard, 26', 'Praça 14', 92984322356, '1122334','Corola'),
('C3', 'Eduardo Ribeiro', 'Rua Major Gabriel, 448', 'Centro', 92985642736, '2211445','Civic'),
('C4', 'Djalma Batista', 'Av Cosntatino Nery, 97', 'Chapada',9298346758 , '0099876','T-Cross'),
('C5', 'Joaquim Nabuco', 'Av Leonardo Malcher, 1200', 'Dom Pedro', 92999456787, '4657689','BMW');

drop table oficina;
create table Oficina (
idServ_Realizado_oficina char(10) not null,
idfunc_oficina char(5),
idOS_oficina char(10),
constraint fk_oficina_idServ_Realizado_oficina foreign key (idOS_oficina) references Servico_realizado (idOS_serviço),
constraint fk_equipe_funcionario foreign key (idfunc_oficina) references Funcionario (idfunc),
constraint fk_equipe_idOS foreign key (idOS_oficina) references Ordem_servico (idOS));

-- insert into Oficina (idOficina, idPlaca_carro

create table Funcionario (
idfunc_oficina char (5) primary key,
Nome_func varchar(20),
Endereco_func varchar(200));

insert into Funcionario (idfunc, Nome_func, Endereco_func) values
('F1', 'Jose Edilson', 'Travessa Americana, 30'),
('F2', 'Tereza Cristina', 'Rua 3, 450'),
('F3', 'Mario Garcia', 'Rua Verão, 12'),
('F4', 'Sebastião Barreto','Avenida Rei', '1'),
('F5', 'Leopoldina Cardinal', 'Alameda Real','1500');

drop table Ordem_servico;
create table Ordem_servico (
idOS char(10) primary key,
Conserta_carro enum ('S', 'N') not null,
Revisao_periodica enum ('S', 'N') not null,
data_emissao date not null,
data_entrega date not null,
Status_servico enum ('Em andamento', 'Finalizado', 'Atrasado') default 'Atrasado',
idEstoque_OS char(4),
idtab_referencia_OS int default 0,
idFunc_OS char(3),
idchassi_OS varchar(20),
constraint fk_ordem_idEstoque foreign key (idEstoque_OS) references Estoque (idEstoque),
constraint fk_ordem_idtab_referencia foreign key (idtab_referencia_OS) references Tabela_referencia (idtab_referencia),
constraint fk_ordem_idfunc foreign key (idfun_OS) references Funcionario (idfunc));
constraint fk_veiculo_idmodelo foreign key (idveiculoModelo) references Clientes (idveiculoModelo)
alter table Ordem_servico add constraint fk_ordem_idchassi foreign key (idchassi_OS) references Clientes (idchassi_OS);

insert into Ordem_servico (idOS, Conserta_carro, Revisao_periodica, data_emissao, data_entrega, Status_servico,
 idEstoque_OS, idtab_referencia_OS, idfunc_OS, idchassi_OS,idveiculoModelo) values
 ('OS1', 'S', 'N', '2022-06-16', '2022-08-01', 'Finalizado', 'E2', 2, 'F1', '4657689','BMW'),
 ('OS2', 'S', 'N', '2022-05-05', '2022-06-06', 'Finalizado', 'E6', 3, 'F3', '1122334','Corola'),
 ('OS3', 'N', 'S', '2022-02-17', '2022-04-10', 'Em andamento', default, 5, 'F3', '0099876','T-Cross'),
 ('OS4', 'S', 'N', '2022-08-12', '2022-10-13', default, 'E3', 4, 'F4', '1234567','Renage'),
 ('OS5', 'N', 'S', '2022-05-23', '2022-07-01', default, default, 5, 'F4', '2211445','Civic');
   

create table Tabela_referencia (
idtab_referencia int primary key,
Valor_mao_de_obra decimal not null);

insert into Tabela_referencia (idtab_referencia, Valor_mao_de_obra) values
(1, 220.00),
(2, 3300.00),
(3, 550.50),
(4, 1100.20),
(5, 100.00);

create table Estoque (
idEstoque char(4) primary key,
Quantidade int not null,
Valor_peca decimal(10,2) not null);

alter table Estoque modify Valor_peca decimal(10,2) default '0';

insert into Estoque (idEstoque, Quantidade, Valor_peca) values
('E1', 1000, 120.00),
('E2', 36, 32.00),
('E3', 550, 80.00),
('E4', 10, 930.00),
('E5', 51, 300.00),
('E6', 2000, 25.00),
('E7', 220, 61.00);

create table Servico_realizado (
idOS_servico char (10) not null,
Servico_aprovado enum ('Sim', 'Não') not null,
idClientes_servico varchar(20) not null,
constraint fk_Servico_realizado_OS foreign key (idOS_serviço) references Ordem_servico (idOS),
constraint fk_Servico_idClientes foreign key (idClientes_servico) references Clientes (idCliente));

insert into Servico_realizado (idOS_servico, Servico_aprovado, idClientes_servico) values
('OS1', 'Sim', 'C2'),
('OS2', 'Não', 'C4'),
('OS5', 'Sim', 'C1'),
('OS3', 'Sim', 'C5'),
('OS4', 'Sim', 'C3');

-- mostrar tabelas

desc Clientes;
select *from Clientes;
select *from Oficina;
desc Funcionario;
select *from Funcionario;
select *from Ordem_servico;
select *from Tabela_referencia;
select *from Estoque;
select *from Servico_realizado;

-- recuperando informações simples

select * from Clientes, Ordem_servico where idPlaca_carro = idPlaca_OS;

-- Andamento de cada serviço realizado
select Nome_funcionario, Endereco_funcionario, o.data_entrega, o.Status_servico from Funcionario as m, Ordem_servico o 
where idfunc = idfunc_OS;

-- Servico foi realizado?

select *from Servico_realizado, Clientes where idClientes_servico = idCliente;

-- Soma dos serviços de revisão periódica

select Revisao_periodica, sum(Valor_mao_de_obra) as valor_total  from Ordem_servico as o, Tabela_referencia as t 
where idtab_referencia_OS = idtab_referencia and Revisao_periodica = 'S';

-- Soma dos serviços de conserto

select Conserta_carro, sum(Valor_mao_de_obra) as valor_total  from Ordem_servico as o, Tabela_referencia as t 
where idtab_referencia_OS = idtab_referencia and Conserta_carro = 'S';

select Conserta_carro, Valor_mao_de_obra from Ordem_servico as o, Tabela_referencia as t 
where idtab_referencia_OS = idtab_referencia and Conserta_carro = 'S';

-- Serificando os carros que foram feitas apenas revisão

select Revisao_periodica, Status_servico,  idPlaca_OS, Valor_mao_de_obra from Ordem_servico as o, Tabela_referencia as t 
where idtab_referencia_OS = idtab_referencia and Revisao_periodica = 'S';

-- Verificando quantos serviços foram feitos por cada mecânico

select count(*) as total_servicos, idMecanico_OS, sum(Valor_mao_de_obra) as valor_total from Ordem_servico as o, Tabela_referencia as t 
where idtab_referencia_OS = idtab_referencia 
group by idMecanico_OS;

-- Recuperando o nome de cada mecânico por serviço e valor

select count(*) as total_servicos, idMecanico_OS, sum(Valor_mao_de_obra) as valor_total,  Nome_mecanico from Mecanico as m, Ordem_servico as o, Tabela_referencia as t 
where idtab_referencia_OS = idtab_referencia and idMecanico = idMecanico_OS
group by idMecanico_OS;

-- Aplicando aumento na revisão periódica e peças

update Tabela_referencia set Valor_mao_de_obra = 
case 
when idtab_referencia = 1 then Valor_mao_de_obra + 60.00
when idtab_referencia = 5 then Valor_mao_de_obra + 30.00
else Valor_mao_de_obra + 0
end;

select idtab_referencia, round(Valor_mao_de_obra, 2) from Tabela_referencia;

-- Verificando cliente que aprovaram o serviço

select Nome_cliente, Contato, idchassi_veiculo,  Servico_aprovado from Clientes c
inner join Servico_realizado s on idCliente = idClientes_servico;

-- Verificando cliente que aprovaram o serviço

select Nome_cliente, Contato, idchassi_veiculo,  Servico_aprovado from Clientes c
inner join Servico_realizado s on idCliente = idClientes_servico
inner join Ordem_servico o on idchassi_veiculo = idchassi_OS
order by Nome_cliente;

-- Verificando Status de serviço po carro

select idPlaca_OS, Status_servico from Ordem_servico os
inner join Tabela_referencia t on  idtab_referencia = idtab_referencia_OS;

--
select * from Servico_realizado
inner join Ordem_servico on idOS_serviço = idOS
inner join Clientes on idCliente = idClientes_servico;

-- verificando estoque e tabela de referência utilizada

select c.Nome_cliente, c.idPlaca_carro, sr.Servico_aprovado, os.Status_servico, os.idEstoque_OS, os.idtab_referencia_OS  from  Servico_realizado sr
inner join Ordem_servico os on idOS_serviço = os.idOS
inner join Clientes c on c.idCliente = sr.idClientes_servico;

-- verificar quanto cada cliente irá pagar

select o.idPlaca_OS, e.Valor_peca, tr.Valor_mao_de_obra from Ordem_servico o
left outer join Estoque e on o.idEstoque_OS = e.idEstoque
inner join Tabela_referencia tr on o.idtab_referencia_OS = tr.idtab_referencia;