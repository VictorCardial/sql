use db_biblioteca

sp_helpdb db_biblioteca

--CRIANDO TABELAS

create table tbl_livro(
id_livro smallint primary key identity(100,1),
nome_livro varchar(50) not null,
isbn varchar(30) not null unique,
id_autor smallint not null,
data_pub datetime not null,
preco_livro money not null)

create table tbl_autores(
id_autor smallint primary key,
nome_autor varchar(50),
sobrenome_autor varchar(60))

create table tbl_editora(
id_editora smallint primary key identity,
nome_editora varchar(50) not null)

sp_help tbl_livro

/*create table test(
valor smallint primary key identity(5,2))

alter table test add texto varchar(5)

select * from test

insert into test values ('a'),('b'),('c')

insert into test values (11,'d'),(13,'f')

drop table test

NÃO FUNCIONA PASSAR OS VALORES MANUALMENTE PARA COLUNAS IDENTITY E É SÓ UMA POR TABELA*/

--ALTERANDO TABELAS E CONSTRAINTS

alter table tbl_livro drop column id_autor

alter table tbl_livro add id_autor smallint not null
constraint fk_id_autor foreign key (id_autor) references tbl_autores(id_autor)

alter table tbl_livro add id_editora smallint not null
constraint fk_id_editora foreign key (id_editora) references tbl_editora(id_editora)

select * from tbl_livro

alter table tbl_livro
alter column id_autor varchar(5)

alter table tbl_livro
drop constraint fk_id_autor

alter table tbl_livro
add constraint PK__tbl_livr__C252147DA8CA9930 primary key (id_livro)

alter table tbl_livro
drop column id_autor

--INSERINDO DADOS

insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (1,'Daniel','Barret')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (2,'Gerald','Carter')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (3,'Mark','Sobell')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (4,'William','Stanek')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (5,'Richard','Blum')

insert into tbl_editora (nome_editora) values ('Prentice Hall')
insert into tbl_editora (nome_editora) values ('O Reilly')
insert into tbl_editora (nome_editora) values ('Microsoft Press')
insert into tbl_editora (nome_editora) values ('Wiley')

insert into tbl_livro (nome_livro,isbn, data_pub,preco_livro,id_autor, id_editora)
values ('Linux Command Line and Shell Scripting', 143856969,'20091221',68.35,5,4)

insert into tbl_livro (nome_livro,isbn, data_pub,preco_livro,id_autor, id_editora)
values ('SSH, the Secure Shell', 127658789,'20091221',58.30,1,2)

insert into tbl_livro (nome_livro,isbn, data_pub,preco_livro,id_autor, id_editora)
values ('Using Samba', 123856789,'20001221',61.45,2,2)

insert into tbl_livro (nome_livro,isbn, data_pub,preco_livro,id_autor, id_editora)
values ('Fedora and Red Hat Linux', 123346789,'20101101',62.24,3,1)

insert into tbl_livro (nome_livro,isbn, data_pub,preco_livro,id_autor, id_editora)
values ('Windows Server 2012 Inside Out', 123355789,'20040517',66.80,4,3)

insert into tbl_livro (nome_livro,isbn, data_pub,preco_livro,id_autor, id_editora)
values ('Microsoft Exchange Server 2010', 123366789,'20001221',45.30,4,3)


-- SELECT E COUNT

select * from tbl_editora

select * from tbl_autores

select * from tbl_livro

select count(*) from tbl_editora

--TRUNCATE TABLE

/*create table nadacomnada(
valores int)

insert into nadacomnada values (1),(2),(3),(4)

select * from nadacomnada

truncate table nadacomnada

drop table nadacomanada*/

--MAIS SELECTS

select nome_autor from tbl_autores

select * from tbl_autores

select nome_livro from tbl_livro

select count(nome_livro) from tbl_livro

select count(*) from tbl_livro

select nome_livro, data_pub, preco_livro, (select count (*) from tbl_livro ) as contador from tbl_livro

--ORDER BY  (ASC / DESC)

select nome_livro, isbn from tbl_livro order by nome_livro 

select nome_livro, isbn from tbl_livro order by nome_livro asc

select nome_livro, isbn from tbl_livro order by nome_livro desc

select nome_livro, id_autor from tbl_livro order by id_autor

select nome_livro, id_autor from tbl_livro order by id_autor desc

select nome_autor, sobrenome_autor as nomecompleto from tbl_autores

select nome_livro, id_autor from tbl_livro order by id_autor asc, nome_livro desc --uma droga

select nome_autor from tbl_autores order by nome_autor desc

--DISTINCT 

select * from tbl_livro

select * from tbl_autores

select id_autor from tbl_livro

select distinct id_autor from tbl_livro --id_autor 4 aparece duas vezes na tabela tbl_livro

--WHERE

select nome_autor, sobrenome_autor from tbl_autores where id_autor =4

select id_autor from tbl_autores where nome_autor='William'

select nome_livro from tbl_livro where id_autor =4

select * from tbl_livro where id_autor = 4

--AND / OR

select nome_livro from tbl_livro where id_autor >=3 and id_autor <=4

select nome_livro from tbl_livro where id_autor =3 and id_autor =4 -- não retorna nada devido a condição

select nome_autor, id_autor from tbl_autores where id_autor > 2 and id_autor <5

select nome_autor, id_autor from tbl_autores where id_autor > 2 or id_autor <5 --retorna tudo pela condição

select * from tbl_autores

--UPDATE

/*create table produto(
nome varchar(10),
preco money)

insert into produto values('danone',25.75),('bolacha',15.50),('biscoito',0.0),('rapadura',30),('miojo',10)

select * from produto

update produto set preco = 10.25 where nome ='biscoito'

update produto set preco =15000 where preco = 10

update produto set preco =0 --sem where

drop table produto*/


/*create table produto(
nome varchar(10),
preco money)

insert into produto values('danone',25.75),('bolacha',15.50),('biscoito',0.0),('rapadura',30),('miojo',10)

select * from produto

update produto set preco = 9.99, nome = 'biscoito' where nome = 'bixcoito'

update produto set preco = 9.99 where nome = 'biscoito' or  nome = 'bolacha'

truncate table produto

drop table produto*/

update tbl_livro set preco_livro = 65.45 where id_livro = 102

select * from tbl_livro

select nome_livro from tbl_livro where id_livro =102

select * from tbl_autores

update tbl_autores set sobrenome_autor='Cartman' where id_autor=2

update tbl_livro set preco_livro=80 , isbn = '02020202' where id_livro = 101

--TOP (NUMBER / PERCENT)

select count(*) from tbl_livro

select top 3 * from tbl_livro

select top 33 percent * from tbl_livro

select top 3 id_livro, nome_livro from tbl_livro

select top 33 percent id_livro, nome_livro, isbn from tbl_livro

select top 10 * from tbl_livro

-- ALIAS (AS)

select nome_livro as LIVRO, id_autor as AUTOR, data_pub as 'DATA DE PUBLICAÇÃO', preco_livro as PREÇO from tbl_livro

--UNION (all) ordem dos campos e tipos de dados importa

select * from tbl_livro

select * from tbl_autores

select id_autor from tbl_livro union select id_autor from tbl_autores

select id_autor from tbl_autores union select id_autor from tbl_livro --junta sem repetições

select id_autor from tbl_autores union all select id_autor from tbl_livro -- com as repetições

select nome_autor from tbl_autores union select nome_livro from tbl_livro

select nome_autor from tbl_autores union all select nome_livro from tbl_livro

--tabelas de produtos (varios tipos)

create table produtos_bebida(
nome varchar(10))

create table produtos_limpeza(
nome varchar(10))

insert into produtos_bebida values ('bebida A'),('bebida B'),('bebida C'),('bebida D')
insert into produtos_limpeza values ('limpeza A'),('limpeza B'),('limpeza C'),('limpeza D')

select * from produtos_bebida
select * from produtos_limpeza

select * from produtos_bebida union select * from produtos_limpeza

select * from produtos_bebida union all select * from produtos_limpeza

drop table produtos_bebida
drop table produtos_limpeza

--SELECT INTO

--seleciona os dados de uma ou mais tabelas e os insere em uma tabela diferente
--da para criar copias de backup de tabelas

--select (colunas) into (nova tabelas) from (tabela atual)

