-- criar banco de dados para o cenário E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
		idClient int auto_increment primary key,
		Fname varchar(10),
		Minit char(3),
		Lname varchar(20),
		CPF char(11) not null,
		Address varchar(30),
		constraint unique_cpf_client unique (CPF)
);

-- criar tabela produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(10),
        classification_kids bool default false,
        category enum('Eletro-Eletrônico', 'Vestuario', 'Brinquedos', 'Alimentos', 'Moveis') not null,
        avaliação float default 0,
        size varchar(10)
);

-- criar tabela pagamento
create table payments(
		idclient int,
        id_payment int,
        typePayment enum('A vista', 'Parcelado'), 
        limitAvailable float,
        primary key(idClient, id_payment)
);

-- criar tabela pedido
create table orders(
		idOrder int auto_increment primary key,
        idOrderClient int,
        orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        constraint fk_orders_client foreign key(idOrderClient) references clients(idClient)
);

-- criar tabela estoque
create table productStorage(
		idProdStorage int auto_increment primary key,
        storageLocation varchar(255),
        quantity int default 0
);
-- criar tabela fornecedor
create table supplier(
		idSupplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
		idSeller int auto_increment primary key,
        SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
		idPseller int,
		idPproduct int,
		prodQuantity int default 1,
		primary key (idPseller, idPproduct),
		constraint fk_productorder_seller foreign key (idPseller) references seller(idSeller),
		constraint fk_productorder_product foreign key (idPproduct) references product(idProduct)
	);
    
create table productOrder(
		idPOproduct int,
        idPOorder int,
        poQuantity int default 1,
        poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
        constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
		idLproduct int,
        idLstorage int,
        location varchar (500) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
		constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
		idPsSupplier int,
        idPsProduct int,
        quantity int not null,
        primary key (idPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
		constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)

);

show tables;

insert into Clientes (Fname, Minit, Lname, CPF, Address)
		values('Marcio', 'S', 'Medeiros', 1234678911, 'rua 11 449, cidade nova - zona norte'),
			  ('Nonata', 'A', 'Oliveira',12299933387, 'travessa rios 139, alvorada - zona sul'),
              ('Marcarida', 'T', 'Rosas', 22233344456, ' rua flores 9, primavera - zona sul'),
              ('Fernando', 'B', 'Sousa', 44455566678, 'rua business 222, Downtow - zona norte'),
              ('Claudia', 'L', 'Almenida', 55566677789, 'alameda nova 130, cidade nova - zona norte'),
              ('Vitor', 'H', 'Americo', 66677788890, 'avenida das torres 18, P10 - zona sul');

insert into product (Pname, classification_kids, category, avaliação, size) values
					('Play Station 5', false, 'Eletro-Eletrônico', '5', null),
                    ('Urso de pelucia', true, 'Brinquedos', '3', null),
                    ('Calça jeans Female', true, 'Vestuario', '5', null),
                    ('Geladeira', false, 'Eletro-Eletrônico', '4', null),
                    ('Armario', false, 'Móveis', '3', '60x50x60'),
                    ('Macarrão', false, 'Alimentos', '2', null),
                    ('Celular', false, 'Eletro-Eletrônico', '3', null);
                    
select * from clients;
select * from product;

delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
			(1, default, 'compra via aplicativo', null, 1),
            (2, default, 'compra via aplicativo', 50, 0),
            (3, 'Confirmado', null, null, 1),
            (4, default, 'compra via web site', 150, 0);

select * from orders;

insert into productOrder (idPOorder, poQuantity, poStatus) values
			(1,5,2, null),
            (2,5,1, null),
            (3,6,1, null);

insert into productStorage (storageLocation, quantity) values
			('Manaus', 1000),
            ('Manaus', 500),
            ('São Paulo', 10),
            ('São Paulo', 100),
            ('São Paulo', 10),
            ('Manaus', 60);

insert into storageLocation (idLproduct, idLstorage, location) values
			(1,2, 'AM'),
            (2,6, 'SP');

insert into supplier (SocialName, CNPJ, contact) values
			('Barreto Ltda', 2237465440001, '92993213417'),
            ('LF Eletro-Eletronico', 1234567890211, '1188237623'),
            ('Medeiros Ind Alimenticia', 0987654000111, '9298712346');

select * from supplier;

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
			(1,1,500),
            (1,2,400),
            (2,4,633),
            (3,3,5),
            (2,5,10);

insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
			('Lomeb', null, 123456789456332, null, 'Manaus', 219567895),
            ('Navah', null,null, 987123456783, 'Manaus', 219567895),
            ('Toy toy', null, 32445643654485, null, 'Manaus', 1198657484);

select * from seller;

insert into productSeller (idPseller, idPproduct, prodQuantity) values
			(1,6,80),
            (2,7,10);
            
select * from productSeller;

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status  from clients c, orders o where c.idClient = idOrderClient;
