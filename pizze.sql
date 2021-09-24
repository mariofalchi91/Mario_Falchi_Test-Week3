--Esercitazione
--Il sig. Luigi ha commissionato la creazione di un database che possa tenere traccia di tutte
--le pizze che vengono riportate nel suo menù.
--In particolare ogni
--pizza deve essere identificata da un codice, dal nome e dal prezzo.
--Ogni pizza può contenere uno o più
--ingredienti caratterizzati da codice, nome, costo e
--scorte in magazzino.
--Deve essere possibile tenere traccia delle composizioni delle pizze.
--Impostare i seguenti controlli:
--Il prezzo della pizza, il costo dell’ingrediente (> 0). Le scorte in magazzino invece devono
--essere >=0.

create database Pizze

create table Pizza(
IdPizza int identity (1,1) not null,
Nome varchar(40) not null,
Prezzo decimal(4,2) not null,
constraint pkpizza primary key (IdPizza),
check (Prezzo>0)
)

--alter table Pizza alter column Prezzo decimal(4,2) not null 

create table Ingrediente(
IdIngrediente int identity (1,1) not null,
Nome varchar(40),
Prezzo decimal(4,2) not null,
Scorta int not null,
constraint pkingrediente primary key (IdIngrediente),
check (Prezzo>0),
check (Scorta>=0)
)

create table PizzaIngrediente(
IdPizza int,
IdIngrediente int,
constraint fkingrediente foreign key (IdIngrediente) references Ingrediente(IdIngrediente),
constraint fkpizza foreign key (IdPizza) references Pizza(IdPizza)
)

insert into Ingrediente values ('Pomodoro',1,1)
insert into Ingrediente values ('Mozzarella',1,1)
insert into Ingrediente values ('Mozzarella di bufala',1,1)
insert into Ingrediente values ('Spianata piccante',1,1)
insert into Ingrediente values ('Funghi',1,1)
insert into Ingrediente values ('Carciofi',1,1)
insert into Ingrediente values ('Prosciuto cotto',1,1)
insert into Ingrediente values ('Olive',1,1)
insert into Ingrediente values ('Funghi Porcini',1,1)
insert into Ingrediente values ('Stracchino',1,1)
insert into Ingrediente values ('Speck',1,1)
insert into Ingrediente values ('Rucola',1,1)
insert into Ingrediente values ('Grana',1,1)
insert into Ingrediente values ('Verdure di stagione',1,1)
insert into Ingrediente values ('Patate',1,1)
insert into Ingrediente values ('Salsiccia',1,1)
insert into Ingrediente values ('Pomodorini',1,1)
insert into Ingrediente values ('Ricotta',1,1)
insert into Ingrediente values ('Provola',1,1)
insert into Ingrediente values ('Gorgonzola',1,1)
insert into Ingrediente values ('Pomodoro fresco',1,1)
insert into Ingrediente values ('Basilico',1,1)
insert into Ingrediente values ('Bresaola',1,1)

--verifico gli ingredienti
select *
from Ingrediente

insert into Pizza values ('Margherita', 5)
insert into Pizza values ('Bufala',7)
insert into Pizza values ('Diavola',6)
insert into Pizza values ('Quattro stagioni',6.5)
insert into Pizza values ('Porcini',7)
insert into Pizza values ('Dioniso',8)
insert into Pizza values ('Ortolana',8)
insert into Pizza values ('Patate e salsiccia',6)
insert into Pizza values ('Pomodorini',6)
insert into Pizza values ('Quattro formaggi',7.5)
insert into Pizza values ('Caprese',7.5)
insert into Pizza values ('Zeus',7.5)

--verifico pizze
select *
from Pizza

execute AssegnaIngredienteAPizza @npizza='Margherita', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Margherita', @ningr='Mozzarella';

execute AssegnaIngredienteAPizza @npizza='Bufala', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Bufala', @ningr='Mozzarella di bufala';

execute AssegnaIngredienteAPizza @npizza='Diavola', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Diavola', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Diavola', @ningr='Spianata piccante';

execute AssegnaIngredienteAPizza @npizza='Quattro stagioni', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Quattro stagioni', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Quattro stagioni', @ningr='Funghi';
execute AssegnaIngredienteAPizza @npizza='Quattro stagioni', @ningr='Carciofi';
execute AssegnaIngredienteAPizza @npizza='Quattro stagioni', @ningr='Prosciuto cotto';
execute AssegnaIngredienteAPizza @npizza='Quattro stagioni', @ningr='Olive';