select * from tbl_livro

select nome_livro, isbn into LIVRO_ISBN from tbl_livro where id_livro >102

select * from LIVRO_ISBN

drop table LIVRO_ISBN

select * into tabela_livro_backup from tbl_livro

select * from tabela_livro_backup

select * from tbl_livro

drop table tabela_livro_backup

--MIN MAX AVG SUM COUNT

select * from tbl_livro

select count(*) from tbl_livro

select max(preco_livro) from tbl_livro

select min(preco_livro) from tbl_livro

select avg(preco_livro) from tbl_livro

select sum(preco_livro) from tbl_livro

/*select (68.35
+80.00
+65.45
+62.24
+66.80
+45.30)*/

/*select (68.35
+80.00
+65.45
+62.24
+66.80
+45.30) / 6*/

select * from tbl_livro
select sum(id_livro) from tbl_livro

select * from tbl_livro
select count(*) from tbl_livro

select * from tbl_livro
select max(nome_livro) from tbl_livro

select * from tbl_livro
select min(nome_livro) from tbl_livro

select * from tbl_livro
select avg(nome_livro) from tbl_livro --media com letra =\

select * from tbl_livro
select avg(id_livro) from tbl_livro

select avg(id_autor) from tbl_livro
select (5+1+2+3+4+4)/6

select count(id_livro) from tbl_livro
select count(*) from tbl_livro

select count(id_autor) from tbl_autores


/*			coluna 1	coluna 2	coluna 3
linha 1		x			x			x
linha 2		x			x			null		
linha 3		x			null		x

			3			2			2		*/

select avg(preco_livro) as 'preco medio' from tbl_livro

--BETWEEN

select * from tbl_livro

select id_livro, nome_livro, preco_livro from tbl_livro where id_livro between 101 and 104

select * from tbl_livro order by data_pub

select * from tbl_livro where data_pub between '20040517' and '20100517'

select * from tbl_livro order by preco_livro

select nome_livro as livro, preco_livro as preço from tbl_livro where preco_livro between 40 and 60

select nome_livro from tbl_livro

select nome_livro from tbl_livro where nome_livro between 'l' and 'o'


--LIKE / NOT LIKE  % _ [] [^]

select nome_livro from tbl_livro where nome_livro like 's%'

select nome_livro from tbl_livro where nome_livro like '%g'

select nome_livro from tbl_livro where nome_livro like '%se%'

--pegando os registros que tem i na segunda letra 

select nome_livro from tbl_livro where nome_livro like '_i%'

--todos os registros que começam com letra S OU L

select nome_livro from tbl_livro where nome_livro like '[sl]%'

select nome_livro from tbl_livro where nome_livro like '%[gl]' --terminam com g ou l

select nome_livro from tbl_livro where nome_livro like '%[gl]_' --tudo o que a penultima letra seja g ou l

--segunda letra é I ou S

select nome_livro from tbl_livro where nome_livro like '_[is]%'

-- segunda letra é I e a quinta é letra O

select nome_livro from tbl_livro where nome_livro like '_i__o%'

--tudo o que NÃO começa com a letra M

select nome_livro from tbl_livro where nome_livro not like 'm%'


--JOINS E INNER JOIN

--juntar duas ou mais tabelas baseado em um relacionamento entre colunas dessas tabelas

--nomes dos livros e respectivos autores

select nome_livro, nome_autor,sobrenome_autor from tbl_livro l
join tbl_autores a on l.id_autor = a.id_autor

--joins

--inner join: retorna linhas quando houver pelo menos uma correspondencia entre ambas as tabelas

--outer join: retorna linhas mesmo quando não houver pelo menos uma correspondencia em uma das tabelas (ou ambas)
--O outer join se divide em: left join, right join e full join

/*create table produto(
nome varchar(8),
id_fornecedor smallint)

alter table produto
add constraint fk_produto_forn foreign key (id_fornecedor)  references fornecedor(id_fornecedor)

select * from produto

alter table produto add id_produto smallint primary key

alter table produto drop column id_fornecedor

alter table produto add id_fornecedor smallint

create table fornecedor(
id_fornecedor smallint primary key,
nomeforn varchar(8))

sp_help produto

insert into fornecedor values (1,'A'),(2,'B')

insert into produto values ('prodA',1,1),('prodB',2,1),('prodC',3,1)

select * from fornecedor

select * from produto

select * from produto p
join fornecedor f on p.id_fornecedor= f.id_fornecedor

drop table fornecedor
drop table produto*/

select * from tbl_livro
inner join tbl_autores on tbl_livro.id_autor = tbl_autores.id_autor

select * from tbl_livro
join tbl_autores on tbl_livro.id_autor = tbl_autores.id_autor --same thing

select l.nome_livro, a.nome_autor from tbl_livro as l
inner join tbl_autores as a on l.id_autor = a.id_autor

select * from tbl_editora

select * from tbl_livro as l
inner join tbl_editora as e on l.id_editora=e.id_editora

select l.nome_livro as 'nome do livro', e.nome_editora as editora from tbl_livro as l
inner join tbl_editora as e on l.id_editora=e.id_editora

--inner join é a intersecção de conjunto: o que tem em A e B ao mesmo tempo.

--OUTER JOINS (LEFT JOIN / RIGHT JOIN / FULL JOIN)

create table fornecedor(
id_fornecedor smallint primary key,
nomeforn varchar(8))

create table produto(
nome varchar(8),
id_fornecedor smallint)

alter table produto
add constraint fk_produto_forn foreign key (id_fornecedor)  references fornecedor(id_fornecedor)

insert into fornecedor values (1,'A'),(2,'B')

insert into produto values ('prodA',1),('prodB',1),('prodC',1)

/*sp_help produto

select * from fornecedor

select * from produto

select * from produto p
join fornecedor f on p.id_fornecedor = f.id_fornecedor

select p.nome, p.id_fornecedor, f.nomeforn from produto p
join fornecedor f on p.id_fornecedor = f.id_fornecedor */

select * from fornecedor f
join produto p on f.id_fornecedor=p.id_fornecedor

select * from fornecedor f
left join produto p on f.id_fornecedor=p.id_fornecedor		--left outer join

select * from produto p
right join fornecedor f on f.id_fornecedor=p.id_fornecedor

select * from produto p
right outer join fornecedor f on f.id_fornecedor=p.id_fornecedor --right outer join-mesma coisa, só sintaxe

--LEFT JOIN EXCLUINDO A INTERSECÇÃO (SÓ TRAZENDO A TABELA A ESQUERDA) excluindo a correspondencia

select * from fornecedor f
left join produto p on f.id_fornecedor=p.id_fornecedor and p.id_fornecedor is null

select * from fornecedor f
left join produto p on p.id_fornecedor is null

select * from fornecedor f
left join produto p on f.id_fornecedor=p.id_fornecedor

select * from fornecedor f
left join produto p on f.id_fornecedor=p.id_fornecedor where p.id_fornecedor is null --coisa linda (somente os dados da esquerda)

select * from produto p
right join fornecedor f on p.id_fornecedor = f.id_fornecedor

select * from produto p
right join fornecedor f on p.id_fornecedor = f.id_fornecedor where p.id_fornecedor is null

select * from produto

insert into produto (nome) values ('prodD')

select * from produto p 
left join fornecedor f on p.id_fornecedor = f.id_fornecedor

select * from produto p 
left join fornecedor f on p.id_fornecedor = f.id_fornecedor where f.id_fornecedor is null

select * from fornecedor f
right join produto p on p.id_fornecedor = f.id_fornecedor 

select * from fornecedor f
right join produto p on p.id_fornecedor = f.id_fornecedor where f.id_fornecedor is null

select * from fornecedor f
right join produto p on p.id_fornecedor is null -- explica aí o mistério

--full outer join - retorna todos os registros com correspondencia e em ambas as tabelas e os sem correspondencia em ambas as tabelas
--literalmete tudo tipi full '-'

select * from produto p
full join fornecedor f on p.id_fornecedor = f.id_fornecedor --coisa linda

select * from produto p
full join fornecedor f on p.id_fornecedor = f.id_fornecedor where p.id_fornecedor is null or f.id_fornecedor is null --excluindo a intersecção, só retorna
--os exclusivos de cada tabela

drop table produto
drop table fornecedor

