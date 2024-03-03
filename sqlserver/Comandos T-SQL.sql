/*SQL - Structured Query Language - Linguagem de consulta estruturada para bancos de dados

T-SQL - Transact SQL - "Dialeto" SQL utilizado no SQL Server 

No ambiente do SQL Server temos algumas categorias de comandos (DDL,DML,DCL,DQL) que iremos abordar durante este script.
Abordaremos os comandos mais comuns dentro de cada uma destas categorias.*/

/*================================================================================================================================================================*/

/*OBS: Para a execu��o dos comandos deste tutorial dentro do SSMS (sql server management studio), selecione os comandos segurando e arrastando com o bot�o esquerdo 
do mouse e posteriormente clicando no bot�o "Execute" do menu (�cone de "play"), no canto superior esquerdo ou ap�s selecionar os comandos, precione a tecla F5.*/

/*================================================================================================================================================================*/

/*DDL - Data Definition Language - Comandos utilizados que nos permitem criar, alterar e excluir a estrutura de dados dentro de uma base de
dados.

													(CREATE, ALTER, DROP, TRUNCATE)

/*================================================================================================================================================================*/

CREATE - Comando usado para cria��o da estrutura de bases, tabelas e objetos.

Ex: Criando uma base de dados chamada test.*/

create database test

/*(Observa��o (Comandinho extra a seguir): USE - Utilizado para especificar o banco de dados no qual ocorrer� o contexto de execu��o dos comandos.)
Vamos utiliza-lo para indicar que os demais comandos que executaremos ser�o executados dentro de nossa base de dados test*/

use test

--Criando uma tabela chamada "pessoa" com um campo "nome" dentro da base de dados "test" 

create table pessoa(
nome varchar(15))

/*Supondo que precisamos adicionar mais um campo a esta mesma tabela para armazenar a idade das pessoas, precisaremos alterar a estrutura dela 
para inserir este novo campo, � a� que o seguinte comando entra em a��o:

ALTER - Comando que nos permite alterar a estrutura de bases de dados, tabelas e objetos*/

alter table pessoa add idade smallint 

-- Vamos realizar o comando SELECT que nos permitir� visualizar nossa tabela "pessoa" com os campos "nome" e "idade" presentes.
--(OBS: Ainda n�o temos nenhum dado inserido, apenas os campos criados para recebe-los. Abordaremos mais sobre o comando SELECT posteriormente).

select * from pessoa

/* DROP - Comando usado para deletar bases de dados, tabelas e objetos

Ex: Supondo que precisamos deletar nossa tabela "pessoa" */

drop table pessoa

/* Se tentarmos acessar nossa tabela pessoa novamente atrav�s do comando Select, receberemos um alerta: Invalid object name 'pessoa', que nos indica que 
a tabela que estamos tentando acessar n�o existe mais. Ou seja, foi deletada com sucesso.*/

select * from pessoa

/*Truncate - Comando que nos permite remover todos os registros de uma tabela, mantendo sua estrutura*/

-- Para demonstr�-lo, vamos recriar novamente nossa tabela "pessoa" e inserir alguns registros.

--recriando a tabela "pessoa" com campos de "nome" e "idade"

create table pessoa(
nome varchar(15),
idade smallint)

/*inserindo alguns registros (N�o se preocupe caso n�o esteja familiarizdo com o comando insert, abordaremos mais sobre ele posteriormente neste guia tendo em
vista que ele faz parte da categoria de comando DML)*/

insert into pessoa (nome, idade) values ('Pedro',22),('Joao',25),('Marcos',27)

--vamos ver como ficou nossa tabela com os registros

select * from pessoa

--vamos agora executar o comando truncate

truncate table pessoa

--vamos executar o comando select novamente para conferir como ficou nossa tabela

select * from pessoa

--Vemos que todos os registros foram removidos de uma unica vez.

/*================================================================================================================================================================*/

/*DML - Data Manipulation Language - Comandos para manipula��o de dados em nossas tabelas que est�o em nossa base de dados test

														(INSERT, UPDATE, DELETE)*/

/*================================================================================================================================================================*/

--INSERT - Comando utilizado para inserir dados em tabelas

/*Inserindo os dados com o comando INSERT (Note a sintaxe. Especificamos a tabela, os campos nos quais queremos inserir os dados e posteriormente os valores em 
suas ordens respectivas)*/

insert into pessoa (nome, idade) values ('Gabriel',20)

/*Podemos tamb�m realizar uma inser��o de dados diretamente sem especificarmos as colunas como no comando abaixo, todavia, precisamos respeitar a ordem das
colunas. Assim o sql saber� implicitamente as respectivas colunas nas quais os dados devem ser inseridos.
*/

insert into pessoa values ('Otavio',14)

--Vamos utilizar novamente o comando SELECT para a visualiza��o da nossa tabela. Desta vez contendo os dados que inserimos.

select * from pessoa