execute AssegnaIngredienteAPizza @npizza='Porcini', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Porcini', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Porcini', @ningr='Funghi Porcini';

execute AssegnaIngredienteAPizza @npizza='Dioniso', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Dioniso', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Dioniso', @ningr='Stracchino';
execute AssegnaIngredienteAPizza @npizza='Dioniso', @ningr='Speck';
execute AssegnaIngredienteAPizza @npizza='Dioniso', @ningr='Rucola';
execute AssegnaIngredienteAPizza @npizza='Dioniso', @ningr='Grana';

execute AssegnaIngredienteAPizza @npizza='Ortolana', @ningr='Pomodoro';
execute AssegnaIngredienteAPizza @npizza='Ortolana', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Ortolana', @ningr='Verdure di stagione';

execute AssegnaIngredienteAPizza @npizza='Patate e salsiccia', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Patate e salsiccia', @ningr='Patate';
execute AssegnaIngredienteAPizza @npizza='Patate e salsiccia', @ningr='Salsiccia';

execute AssegnaIngredienteAPizza @npizza='Pomodorini', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Pomodorini', @ningr='Pomodorini';
execute AssegnaIngredienteAPizza @npizza='Pomodorini', @ningr='Ricotta';

execute AssegnaIngredienteAPizza @npizza='Quattro formaggi', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Quattro formaggi', @ningr='Provola';
execute AssegnaIngredienteAPizza @npizza='Quattro formaggi', @ningr='Gorgonzola';
execute AssegnaIngredienteAPizza @npizza='Quattro formaggi', @ningr='Grana';

execute AssegnaIngredienteAPizza @npizza='Caprese', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Caprese', @ningr='Pomodoro fresco';
execute AssegnaIngredienteAPizza @npizza='Caprese', @ningr='Basilico';

execute AssegnaIngredienteAPizza @npizza='Zeus', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Zeus', @ningr='Bresaola';
execute AssegnaIngredienteAPizza @npizza='Zeus', @ningr='Rucola';

--verifico tabella pizzaingrediente
select *
from PizzaIngrediente

--questa è una specie di vista con tutte le pizze con i loro ingredienti
select p.IdPizza, p.Nome, p.Prezzo, i.IdIngrediente, i.Nome
from Pizza p
	join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
	join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente


--Si implementino le seguenti query
--1.Estrarre tutte le pizza con prezzo superiore a 6 euro

select *
from Pizza
where Prezzo>6.00

--2.Estrarre la pizza più costosa

select *
from Pizza
where Prezzo=(select max(p.Prezzo)
				from Pizza p)

--3.Estrarre le pizze «bianche»

select p.Nome
from Pizza p
where p.Nome not in (select p.Nome
						from Pizza p
							join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
							join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
						where i.Nome='Pomodoro')

--4.Estrarre le pizze che contengono funghi (di qualsiasi tipo)

select p.Nome
from Pizza p
	join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
	join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
where i.Nome like 'Funghi%'

--Implementare sul DB appena costruito le seguenti procedure
--1.Inserimento di una nuova pizza (parametri: nome, prezzo)

create procedure InserisciPizza
@nome varchar(40),
@prezzo decimal(4,2)
as
	insert into Pizza values (@nome, @prezzo)
go

execute InserisciPizza @nome='Pizza pazza', @prezzo=11.5

select*
from Pizza

--2.Assegnazione di un ingrediente a una pizza (parametri: nome pizza, nome ingrediente)

create procedure AssegnaIngredienteAPizza
@npizza varchar (40),
@ningr varchar (40)
as
begin
	begin try
		insert into PizzaIngrediente values ((select p.IdPizza
												from Pizza p
												where p.Nome=@npizza),
												(select i.IdIngrediente
												from Ingrediente i
												where i.Nome=@ningr))
	end try
	begin catch
		select error_message()
	end catch
end
go

execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Mozzarella';
execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Spianata piccante';
execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Funghi';
execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Olive';
execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Salsiccia';
execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Carciofi';
execute AssegnaIngredienteAPizza @npizza='Pizza pazza', @ningr='Gorgonzola';

--3.Aggiornamento del prezzo di una pizza (parametri: nome e nuovo prezzo)