--retorna true ou false

--test table unique

/*create table testunique(
campo smallint unique)

insert into testunique values (null),(null),(2)

insert into testunique values (null),(1),(2)

delete from testunique where campo=1

alter table testunique add valor smallint

select * from testunique

update testunique set valor =2 where campo=2

update testunique set valor =2 where campo=null

update testunique set valor =2

delete from testunique where valor=2

insert into testunique (campo,valor) values (null,1),(1,2),(2,3)

select * from testunique

update testunique set campo =0 where valor =1 

insert into testunique (campo,valor) values (3,1)

drop table testunique

CONCLUSÃO UNIQUE ACEITA 1 NULO*/


-- IN / NOT IN

select * from tbl_livro where id_autor in (1,4)

select * from tbl_livro where id_autor in (1,2,4)

select * from tbl_livro where id_autor in (1,4,5000)

select * from tbl_livro

select * from tbl_livro where id_autor in (1,4,5000)

select * from tbl_livro where id_autor not in (1,4,5000)


--CAMPOS CALCULADOS (de maneira autonoma, realiza calculos e insere nas tabelas)

--tabuada (implementar)

create table estoque(
nome varchar(10),
preco smallint,
quantidade smallint,
valor as preco * quantidade)

sp_help estoque

insert into estoque values ('produtoA',5,15),('produtoB',2,10),('produtoC',7,7)

select * from estoque

select sum(valor) as 'valor total do estoque' from estoque

drop table estoque

--nada com nada

create table fornecedor(
fornid smallint primary key identity,
fornnome varchar(10))

create table produto(
prodnome varchar(10),
fornid smallint foreign key references fornecedor(fornid)
)

sp_help produto

insert into fornecedor values('A'),('B'),('C')

insert into produto values ('prodA',1),('prodB',1),('prodC',2)

select * from fornecedor
select * from produto

select * from fornecedor f
left join produto p on f.fornid=p.fornid

select * from fornecedor f
left join produto p on f.fornid=p.fornid where p.fornid is null		--got it

select * from fornecedor f
left join produto p on f.fornid=p.fornid where f.fornid is null

insert into produto (prodnome) values ('prod D')

alter table produto drop constraint FK__produto__fornid__6E01572D

alter table produto add constraint fk_prod_forn foreign key (fornid) references fornecedor(fornid)


select * from fornecedor
select * from produto

select * from fornecedor f
full outer join produto p on f.fornid=p.fornid where p.fornid is null or f.fornid is null		--full outer pegando o que não tem em comum (excluindo a intersecção)

--
select * from fornecedor
select * from produto

select * from produto
join fornecedor on produto.fornid = fornecedor.fornid

select * from produto p
left join fornecedor f on p.fornid = f.fornid

select * from produto p
right join fornecedor f on p.fornid = f.fornid

select * from produto p
full outer join fornecedor f on p.fornid = f.fornid

select * from produto p
full outer join fornecedor f on p.fornid = f.fornid where p.fornid is null or f.fornid is null

select * from produto p
right outer join fornecedor f on p.fornid = f.fornid where p.fornid is null

select * from produto p
left outer join fornecedor f on p.fornid = f.fornid where f.fornid is null

drop table produto
drop table fornecedor

select * from tbl_livro
select * from tbl_autores

select count(*) from tbl_livro l
join tbl_autores a on l.id_autor=a.id_autor where nome_autor='William' and sobrenome_autor = 'Stanek'

select * from tbl_livro l
join tbl_autores a on l.id_autor=a.id_autor

select * from tbl_livro

select * from tbl_autores

select l.nome_livro as livro, cast(l.data_pub as date) as 'data de publicação', l.preco_livro as preço, concat(a.nome_autor,' ',a.sobrenome_autor) as autor from tbl_livro l
join tbl_autores a on l.id_autor = a.id_autor		--lança a braba

create table testnull(
field smallint not null)

sp_help testnull

alter table testnull alter column field smallint null		--mudança de parametro/ valor/ tipo/ restrição no campo

drop table testnull

--exemplos de in
select * from tbl_livro

select * from tbl_livro where id_livro in(102,104)

select * from tbl_livro where id_livro not in(102,104)

--campo calculado

create table soma(
number1 smallint,
number2 smallint,
result as number1+number2)

sp_help soma

insert into soma values (5,5),(6,4),(3,7)

select * from soma
select sum(result)as totalresult from soma

insert into soma(number1) values (1),(2)
insert into soma(number2) values (1),(2)

update soma set number2 =1 where number1 =1
update soma set number1 =1 where number2 =1
update soma set number2 =2 where number1 =2
update soma set number1 =2 where number2 =2

select * from soma		--in computed field, sql doesn't sum null and other values

drop table soma


create table somatipodiferente(
number1 int,
number2 smallint,
result as number1+number2)

sp_help somatipodiferente

insert into somatipodiferente values (3,3),(2,1)

select * from somatipodiferente

drop table somatipodiferente


create table somavarcharandsmallint(
number1 varchar(5),
number2 smallint,
result as number1+number2)

sp_help somavarcharandsmallint

insert into somavarcharandsmallint values ('a',7),('b',2)

select * from somavarcharandsmallint			--works with the same data type but fail to convert (ex: varchar to int broke, smallint to int works)
select number1,number2 from somavarcharandsmallint		

drop table somavarcharandsmallint

create table somavarchar(
field1 varchar(5),
field2 varchar(5),
sumfield as field1+field2)

sp_help somavarchar

insert into somavarchar values ('a','a'),('a','b'),('b','b')

select * from somavarchar  --works with varchar concatenating them

drop table somavarchar

create table test(
field varchar(5))

insert into test values('a'),('c')

select avg(field) from test		--avg doesnt work for varchar datatype

drop table test

create table test2(
field smallint)

insert into test2 values (1),(3)

select avg(field) as 'média(average)' from test2

drop table test2

--maybe in a near future write a function do produce avg having varchar as input
--also make a 'tabuada' with computated fields

declare @varA smallint
set @varA=2

declare @varB smallint
set @varB=2

declare @varC smallint
set @varC = @varA+@varb

select @varC


--INDEX -- allow the database apps retrieve data from tables more quickly without having to read the whole table.

select * from tbl_livro

sp_help tbl_livro		--pk id_livro is a clustered index already 

create index search_by_book_name
on tbl_livro(nome_livro)				--close look on indexes folder inside of tbl_livro on tables folder

use db_biblioteca

drop index search_by_book_name on tbl_livro


--CREATE RULE			-configuration that allows you to specify parameters, example: set a range of valid or invalid values for a column

select * from tbl_livro

--creating a rule to not allow the book prices be under 10

create rule book_price_cant_be_under_ten as @valor >10

--we can see the rule inside of the programmability folder and the rules folder

--now we need to bind (vinculate) the rule to the table tbl_livro and the field preco_livro through the sp_bindrule

execute sp_bindrule book_price_cant_be_under_ten,'tbl_livro.preco_livro'

sp_help tbl_livro

--test it

select * from tbl_livro

update tbl_livro set preco_livro = 50 where id_livro=104

update tbl_livro set preco_livro = 9.99 where id_livro=104 --successfully blocked by the rule. awesome

execute sp_unbindrule 'tbl_livro.preco_livro'		--unbinding the rule from the column

--test it

update tbl_livro set preco_livro =9.99 where id_livro=104 --success after remove the rule

select * from tbl_livro

--dropping the rule

drop rule book_price_cant_be_under_ten		--rule removed

--lets test if a single column can have two rules applied simultaneously

--lets create two rules (1° - book prices not under 10	/ 2° - book prices no above 300)

create rule book_price_cant_be_under_10 as @valor >10

create rule book_price_not_above_300 as @valor <300

execute sp_bindrule book_price_cant_be_under_10, 'tbl_livro.preco_livro' 

execute sp_bindrule book_price_not_above_300, 'tbl_livro.preco_livro' 

sp_help tbl_livro

--test it

select * from tbl_livro

update tbl_livro set preco_livro = 320 where id_livro = 101		--rule not above 300 works

update tbl_livro set preco_livro = 9 where id_livro = 101		--rule not under 10 didn't work sadly =\

--This means that we can have only 1 rule per column and if we try apply a second rule, the second one will overwrite the first one
--we cannot have more than 1 rule per column working at once