/*Supondo agora que precisamos alterar a idade do Otavio, pois o mesmo possui 18 anos e n�o 14 como foi inserido na tabela.
Neste caso, temos o seguinte comando para nos ajudar:

--UPDATE - Comando utilizado para alterar o valor de dados em nossas tabelas.

(Note a sintaxe: utilizamos o comando UPDATE seguido do nome da tabela no qual ocorrer� a mudan�a no valor do dado (neste caso, na
nossa tabela de pessoa),posteriormente o comando SET e em seguida a coluna na qual queremos alterar o valor do dado (que neste caso � "idade"), 
informamos o novo valor do dado usando o sinal de igual (=) que indica uma atribui��o de valor e por fim utilizamos a cl�usula WHERE para especificar
a condi��o, ou seja, onde queremos que o dado seja alterado, neste caso queremos mudar a idade do Otavio, portanto, informamos que onde o nome for igual a Otavio,
a idade do mesmo dever� ser alterada para 18.
)*/

update pessoa set idade = 18 where nome = 'Otavio'

--Novamente utilizando o Select para conferir a altera��o

select * from pessoa

--idade alterada com sucesso.

/*Vamos supor agora que precisamos excluir os dados do Otavio, para isso usamos o comando abaixo:*/

--DELETE - Comando utilizado para deletar dados de nossas tabelas

/*(Novamente observe a sintaxe. Primeiramente o comando DELETE seguido do comando FROM mais o nome da tabela na qual se deseja remover o registro
(tabela "pessoa") e em seguida o comando WHERE aparece indicando com base em qual parametro queremos deletar a linha de registro.
Neste caso, queremos deletar os registros do Otavio, ou seja, onde o campo nome da tabela for igual Otavio, esta ser� a linha exclu�da.*/

delete from pessoa where nome ='Otavio'

--Comando select para visualiza��o da tabela, perceba que o Otavio foi exclupido

select * from pessoa

/*================================================================================================================================================================*/

/*DCL - Data Control Language - Comandos utilizados para controlar o acesso aos dados

															(GRANT, DENY, REVOKE)

/*================================================================================================================================================================*/

LOGINS E USUARIOS - Para dar um pouco mais de contexto, dentro do SQL Server temos Logins e Usu�rios associados a esses logins.
Os Logins correspondem as credencias (login e senha) necess�rias que uma pessoa precisa para se conectar a inst�ncia no sql server no servidor.
Os Usu�rios associam-se aos login a n�vel de base de dados.

Exemplo: Vamos supor que um funcion�rio de uma empresa precise se conectar a dois bancos de dados A e B que est�o em um mesmo servidor, entretando, no banco de 
dados A ele deve ter permiss�es para ler e escrever dados e no banco B, ele poder� apenas ler dados.
Neste caso, este funcion�rio possuir� um �NICO login (login e senha) para se conectar a instancia do sql neste servidor, e DOIS usuarios associados e este mesmo login, 
um usuario para a base A com as permiss�es de leitura e escrita e outro usuario associado ao mesmo login para a base B, por�m apenas com a permiss�o de leitura. 

(usuario na base A (leitura e escrita) --> login  <-- usuario na base B (leitura)) ambos os usuarios pertencendo ao mesmo login, ou seja, ao mesmo
funcion�rio.

Para exemplificarmos o funcionamento dos comandos DCL, vamos criar um login e um usuario para associarmos a este login e acessar a nossa base de
dados "test" e nossa tabela "pessoa"
*/

--Criando um Login (nome do usuario: user1 / senha: 123)
create login user1
with password ='123'

--Criando um Usu�rio user1 e o associando com o Login acima
create user user1
for login user1

/*Neste caso o nome do usuario (user1) est� igual ao login (user1) para facilitar a identifica��o, todavia isto n�o � mandat�rio, o nome do usuario pode ser
diferente.

Uma vez que o novo usuario (user1) foi criado, podemos nos autenticar e abrir uma nova janela de conex�o para execu��o de comandos.

V� at� o object explorer > connect object explorer (�cone da tomada) > realize o login com as credencias criadas acima.
Perceba que uma nova conex�o foi criada com o novo login. 

Agora vamos abrir uma nova janela de conex�o para execu��o de comandos com o novo usuario.

Clique com o bot�o esquerdo do mouse em cima de nossa nova conex�o e em seguida clique em "New Query" (um dos icones que aparecem no canto superior esquerdo do SSMS),
ou clique com o bot�o direito na nova conex�o e em seguida selecione "New Query" dentre as op��es que aparecer�o no menu.
*/

--Na nova janela com o novo usuario (user1) tente se connectar a base test criada anteriormente neste guia usando os seguintes comandos

use test --(copie e execute esta linha comando na nova janela)

--agora tente acessar nossa tabela "pessoa" para ver os dados

select * from pessoa --(copie e execute esta linha comando na nova janela)

--Perceba que ocorreu um alerta "The SELECT permission was denied on the object 'pessoa', database 'test', schema 'dbo'. 