create procedure AggiornaPrezzoPizza
@nome varchar(40),
@prezzo decimal(4,2)
as
begin
	begin try
		update Pizza set Prezzo=@prezzo where IdPizza=(select IdPizza
														from Pizza
														where Nome=@nome)
	end try
	begin catch
		select error_message()
	end catch
end
go

execute AggiornaPrezzoPizza @nome='Pizza pazza', @prezzo=9.75

--4.Eliminazione di un ingrediente da una pizza (parametri: nome pizza, nome ingrediente)

create procedure EliminaIngredienteAPizza
@npizza varchar (40),
@ningr varchar (40)
as
begin
	begin try
		delete from PizzaIngrediente 
		where PizzaIngrediente.IdPizza=(select IdPizza
										from Pizza
										where Nome=@npizza)
		and PizzaIngrediente.IdIngrediente=(select IdIngrediente
											from Ingrediente
											where Nome=@ningr)
	end try
	begin catch
		select error_message()
	end catch
end
go

--5.Incremento del 10% del prezzo delle pizze contenenti un ingrediente (parametro: nome ingrediente)

create procedure IncrementoPizzaIngrediente
@nome varchar(40)
as
begin
	begin try
		update Pizza set Prezzo=Prezzo*1.1 
		where IdPizza in (select p.IdPizza
							from Pizza p
								join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
								join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
							where i.Nome=@nome)
	end try
	begin catch
		select error_message()
	end catch
end
go

--Si implementino le seguenti funzioni
--1.Tabella listino pizze ( prezzo) ordinato alfabeticamente (parametri nessuno)

create function ListinoOrdinato()
returns table
as
return (select top 100 Nome, Prezzo 
		from Pizza
		order by Nome)

select *
from ListinoOrdinato()

--2.Tabella listino pizze ( prezzo) contenenti un ingrediente (parametri nome ingrediente)

create function PizzeCon (@ingr varchar(40)) returns table
as return (select p.Nome, p.Prezzo
			from Pizza p
				join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
				join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
			where i.Nome=@ingr)

select *
from PizzeCon('Salsiccia')

--3.Tabella listino pizze ( prezzo) che non contengono un certo ingrediente (parametri nome ingrediente)

create function PizzeSenza (@ingr varchar(40)) returns table
as return (select p.Nome, p.Prezzo
			from Pizza p
			where p.Nome not in (select p.Nome
									from Pizza p
										join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
										join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
									where i.Nome=@ingr))

select *
from PizzeSenza('Salsiccia')

--4.Calcolo numero pizze contenenti un ingrediente (parametri nome ingrediente)

create function ContaPizzeCon(@ingr varchar(40)) returns int
as begin 
declare @out int
select @out = count(p.IdPizza)
from Pizza p
	join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
	join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
where i.Nome=@ingr
return @out
end

select dbo.ContaPizzeCon('Pomodoro')
go

--5.Calcolo numero pizze che non contengono un ingrediente (parametri codice ingrediente)

create function ContaPizzeSenza(@ingr varchar(40)) returns int
as begin
declare @out int
select @out = count(p.Nome)
from Pizza p
where p.Nome not in (select p.Nome
						from Pizza p
							join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
							join Ingrediente i on i.IdIngrediente=p_i.IdIngrediente
						where i.Nome=@ingr)
return @out
end

select dbo.ContaPizzeSenza('Pomodoro')
go

--6.Calcolo numero ingredienti contenuti in una pizza (parametri nome pizza)

create function ContaIngredientiPizza(@nome varchar(40)) returns int
as begin
declare @out int
select @out = count(*)
from Pizza p
	join PizzaIngrediente p_i on p.IdPizza=p_i.IdPizza
where p.Nome=@nome
return @out
end

select dbo.ContaIngredientiPizza('Bufala')
go

--Realizzare una view che rappresenta il menù con tutte le pizze

create view Listino1(Nome,Prezzo)as(
select Nome, Prezzo
from Pizza
)

select *
from Listino1

--questa non funziona
--create view Listino2(Nome, Prezzo ,Ingredienti) as (
--select p.Nome, p.Prezzo, STUFF((SELECT ',' + CAST(i.Nome AS VARCHAR(40)) AS [text()]
--							FROM PizzaIngrediente p_i
--								join Ingrediente i on p_i.IdIngrediente=i.IdIngrediente
--							WHERE p.IdPizza=p_i.IdPizza
--							FOR XML PATH('')), 1, 1, NULL) AS ingredienti
--from Pizza p
--)