execute sp_unbindrule 'tbl_livro.preco_livro'

drop rule book_price_not_above_300 
drop rule book_price_cant_be_under_10


--BACKUP N RESTORE

--1° lets create a database
--2° insert some data into a table
--3° make a backup 
--4° exclude the database
--5° restore database again from backup file


--script to create database test

CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'D:\Eu\MyOwn\dba\sqlserver\test.mdf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'D:\Eu\MyOwn\dba\sqlserver\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 130
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
ALTER DATABASE [test] SET RECOVERY FULL 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [test]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [test] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO


-- creating a table and inserting some data into
create table table_test(
field_test1 smallint)

insert into table_test values (1),(2),(3),(4),(5)

select * from table_test

--making the backup

backup database test to disk ='D:\Eu\MyOwn\dba\sqlserver\test.bak'
go

-- excluding the database

use master

drop database test

--restoring the database from the backup files

restore database test from disk ='D:\Eu\MyOwn\dba\sqlserver\test.bak'

use test

-- checking if the database was resored and if we have all the data into and YES we have =)
select * from table_test

--now just gonna drop again because I dont want spend my memory with useless test database

use master

drop database test

use db_biblioteca


--CONCATENAÇÃO DE STRINGS +

declare @vara varchar(5)
set @vara ='a'


declare @varb varchar(5)
set @varb ='b'

declare @varc varchar(5)
set @varc = @vara + @varb

select @varc


select 'victor' + ' big dog' as 'statement'

select nome_autor, sobrenome_autor from tbl_autores


select nome_autor +' ' + sobrenome_autor as nomes_completos_dos_autores from tbl_autores

select 'eu gosto do livro ' + nome_livro from tbl_livro

select 'meu livro preferido é ' + nome_livro + ', indiscutivelmente' as favbook from tbl_livro where id_livro=102



--COLLATION		--is related to the pattern that is gonna be used to compare and sort strings (collation-charts.org)

sp_help tbl_livro

select * from fn_helpcollations()		--to see all the collations available

select count(*) from fn_helpcollations()

--currently collation (on server)

select SERVERPROPERTY ('collation') as collation_atual

--database collation (can be different from the server collation)

select DATABASEPROPERTYEX('db_biblioteca','collation') as database_biblioteca_collation

--creating a database and changing the collation (if i dont specify during database creation, the server collation will be applied as database collation)

create database test

select DATABASEPROPERTYEX('test','collation') as 'test database collation'

--changing the collation

use db_biblioteca

alter database test set single_user with rollback immediate		--database must be set to single user to change collation

alter database test collate Greek_CI_AI		--changing

select DATABASEPROPERTYEX('test','collation') as 'test database collation' --checking if the new one was applied. the answer is Yes

alter database test set multi_user	--setting back to multi user

drop database test --dropping

--changing collation on column level during consulting

select nome_livro from tbl_livro where nome_livro like 's%'
collate Latin1_General_CI_AI

select nome_livro from tbl_livro where nome_livro like 's%'
collate Latin1_General_CS_AI				--when we compare both selects, the second one doesnt return anything because now is using a collation that is case
										--sensitive, which means that will make difference betwen lower and upper cases
										--on this specific case we doesnt have a book name that starts with the lower case letter s, that why doesnt return data



--	WITH TIES

--(competition example: imagine that we need to return top 3 competitors that have the highest scores. But if we use the top 3 clausure and the competitor number 4
--have the same score as number 3, this competitor number 4 will be excluded uncorrectly from the list. That why we use TIES clausure)

-- lets create a table
--insert some data
--test it using and not using ties clausure

create table sillygame(
competitor varchar(5),
score smallint)

insert into sillygame values ('A',10),('B',9),('C',8),('D',8)

select * from sillygame

--lets select top 3 based on score

select top(3) * from sillygame order by score desc

--is this fair with competitor D that has the same score as C? Heck no.
--This is why we use ties clausure

select top (3) with ties * from sillygame order by score desc		--now we have been fair with competitor D. World is beauty when you dont lie.

--lets make some more tests, if everyone have the same score?

--lets truncate the table, insert the values again and test it or nah lets just make an upgrade without where

update sillygame set score =10

select * from sillygame

--lets see without ties

select top (3) * from sillygame order by score desc

--ties

select top (3) with ties * from sillygame order by score desc --fair again

drop table sillygame --u know the reason



--VIEWS		--virtual table based on a query result (always shows updated data because the database engine recreates the table every time that someone consult
--the view)

select * from tbl_livro

select * from tbl_autores

create view view_top3_priced_books as
select top(3) with ties l.nome_livro as book, cast(l.data_pub as date) as 'publication date', l.preco_livro as price, a.nome_autor + ' ' + a.sobrenome_autor as author
from tbl_livro l
join tbl_autores a on l.id_autor = a.id_autor order by l.preco_livro desc

-- we can check the view inside of the database icon and inside of the folder view

select * from view_top3_priced_books		--select view =)

select book from view_top3_priced_books

drop view view_top3_priced_books	--^^


--lets make another test if I insert another book with a high price on books table? lets see if the data in our view will update

select * from tbl_livro

insert into tbl_livro values ('testbook','1231231','20000101',100,2,1) --the new book received id 201

select top(3) with ties * from tbl_livro l
join tbl_autores a on l.id_autor= a.id_autor
order by preco_livro desc						--comparing

select * from view_top3_priced_books		--yes, the data where updated

delete from tbl_livro where id_livro = 201 --removing the book that we just inserted because u know why

select * from view_top3_priced_books		--selecting the view again, and yes, we will aways get updated data from this virtual table everytime that we access it.

--changing the view and showing id for no reason, just to change it

alter view view_top3_priced_books as
select top(3) with ties l.id_livro as id, l.nome_livro as book, cast(l.data_pub as date) as 'publication date', l.preco_livro as price, a.nome_autor + ' ' + a.sobrenome_autor as author
from tbl_livro l
join tbl_autores a on l.id_autor = a.id_autor order by l.preco_livro desc

select * from view_top3_priced_books

--selecting specific data on it (need to have letter i somewhere)

select id, book from view_top3_priced_books where book like '%[i]%'

select id, book from view_top3_priced_books where book like '%[f]%' --letter f somewhere

drop view view_top3_priced_books --^^



--SUBCONSULTA (subquery) --query inside a query or query that will be used by another query

select (select 'random name') as 'name'

select 2 * (select 4) as result
 
 --tabela derivada = tabela gerada por subconsulta

create table produto(
idprod smallint identity,
nome varchar(10))

 create table cliente(
 idcli smallint identity,
 nome varchar(10))

create table compras(
idcompra smallint identity,
idcli smallint foreign key references cliente(idcli),
idprod smallint foreign key references produto(idprod))

alter table produto 
add constraint pkprod primary key (idprod)

alter table cliente 
add constraint pkcli primary key (idcli)

alter table compras
add constraint pkcom primary key (idcompra)

alter table produto add valor smallint 

alter table compras add quant smallint
sp_help compras


--cliente
select * from cliente

insert into cliente values('ana'),('tiago'),('marcelo')

--produto
select * from produto

insert into produto values ('mouse',15),('teclado',30),('monitor',100)

--compra
select * from compras

insert into compras values(1,1,2),(2,1,1),(2,3,1),(3,2,5)

select * from compras

select * from cliente c
join compras cm on c.idcli=cm.idcli
join produto p on cm.idprod = p.idprod


--simulando

select c.nome as cliente, pr.valor * cm.quant as total from cliente c
join compras cm on c.idcli = cm.idcli
join produto pr on cm.idprod = pr.idprod
--group by c.nome

--não reconhece pr.valor e cm.quant na função de agregação group by

select resultado.cliente, sum(resultado.total) as total
from (select c.nome as cliente, pr.valor * cm.quant as total from cliente c
join compras cm on c.idcli = cm.idcli
join produto pr on cm.idprod = pr.idprod) as resultado
group by resultado.cliente
order by total

--nice



--CTE --COMMON TABLE EXPRESSION

--another way to do the same thing above

with resultCTE(cliente,total) as
(select c.nome as cliente, pr.valor * cm.quant as total from cliente c
join compras cm on c.idcli = cm.idcli
join produto pr on cm.idprod = pr.idprod)