--Isso indica que nosso usu�rio n�o tem permiss�o para visualizar nossa tabela "pessoa". Para isso se faz necess�rio o uso dos comandos DCL

--GRANT - Comando utilizado para conceder privil�gios aos usu�rios

--Concedendo permiss�o de leitura ao user1 para acessar a tabela "pessoa"

grant select on pessoa to user1

--Execute novamente o comando select acima com o user1 na outra janela e perceba que o mesmo agora possui acesso para visualizar os dados.

--Podemos tamb�m inserir dados atraves do usuario user1, basta concedermos a permiss�o necessaria 

grant insert on pessoa to user1

--Comando para inserir os dados

insert into pessoa (nome, idade) values ('Joao',22) --(copie e execute esta linha comando na nova janela).

--Execute novamente o comando select na outra janela e veja que os dados foram inseridos.

--DENY - Comando utilizado para conceder restri��es aos usu�rios

/*Supondo que agora n�s precisamos restringir a permiss�o de inser��o de dados na tabela "pessoa" para o user1*/

deny insert on pessoa to user1

/*Se rodarmos o comando seguinte com o user1 e tentarmos inserir um novo registro receberemos um alerta informando de que a permiss�o foi negada:
The INSERT permission was denied on the object 'pessoa', database 'test', schema 'dbo'.*/

insert into pessoa (nome, idade) values ('Caio',30) --(copie e execute esta linha comando na nova janela).

/*Podemos tamb�m utilizar o seguinte comando para revogar privil�gios ou restri��es*/

--REVOKE - Comando utilizado para revogar privil�gios ou restri��es de usu�rios.

--Vamos revogar a permiss�o de select para o user1 na nossa "" pessoa

revoke select on pessoa to user1

/*Agora se tentarmos selecionar a tabela "pessoa" atrav�s do user1 receberemos o seguinte alerta:
The SELECT permission was denied on the object 'pessoa', database 'test', schema 'dbo'.
Indicando que a permiss�o foi revogada com sucesso.*/

select * from pessoa --(copie e execute esta linha comando na nova janela).

--***Comandinhos extras para excluir o Login e o Usuario ap�s os exemplos (caso necessario)

--excluindo o usuario
drop user user1

--excluindo o login (aten��o para exclus�o de um login, este login n�o pode possuir sess�es ativas)
drop login user1

/*Caso n�o consiga excluir o login. Execute a procedure abaixo:

Com ela podemos observar as conex�es que est�o abertas no momento. Localize no campo "loginame" o nosso usuario user1 e observe o valor da coluna spid equivalente.
Esta coluna corresponde ao id daquela conex�o"*/

sp_who

/*Agora execute o comando kill para matar aquela sess�o da seguinte maneira:

kill + valor da coluna spid para o loginame user1

Exemplo se eu quero deletar a conex�o onde o spid tem o valor 60, o comando seria:

kill 60

*/

kill -- (acrescente o valor da coluna spid desejado)

--Ap�s isso, tente excluir o login novamente.

/*================================================================================================================================================================*/

/*DQL - Data Query Language - Comando para sele��o de dados

															(SELECT)

/*================================================================================================================================================================*/

SELECT - Comando utilizado para sele��o de dados das tabelas

Caracter (*) - Indica que todas as colunas de uma tabela devem ser retornadas */

select * from pessoa

/*Tamb�m podemos realizar sele��es onde temos como retorno apenas colunas espec�ficas que desejamos. 
Supondo que queremos obervar apenas a coluna "nome" da tabela "pessoa".*/

select nome from pessoa

/*Podemos realizar consultas informando parametr�s atrav�s da clausula WHERE. Utilizamos esta cl�usula para informarmos onde, ou com base em qual valor/parametro ou
condi��o queremos que uma determinada a��o seja executada.

No seguinte comando, estamos selecionando todas as colunas de nossa tabela "pessoa" onde a coluna nome � igual a Gabriel*/

select * from pessoa where nome ='Gabriel'

/*Tamb�m podemos combinar a sele��o espec�fica de colunas com a cl�usula WHERE.

Neste seguinte comando, estamos dizendo que queremos apenas o valor da coluna nome onde o valor da coluna idade � igual a 22 na mesma linha de registro 
correspondente*/

select nome from pessoa where idade = 22

--***Comandinho extra para exluir a base de dados ap�s a conclus�o do tutorial 

/*Para a exclus�o da base de dados, a mesma n�o pode estar em uso. Ent�o precisamos mudar o nosso contexto de execu��o com o comando USE.

Vamos alterar nosso contexto de execu��o para a base master, uma base de dados padr�o do sistema.
Com isso dizemos que os seguintes comandos n�o ser�o mais executados dentro de nossa base "test" e a partir disso poderemos exclu�-la*/

use master --alterando o contexto 

drop database test -- excluindo a base

--Enfim, � isso, espero ter ajudado. Obrigado.