select cliente, sum(total) as valor_total
from resultCTE
group by cliente
order by valor_total



drop table produto
drop table compras		--^^
drop table cliente



--VARIAVEIS  (DECLARE)

--Podem ser criadas em um batch ou procedure

declare @myvar smallint

set @myvar=17

select @myvar

--caso eu queira criar multiplas variaveis posso usar o declare uma vez só

--declarando
declare @nome varchar(10),
@idade smallint,
@cpf varchar(20)

--atribuindo valor
set @nome ='victor'
set @idade =24
set @cpf ='123123123'

--print
select @nome as nome, @idade as idade, @cpf as cpf

--atribuindo valor com select

declare @meunome varchar(10)
set @meunome = (select 'VICTOR')
select @meunome as nome


select * from tbl_livro

sp_help tbl_livro

declare @bookname varchar(50)

--select @bookname = nome_livro from tbl_livro where id_livro=101		--atribuindo o nome do livro cujo id é 101 para a variavel

select @bookname = nome_livro from tbl_livro --a variavel só armazena 1 valor, caso eu passe a coluna inteira, ela pega somente o ultimo valor

select @bookname as 'nome do livro'


--another one
select * from tbl_livro

declare @preco money, @nome varchar(30), @quantidade int
set @quantidade = 5

--101

select @nome = nome_livro, @preco = preco_livro from tbl_livro where id_livro=101

select @nome as 'nome do livro' , @preco * @quantidade as 'preço total dos livros'



--CONVERSÃO DE DADOS COM CAST N CONVERT

--CAST

declare @dataatual datetime

select @dataatual = GETDATE()

select cast(@dataatual as date) 

select 'O preco do livro ' + nome_livro + ' é '+ cast(preco_livro as varchar(10)) + ' reais' as frase from tbl_livro where id_livro = 101

create table people(
nome varchar(10),
idade smallint)

insert into people values ('victor',25)

select * from people

select 'Dont cry ' + nome + ', you only have '+ cast(idade as varchar(10)) + ' y/o' as 'inspirational phrase' from people where idade = 25 

--select 'Dont cry ' + nome + ', you only have '+ idade + ' y/o' as 'inspirational phrase' from people where idade = 25  --conversion error

drop table people


--CONVERT -- 

select 'Dont cry ' + nome + ', you only have '+ convert(varchar(10),idade) + ' y/o' as 'inspirational phrase' from people where idade = 25 

insert into people values ('joao',26), ('matheus',24)

select 'Dont cry ' + nome + ', you only have '+ convert(varchar(10),idade) + ' y/o' as 'inspirational phrase' from people


--quando trabalhamos com data podemos usar o estilo do comando convert -- conver(tipo, campo, estilo)

select * from tbl_livro

select 'O livro ' + nome_livro +' foi lançado em: '+ convert(varchar(20),data_pub,102) from tbl_livro	--ansi

select 'O livro ' + nome_livro +' foi lançado em: '+ convert(varchar(20),data_pub,109) from tbl_livro	--default

select 'O livro ' + nome_livro +' foi lançado em: '+ convert(varchar(20),data_pub,101) from tbl_livro --eua

select 'O livro ' + nome_livro +' foi lançado em: '+ convert(varchar(20),data_pub,112) from tbl_livro --iso

select 'O livro ' + nome_livro +' foi lançado em: '+ convert(varchar(20),data_pub,103) from tbl_livro --british/ french

select 'O livro ' + nome_livro +' foi lançado em: '+ convert(varchar(20),data_pub) from tbl_livro -- no style applied

--http://msdn.microsoft.com/pt-br/library/ms187928.aspx

--MS link for more datatypes that we are allowed to convert


declare @varA smallint,
@varB smallint

set @varA = 2
set @varB = 2

select @varA + @varB


--CONDICIONAL IF / ELSE

declare @number smallint 
set @number = 3

if (@number = 2)			--if number on variable is equal 2
select 'number is equal ' + convert(varchar, @number) + '. Congrats'
else						--otherwise
select 'number is not equal 2'

--if we need to write more than one line of commands after the condition. Then we need to use the BEGIN / END statments.

declare @number smallint 
set @number = 2

if (@number = 2)		
	begin
		select 'number is equal ' + convert(varchar, @number) + '. Congrats'
		set @number = 15 
	end
else					
	select 'number is not equal 2'

----- another silly example

declare @nome varchar(10),
		@num smallint

set @nome = 'AAAvictor'
set @num = 12

if(@num = 12)
	select @nome + ' seu numero e igual a '+ convert(varchar(5),@num)
if(@nome = 'victor')
	begin
		set @num =10
		select @nome + ' seu numero e igual a ' + convert(varchar(5),@num)
	end
else
	begin
		set @num =40
		select @nome + ' seu numero agora e ' + convert(varchar(5),@num) 
	end



--lets create a condition structure to see how many students were approvated or reprovated base on theirs exams

--1° - create a table
--2° - put the data on it
--3° - create the conditional statment that will give us the result

--1°
create table students(
stname varchar(10),
note1 smallint,
note2 smallint,
note3 smallint)

alter table students
alter column note1 float

alter table students
alter column note2 float

alter table students
alter column note3 float


--2°
insert into students values ('ana',5.3,5.2,5.9),
('tiago',7.7,8,6.2),
('joao',10,10,10),
('fernanda',8,5,8),
('pedro',3.5,8,5)

select * from students

drop table students		--^^

--3°

declare @name varchar(10),
		@media float,
		@result varchar(10)

select @name = stname, @media = (note1 + note2 + note3)/3 from students where stname ='ana'
	if (@media >=7)
		begin
			select @result ='approved'
		end
	else
		begin
			select @result = 'repproved'
		end

select 'The student ' +@name + ' was '+@result+ ' with the final grade of: '+convert(varchar,@media)



--WHILE

--1 command is ok
--more than one command, use begin / end with it.


--printing 10 numbers

declare @cont smallint
set @cont = 0

while (@cont<10)
	begin
		select 'Number '+convert(varchar(5), @cont)
		set @cont = @cont +1
	end


-- seleting multiple book from table tbl_livro based on their id

declare @cont smallint
set @cont=100

while(@cont<=103)
	begin
		select id_livro, nome_livro, preco_livro from tbl_livro where id_livro = @cont
		set @cont = @cont+1
	end

--trying to print every student using conditional if/else plus while
--I mean, judgin every student, if their final grade was greater than 7, their were approved, otherwise repproved

select * from students

sp_help students

alter table students add stid smallint identity

--select stid from students where stid = @cont

declare @cont smallint,
		@row smallint,
		@media float,
		@nome varchar(10)
set @cont =1
set @row = (select count(stid) from students)

--select @row --pegou o valor

while(@cont <= @row)
	begin
		select @nome = stname, @media = (note1+note2+note3)/3 from students where stid = @cont
		if(@media >=7)
			begin
				select @nome + ' foi aprovado com media '+convert(varchar, @media) 
			end
		else
			begin
				select @nome + ' foi reprovado com media '+convert(varchar, @media) + ' ,inferior a 7'
			end

		set @cont= @cont +1
	end

--great, now comparing

select * from students

--nice


--creating the same thing as above but now putting everthing together on same table

declare @cont smallint,
		@row smallint,
		@media float,
		@nome varchar(10),
		@texto varchar(100)
set @cont =1
set @row = (select count(stid) from students)

while(@cont <= @row)
	begin
		select @nome = stname, @media = (note1+note2+note3)/3 from students where stid = @cont
		if(@media >=7)
			begin
				set @texto =(select @nome + ' foi aprovado com media '+convert(varchar, @media))
				insert into test values (@texto)
			end
		else
			begin
				set @texto= (select @nome + ' foi reprovado com media '+convert(varchar, @media) + ' ,inferior a 7')
				insert into test values (@texto)
			end

		set @cont= @cont +1
	end

--great, now comparing

select stname,note1,note2,note3,stid, (note1+note2+note3)/3 as media from students

select * from students

select * from test

--nice

create table test(
campo varchar(50))

declare @rec varchar(50)
set @rec = (select 'a')

select @rec

insert into test values (@rec)

select * from test

truncate table test

drop table test


--resolvendo o exemplo da tabela biblioteca, todavia juntando os dados em uma tabela temporaria

create table #tblfinal(
fn_id smallint,
fn_nome_livro varchar(40),
fn_preco money)


declare @codigo smallint,
@id smallint,
@fn_nome_livro varchar(40),
@fn_preco money


set @codigo=100

while(@codigo<106)
	begin
		set @id = (select id_livro from tbl_livro where id_livro=@codigo)
		set @fn_nome_livro = (select nome_livro from tbl_livro where id_livro=@codigo)
		set @fn_preco = (select preco_livro from tbl_livro where id_livro=@codigo)

		insert into #tblfinal (fn_id, fn_nome_livro,fn_preco) values (@id,@fn_nome_livro,@fn_preco)

		set @codigo = @codigo+1
	end

select * from #tblfinal

drop table #tblfinal


--IMPROVING THE LAST CODE

create table #tblfinal(
id smallint,
livro varchar(30),
preco money)


declare @codigo smallint,
@var_id smallint,
@var_livro varchar(30),
@var_preco money


set @codigo=100

while(@codigo<106)
	begin
		
		select @var_id = id_livro, @var_livro= nome_livro, @var_preco= preco_livro from tbl_livro where id_livro=@codigo

		insert into #tblfinal (id,livro,preco) values (@var_id,@var_livro,@var_preco)

		set @codigo = @codigo+1
	end

select * from #tblfinal

drop table #tblfinal



--PROCEDURES		--porção de codigo sql que pode ser executado como subrotina. Podemos atribuir permissões sobre quem pode executar ou não.

--podemos visualizar a procedure dentro da base de dados, dentro da pasta programmability > stored procedures

--criando a uma proc

create procedure sillyproc
as
select 'silly return of a silly proc' as silly_field

execute sillyproc

drop procedure sillyproc

--another one

create procedure valores_dos_livros
as
select nome_livro,preco_livro from tbl_livro

exec valores_dos_livros

drop procedure valores_dos_livros

--sp_helptext  procedure que te ajuda a ver o conteudo das procedures

exec sp_helptext valores_dos_livros

sp_helptext sillyproc


--criar uma procedure criptografada para que ninguem visualize o codigo fonte

--with encryption

create procedure all_time_secret
with encryption
as
select 'im not your father'


exec all_time_secret

sp_helptext all_time_secret	--agora quando tentamos visualizar o codigo fonte, o mesmo nos diz que esta criptografado.

drop procedure all_time_secret


--ALTERAÇÃO DE PROCEDURE PARAMETROS DE ENTRADA		(ALTER PROCEDURE) AND PARAMETERS 

create procedure soma
as
select '2+2=5'	--ops

exec soma

alter procedure soma
as
select '2+2=4'

exec soma

drop procedure soma


--criando procedure com parametros

create procedure soma5_com_parametros(@parametro smallint)
as
select 5+@parametro

exec soma5_com_parametros 2

alter procedure soma5_com_parametros(@parametro as smallint)
as
select @parametro+5

exec soma5_com_parametros 2
exec soma5_com_parametros 7
exec soma5_com_parametros 10
exec soma5_com_parametros 12

drop procedure soma5_com_parametros

sp_helptext soma5_com_parametros


--é par ou impar

create procedure par_ou_impar(@num as smallint)
as
if(@num%2=0)
	begin
		select 'O numero ' +convert(varchar,@num)+' é par'
	end
else
	begin
		select 'O numero ' +convert(varchar,@num)+' é ímpar'
	end


exec par_ou_impar 5
exec par_ou_impar 2
exec par_ou_impar 10
exec par_ou_impar 7

drop procedure par_ou_impar

declare @cont smallint
set @cont=0

while @cont<10
	begin
		exec par_ou_impar @cont
	set @cont = @cont+1
	end


--proc para buscar o livro e seu preço com base no parametro

create proc livro_valor(@id as smallint)
as
select nome_livro, preco_livro from tbl_livro where id_livro = @id

exec livro_valor 100

exec livro_valor 101

sp_helptext livro_valor 

drop procedure livro_valor

--info aleatória, para comentar varias linhas de codigo de uma vez ctrl+k+c e descomentar ctrl+k+u

--aaa
--aaa
--aaa

--proc para buscar por um range de livros da tabela livros

create proc range_livros (@rangeinit as smallint, @rangeend as smallint)
as
	begin
		select * from tbl_livro where id_livro between @rangeinit and @rangeend
	end


exec range_livros 100, 103	--passando os parametros na posição correta

exec range_livros @rangeend =103, @rangeinit = 100 --passando os parametros por nome

--select count(id_livro) from tbl_livro

select * from tbl_livro

drop proc range_livros


--criando outra proc que retorna somente livros que tem o id > do que o valor do parametro e o preco > do que outro valor do paramentro

create proc livros_maiores_e_mais_caros (@id smallint, @preco money)
as
	begin
		select nome_livro as livro, preco_livro as preço from tbl_livro where id_livro >@id and preco_livro >@preco
	end


select * from tbl_livro

exec livros_maiores_e_mais_caros @id=102, @preco =30

drop procedure livros_maiores_e_mais_caros


--procedure para calcular o preço a ser pago por livro levando em consideração a quantidade

create proc estima_preco_livro (@id smallint, @quantidade smallint)
as
	begin
		select nome_livro as livro, preco_livro as 'preço unidade', preco_livro*@quantidade as 'preço total' from tbl_livro where id_livro=@id
	end

	sp_helptext estima_preco_livro

	select * from tbl_livro

	select preco_livro*3 from tbl_livro where id_livro=102

	exec estima_preco_livro 102, 3

	drop proc estima_preco_livro

	
--criando proc para inserir dados na tabela editora

select * from tbl_editora

sp_help tbl_editora

create proc insere_editora (@nome varchar(50))
as
	begin
		insert into tbl_editora values (@nome)
	end


sp_helptext insere_editora

	
exec insere_editora @nome= 'GPT'


select * from tbl_editora

delete from tbl_editora where id_editora=103

drop proc insere_editora


--PARAMETROS DE SAIDA E RETURN  

--valor padrão, caso o usuario não forneça o dado no parametro da proc no exec, a proc usará o valor padrão.

create proc e_padrao_ou_nao (@valor1 smallint, @valor2 varchar(10) ='padrao')
as
	begin
		select 'valor1 é: ' +convert(varchar, @valor1)+' e o valor2 é '+@valor2
	end


exec e_padrao_ou_nao @valor1=10

exec e_padrao_ou_nao @valor1=10, @valor2='modificado'

drop proc e_padrao_ou_nao


--PARAMETROS DE SAIDA		--agora a proc pode retornar dados para o procedimento que a chamou OUTPUT

--no procedimento armazenado, a saida aparece como uma variavel
--no procedimento chamador, uma variavel deve ser criada para receber o parametro de saida.

create proc test (@par1 as int output)
as
	begin
		select @par1*2
		return
	end


declare @valor as int =15

exec test @valor output

print @valor

drop proc test

--usando o set para mudar o valor da variavel externa
alter proc test2 (@par1 as int output)
as
	begin
		set @par1 = @par1*2
		return
	end


declare @valor as int =15

exec test2 @valor output

print @valor

drop proc test2

--RETURN		termina incodicionalmente uma proc e retorna o valor ao chamador

--da para usar para returnar o status de sucesso ou falha da proc 


alter proc p_livrovalor(@quantidade smallint, @cod smallint =-10, @id smallint)
as
set nocount on
if(@id>=100)
	begin
		select nome_livro as livro, preco_livro*@quantidade as preço from tbl_livro where id_livro=@id
		return 1
	end
else
	return @cod


declare @codigo int
exec @codigo= p_livrovalor @id =103, @quantidade =10
print @codigo

select * from tbl_livro where id_livro=103

declare @codigo2 int
exec @codigo2= p_livrovalor @id =99, @quantidade =10
print @codigo2

drop proc p_livrovalor

--set nocount on = evita a contagem de linhas (ex: x linhas afetadas após a execução de um comando)


--alter view vtblivro
--as
--select * from tbl_livro where id_livro=102


--select * from vtblivro

--select * from tbl_livro

--drop view vtblivro

--ignora esse pedaço de view acima, vamos para as functions.



--FUNCTIONS		(UDF-User-Defined Functions)

--criar funções para realizar tarefas. Podemos inserir uma lógica mais complexa em consultas

--Temos varios tipos de funções: funções escalares, valor de tabela embutida, valor de tabela multi-instruções


--FUNCÃO ESCALAR - retorna 1 unico valor especifico

--ex: Função que calcula a media das notas dos alunos, com peso 2 na nota3

select * from students

sp_help students

create function medianota(@nome varchar(10))
returns real
as
	begin
		declare @media real
		select @media = (note1+note2+note3*2)/4 from students where stname = @nome
		return @media
	end


select dbo.medianota('ana')

select dbo.medianota('pedro')

--para ver as funções, ir dentro do icone da base > pasta programmability > functions > dentro do tipo de função criada, no caso acima, scalar

drop function medianota


--FUNÇÕES COM VALOR DE TABELA EMBUTIDA --FUNÇÃO QUE PODEM RETORNAR TABELAS INTEIRAS


--função com valor de tabela embutida(inline)- parece com view para permite parametros

--enquanto uma view teria uma parametrização fixa na condicão, a function, vc pode chamar varias vezes com valores de parametros diferentes 


create function livros_com_maiores_precos (@preco money)
returns table
as
	return(select l.nome_livro, a.nome_autor, e.nome_editora from tbl_livro l
	join tbl_autores a on l.id_autor=a.id_autor
	join tbl_editora e on l.id_editora=e.id_editora
	where l.preco_livro >@preco)


select * from livros_com_maiores_precos (60) --it works

select nome_livro from livros_com_maiores_precos (40) --wow

select * from tbl_livro
select * from tbl_editora
select * from tbl_autores


drop function livros_com_maiores_precos



-- FUNÇÃO COM VALOR DE TABELA COM VARIAS INSTRUÇÕES

--combina a função escalar de retornar um unico valor com a função de tabela e retornar tabelas
--esse tipo de função cria uma variavel do tipo tabela.


create function multitable()
returns @valores table (livro varchar(50), lancamento datetime, editora varchar(50), preco money)
as
	begin
		insert @valores(livro, lancamento,editora,preco) select l.nome_livro, l.data_pub, e.nome_editora, l.preco_livro from tbl_livro l
		join tbl_editora e on l.id_editora=e.id_editora
		return
	end

select * from multitable()

select livro + ' =)' from multitable()

drop function multitable


--select l.nome_livro, l.data_pub, e.nome_editora, l.preco_livro from tbl_livro l
--		join tbl_editora e on l.id_editora=e.id_editora



--testezinho rapido

create table guardastring(
campo varchar(50))

insert into guardastring values ('aaa'),('bbb')

insert into guardastring select nome_livro from tbl_livro  --insert usando select (atenção na ordem e tipo de dado)

select * from guardastring

drop table guardastring

select * from tbl_livro


/*select * from tbl_livro

select top 1 id_livro from tbl_livro order by id_livro desc


id		nome
1		'victor'
2		null

count(id) =2
count(nome) =1

count(*)
*/


/*
view - view de tabelas, não da para passar parametros
proc - procedimento
function - parece com a view, mas posso passar parametros e aproveitar dentro de outro codigo
trigger - um tipo de proc que reage a eventos

*/

--TRIGGERS 

--(gatilho) - um tipo de stored procedure que é executada automaticamente quando o usuario realiza uma ação em alguma tabela especifica.

--ações que acionam o trigger: insert, update, delete (DML)

--o triggers não são executados diretamente, eles respondem a eventos, disparam a cada vez um determinado evento ocorre.

--Possuem tipos:

--AFTER - o codigo do trigger executa depois das ações terem sido completadas
--INSTEAD OF - o código do trigger executa no lugar da operação que causou o disparo.


/* FLUXO DE TRANSAÇÕES

1- verificação de identity insert
2- restrição (constraint) de nulos(null)
3- checagem de tipos de dados
4- execução de trigger INSTEAD OF (execução do DML para aqui, esse trigger não é recursivo)
5- restrição de chave primária
6- restrição "check"
7- restrição de chave estrangeira
8- execução do DML e atualização do log de transações
9- execução do trigger AFTER
10- Commit da transação (confirmação)

*/



--criando uma trigger do tipo AFTER 

create trigger teste_trigger_after
on tbl_editora
after insert
as
print 'Ola mundo'

insert into tbl_editora values ('editora_A')	--it works, course

drop trigger teste_trigger_after


--another example: a trigger that will make two inserts: one on tables tbl_autores and other on tbl_livros after someone insert data on table tbl_editora


create trigger trigger_after
on tbl_editora
after insert
as
	insert into tbl_autores values (25,'jose','da silva')
	insert into tbl_livro values ('livro do jose','123456000','20000101',77,2,25)


insert into tbl_editora values ('editora_B')

select * from tbl_autores
select * from tbl_editora
select * from tbl_livro

sp_help tbl_editora

drop trigger trigger_after

delete from tbl_livro where id_livro=211

delete from tbl_autores where id_autor =25

delete from tbl_editora where id_editora=115

--good

--creating another trigger but this time will be an INSTEAD OF type

create trigger test_trigger_insteadof
on tbl_autores
instead of insert
as
print 'hey, im not gonna insert on authors table this time'

drop trigger test_trigger_insteadof

insert into tbl_autores (nome_autor,sobrenome_autor) values ('horacio','lima')

select * from tbl_autores

sp_help tbl_autores

/*

OBS: a jornada de codigos a seguir so aconteceu porque eu sou teimoso e fui inventar de não quere passar o id_autor no insert
que dispara a trigger. Resultado, dropei a pk e o campo id_autor, dropei a fk em livro que referenciava ela.
Recriei o campo identity, o que causou problemas, pois os id antigos não estavam em order mas agora o campo identity sobreescreveu os valores
Recriei a fk na table livro, tive que excluir os registros que estavam quebrando a integridade referencial graças ao identity agora vir sobreescrevendo
os valores anteriores de id_autor

preciso descobrir uma forma de fazer um campo pk passar a se tornar identity sem precisar dropar e recriar esse campo, pois isso ferra com os valores
antigos.



alter table tbl_autores drop constraint PK__tbl_auto__5FC3872D9E790273

--dropar a fk na tabela livro

sp_help tbl_livro 

alter table tbl_livro drop constraint fk_id_autor

--dropar a pk de autor

sp_help tbl_autores 

alter table tbl_autores drop constraint pk_autor

--refazer com a pk de autor com identity

select * from tbl_autores

alter table tbl_autores drop column id_autor

alter table tbl_autores add id_autor smallint identity

alter table tbl_autores add constraint pk_autor primary key(id_autor)

--COMO ADD UMA COLUNA IDENTITY em um campo pk?

--se eu dropar o campo e recriar, eu posso perder os ids da pk original, pois eu estaria recriando tudo de novo-- FUUUCK


--refazer a fk de livro

select * from tbl_livro

delete from tbl_livro where id_autor =25	--tive que remover a linha com o id que quebrou a integridade, pois mudou na tabela de autores

--antes o id do autor era 25, agora é 6, pois foram todos recriados =\ situação ruim

select * from tbl_autores

alter table tbl_livro add constraint fk_id_autor foreign key (id_autor) references tbl_autores(id_autor)

sp_help tbl_livro

--JURO QUE VOU VOLTAR ESSA COISA PARA O QUE ERA ANTES, ME AGUARDE

--preciso ver também o begin transaction

*/

/*jornada para reverter as operações acima e trazer redenção para meu intelecto*/

--ver os dados das 3 tabelas 

select * from tbl_livro

select * from tbl_autores

select * from tbl_editora


--excluir os que estão quebrando a integridade (os dados inseridos pela trigger) 

delete from tbl_autores where id_autor=6

delete from tbl_editora where id_editora>100

--dropar a fk em livro para autor

sp_help tbl_livro

alter table tbl_livro drop constraint fk_id_autor

select * from tbl_livro

--tentar alterar a remover o atributo identity do campo id_autor sem dropar o campo e recrirar

alter table tbl_autores alter column id_autor smallint 	--não funcionou para retirar o identity, vou dropar

sp_help tbl_autores

select * from tbl_autores

insert into tbl_autores values ('aaa','bbb')

delete from tbl_autores where id_autor=7

alter table tbl_autores drop constraint pk_autor

alter table tbl_autores drop column id_autor

alter table tbl_autores add id_autor smallint --identity --not null

alter table tbl_autores add constraint pk_autor primary key (id_autor)

alter table tbl_autores add id_autor smallint primary key

select * from tbl_autores

update tbl_autores set id_autor=1 where nome_autor='daniel'
update tbl_autores set id_autor=2 where nome_autor='gerald'
update tbl_autores set id_autor=3 where nome_autor='mark'
update tbl_autores set id_autor=4 where nome_autor='william'
update tbl_autores set id_autor=5 where nome_autor='richard'

truncate table tbl_autores

select *  from tbl_autores

alter table tbl_autores add id_autor smallint primary key

insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (1,'Daniel','Barret')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (2,'Gerald','Carter')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (3,'Mark','Sobell')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (4,'William','Stanek')
insert into tbl_autores (id_autor,nome_autor,sobrenome_autor) values (5,'Richard','Blum')

sp_help tbl_autores

--recriar a fk de livro

select * from tbl_livro

sp_help tbl_livro

alter table tbl_livro add constraint fk_id_autor foreign key (id_autor) references tbl_autores(id_autor)

--HONRA RECUPERADA COM SUCESSO

--voltando para as triggers


create trigger test_trigger_insteadof
on tbl_autores
instead of insert
as
print 'hey, im not gonna insert on authors table this time'

drop trigger test_trigger_insteadof

insert into tbl_autores (id_autor, nome_autor, sobrenome_autor)values (26,'horacio','lima')

select * from tbl_autores

delete from tbl_autores where id_autor=26

--nice finally works properly. immaboutcry


--ATIVAR/ DESATIVAR UMA TRIGGER

alter table tbl_autores disable trigger test_trigger_insteadof

alter table tbl_autores enable trigger test_trigger_insteadof

--PARA VERIFICAR TRIGGERS: 

--DENTRO DE UMA TABELA: (dentro do icone da base de dados > dentro da pasta de tabelas > dentro da tabela > pasta triggers, vai estar lá)

exec sp_helptrigger @tabname = tbl_autores

--NO BANCO DE DADOS TODO:

-- 0 = não desabilitado ou habilitado
-- 1 = desabilitado

use db_biblioteca

select * from sys.triggers where is_disabled = 1

select * from sys.triggers where is_disabled = 0 or is_disabled = 1 --volta tudo, desabilitado e habilitado da base

/*ideias para implementar o codigo

se uma ação disparar 2 triggers?

criar uma trigger para ficar contando a quantidade de interações com colunas e armazenar isso em tabelass

reação em cadeia de uma trigger*/


--TRIGGER WITH UPDATE

alter trigger alteranome
on tbl_autores
after insert, update
as
if update(nome_autor)
begin
print 'o nome do autor foi alterado'
end
else
begin
print 'nome não foi modificado'
end




insert into tbl_autores values ('aaa','aaa',10)

delete from tbl_autores where id_autor=15

select * from tbl_autores

update tbl_autores set nome_autor ='bbb' where id_autor=10

sp_help tbl_autores

insert into tbl_autores (id_autor) values (15)

update tbl_autores set id_autor=15 where id_autor=10

sp_helptext alteranome

--ANINHAMENTO DE TRIGGERS

--quando um trigger dispara outros triggers ou ele mesmo

--para isso a opção de servidor 'permitir que gatinhos disparem outros gatilhos' precisa estar ativa


--HABILITAR OU DESABILITAR A CONFIGURAÇÃO DE ANINHAMENTO DE TRIGGERS NO SERVIDOR

--botão direito na instancia > propriedades > avançado > miscellaneous > allow triggers to fire others = true

exec sp_configure 'Nested Triggers', 0  --1
reconfigure

--TRIGGER RECURSIVO --trigger do tipo after que chama ele mesmo

--pode ser habilitado e desabilitado com o comando ALTER

alter database db_biblioteca
set recursive_triggers on --off

alter database db_biblioteca
set recursive_triggers off --on


--para funcionar o trigger recursivo também é preciso que tenha a configuração de trigger aninhado ativa (trigger recursivo é um tipo de trigger aninhado também)

--criar uma tabela para guardar alguns valores, esses valores virão do disparo sucessivo de triggers
--a trigger que é do tipo after insert, terá um comando insert, então após sua execução, ela mesmo vai continuar se auto acionando até uma 
--condição especifica seja alcançada

create table guardavalores(
valor smallint)

select * from guardavalores

alter trigger againagain
on guardavalores
after insert
as
	declare @campo smallint

	select @campo = max(valor) from guardavalores

	if(@campo<6) --condição de parada (stop recursion)
		begin
			insert into guardavalores select @campo+1 from guardavalores
			print @campo+1
		end
	else
		begin
			print 'Trigger recursivo finalizado'
		end



insert into guardavalores values (2)

select * from guardavalores

truncate table guardavalores

select count(valor) from guardavalores where valor =8

select * from guardavalores

insert into guardavalores select 8+1 from guardavalores

select count(valor) from guardavalores where valor=9

select count (*) from guardavalores

--com o insert sendo feito pelo select dessa maneira, ele insere o promixo numero a quantidade de linhas que houverem na tabela, isso explica o
--crescimento exponencial

--o que nos leva a refatorar a trigger


alter trigger againagain
on guardavalores
after insert
as
	declare @campo smallint

	select @campo = max(valor) from guardavalores

	if(@campo<6) --condição de parada (stop recursion)
		begin
			insert into guardavalores select max(valor)+1 from guardavalores
			print @campo+1
		end
	else
		begin
			print 'Trigger recursivo finalizado'
		end


select * from guardavalores

insert into guardavalores values (2)

truncate table guardavalores 

drop trigger againagain

drop table guardavalores

--sucesso 


--RENOMEAR COLUNAS E TABELAS NO SQLSERVER 

--interface, acessa a base ou tabelas e rename

--por procedure (sp_rename)

use db_biblioteca

select * from sys.tables		--traz todas as tabelas de uma base

select * from sysdiagrams		--tabela de sistema


create table nomeantigo(
campoantigo varchar(3))

sp_rename 'nomeantigo.campoantigo',camponovo,'column'		--mudar nome do campo de uma tabela

select * from nomeantigo	--mudou o nome do campo


sp_rename 'nomeantigo', 'nomenovo'		--mudando o nome da tabela 

select * from nomenovo

select * from nomeantigo  --erro

select * from sys.tables		--podemos conferir que o nome foi atualizado

create database nomeantigo_base

alter database nomeantigo_base modify name = nomenovo_base		--mudando nome de uma base de dados

drop database nomenovo_base


--TIME	(horarios)

--formato : hh:mm:ss[.nnnnnnn]

create table testedashoras(
hora1 time,
hora2 time)

select * from testedashoras

insert into testedashoras values ('14:05:00','18:10:00')

select datediff(minute, hora1,hora2) as 'diferença de hora' from testedashoras

select datediff(hour, hora1,hora2) as 'diferença de hora' from testedashoras

select datediff(second, hora1,hora2) as 'diferença de hora' from testedashoras

drop table testedashoras


/*Just few comments

sql is a dsl language (domain specific language) instead of gpl (general pourpose language)

integração de aplicações com bancos de dados sql - CRUD

SQL was born in 1970 on IBM. Created by Donald D. Chamberlin e Raymond F. Boyce
it was based on relacional model of Edgar F. Codd

1986 ANSI
1987 ISO

last time revised on june/ 2023

identificadores - nomes dos objetos
clausulas - elementos que compoem as declareações e queries
expressoes - produzem valores ou tabelas com linhas e colunas
predicado - condições a serem avaliadas (logica de 3 valores? V / F /Nulo)

Na boson tem: Mysql, sqlserver, postgresql

mysql
sqlserver
oracle
postgresql
sqlite
ibm db2

comandos sql

ddl (data definition language) - create, alter, drop, truncate, rename
dml (data manipulation language) - insert, update, delete, select into, merge
dcl (data control language) - grant, deny, revoke
dql (data query language) - select 
tcl (transaction control language) - commit, rollback, savepoint, begin/ set transaction

sql- linguagem usada para gerenciar bancos de dados relacionais


--https://www.youtube.com/@italomesquita/videos -- pegar umas dicas sobre cross apply / outer apply, colunas null
--union e union all






*/












