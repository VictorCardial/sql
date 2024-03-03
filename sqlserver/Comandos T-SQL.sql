/*SQL - Structured Query Language - Linguagem de consulta estruturada para bancos de dados

T-SQL - Transact SQL - "Dialeto" SQL utilizado no SQL Server 

No ambiente do SQL Server temos algumas categorias de comandos (DDL,DML,DCL,DQL) que iremos abordar durante este script.
Abordaremos os comandos mais comuns dentro de cada uma destas categorias.*/

/*================================================================================================================================================================*/

/*OBS: Para a execução dos comandos deste tutorial dentro do SSMS (sql server management studio), selecione os comandos segurando e arrastando com o botão esquerdo 
do mouse e posteriormente clicando no botão "Execute" do menu (ícone de "play"), no canto superior esquerdo ou após selecionar os comandos, precione a tecla F5.*/

/*================================================================================================================================================================*/

/*DDL - Data Definition Language - Comandos utilizados que nos permitem criar, alterar e excluir a estrutura de dados dentro de uma base de
dados.

													(CREATE, ALTER, DROP, TRUNCATE)

/*================================================================================================================================================================*/

CREATE - Comando usado para criação da estrutura de bases, tabelas e objetos.

Ex: Criando uma base de dados chamada test.*/

create database test

/*(Observação (Comandinho extra a seguir): USE - Utilizado para especificar o banco de dados no qual ocorrerá o contexto de execução dos comandos.)
Vamos utiliza-lo para indicar que os demais comandos que executaremos serão executados dentro de nossa base de dados test*/

use test

--Criando uma tabela chamada "pessoa" com um campo "nome" dentro da base de dados "test" 

create table pessoa(
nome varchar(15))

/*Supondo que precisamos adicionar mais um campo a esta mesma tabela para armazenar a idade das pessoas, precisaremos alterar a estrutura dela 
para inserir este novo campo, é aí que o seguinte comando entra em ação:

ALTER - Comando que nos permite alterar a estrutura de bases de dados, tabelas e objetos*/

alter table pessoa add idade smallint 

-- Vamos realizar o comando SELECT que nos permitirá visualizar nossa tabela "pessoa" com os campos "nome" e "idade" presentes.
--(OBS: Ainda não temos nenhum dado inserido, apenas os campos criados para recebe-los. Abordaremos mais sobre o comando SELECT posteriormente).

select * from pessoa

/* DROP - Comando usado para deletar bases de dados, tabelas e objetos

Ex: Supondo que precisamos deletar nossa tabela "pessoa" */

drop table pessoa

/* Se tentarmos acessar nossa tabela pessoa novamente através do comando Select, receberemos um alerta: Invalid object name 'pessoa', que nos indica que 
a tabela que estamos tentando acessar não existe mais. Ou seja, foi deletada com sucesso.*/

select * from pessoa

/*Truncate - Comando que nos permite remover todos os registros de uma tabela, mantendo sua estrutura*/

-- Para demonstrá-lo, vamos recriar novamente nossa tabela "pessoa" e inserir alguns registros.

--recriando a tabela "pessoa" com campos de "nome" e "idade"

create table pessoa(
nome varchar(15),
idade smallint)

/*inserindo alguns registros (Não se preocupe caso não esteja familiarizdo com o comando insert, abordaremos mais sobre ele posteriormente neste guia tendo em
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

/*DML - Data Manipulation Language - Comandos para manipulação de dados em nossas tabelas que estão em nossa base de dados test

														(INSERT, UPDATE, DELETE)*/

/*================================================================================================================================================================*/

--INSERT - Comando utilizado para inserir dados em tabelas

/*Inserindo os dados com o comando INSERT (Note a sintaxe. Especificamos a tabela, os campos nos quais queremos inserir os dados e posteriormente os valores em 
suas ordens respectivas)*/

insert into pessoa (nome, idade) values ('Gabriel',20)

/*Podemos também realizar uma inserção de dados diretamente sem especificarmos as colunas como no comando abaixo, todavia, precisamos respeitar a ordem das
colunas. Assim o sql saberá implicitamente as respectivas colunas nas quais os dados devem ser inseridos.
*/

insert into pessoa values ('Otavio',14)

--Vamos utilizar novamente o comando SELECT para a visualização da nossa tabela. Desta vez contendo os dados que inserimos.

select * from pessoa

/*Supondo agora que precisamos alterar a idade do Otavio, pois o mesmo possui 18 anos e não 14 como foi inserido na tabela.
Neste caso, temos o seguinte comando para nos ajudar:

--UPDATE - Comando utilizado para alterar o valor de dados em nossas tabelas.

(Note a sintaxe: utilizamos o comando UPDATE seguido do nome da tabela no qual ocorrerá a mudança no valor do dado (neste caso, na
nossa tabela de pessoa),posteriormente o comando SET e em seguida a coluna na qual queremos alterar o valor do dado (que neste caso é "idade"), 
informamos o novo valor do dado usando o sinal de igual (=) que indica uma atribuição de valor e por fim utilizamos a cláusula WHERE para especificar
a condição, ou seja, onde queremos que o dado seja alterado, neste caso queremos mudar a idade do Otavio, portanto, informamos que onde o nome for igual a Otavio,
a idade do mesmo deverá ser alterada para 18.
)*/

update pessoa set idade = 18 where nome = 'Otavio'

--Novamente utilizando o Select para conferir a alteração

select * from pessoa

--idade alterada com sucesso.

/*Vamos supor agora que precisamos excluir os dados do Otavio, para isso usamos o comando abaixo:*/

--DELETE - Comando utilizado para deletar dados de nossas tabelas

/*(Novamente observe a sintaxe. Primeiramente o comando DELETE seguido do comando FROM mais o nome da tabela na qual se deseja remover o registro
(tabela "pessoa") e em seguida o comando WHERE aparece indicando com base em qual parametro queremos deletar a linha de registro.
Neste caso, queremos deletar os registros do Otavio, ou seja, onde o campo nome da tabela for igual Otavio, esta será a linha excluída.*/

delete from pessoa where nome ='Otavio'

--Comando select para visualização da tabela, perceba que o Otavio foi exclupido

select * from pessoa

/*================================================================================================================================================================*/

/*DCL - Data Control Language - Comandos utilizados para controlar o acesso aos dados

															(GRANT, DENY, REVOKE)

/*================================================================================================================================================================*/

LOGINS E USUARIOS - Para dar um pouco mais de contexto, dentro do SQL Server temos Logins e Usuários associados a esses logins.
Os Logins correspondem as credencias (login e senha) necessárias que uma pessoa precisa para se conectar a instância no sql server no servidor.
Os Usuários associam-se aos login a nível de base de dados.

Exemplo: Vamos supor que um funcionário de uma empresa precise se conectar a dois bancos de dados A e B que estão em um mesmo servidor, entretando, no banco de 
dados A ele deve ter permissões para ler e escrever dados e no banco B, ele poderá apenas ler dados.
Neste caso, este funcionário possuirá um ÚNICO login (login e senha) para se conectar a instancia do sql neste servidor, e DOIS usuarios associados e este mesmo login, 
um usuario para a base A com as permissões de leitura e escrita e outro usuario associado ao mesmo login para a base B, porém apenas com a permissão de leitura. 

(usuario na base A (leitura e escrita) --> login  <-- usuario na base B (leitura)) ambos os usuarios pertencendo ao mesmo login, ou seja, ao mesmo
funcionário.

Para exemplificarmos o funcionamento dos comandos DCL, vamos criar um login e um usuario para associarmos a este login e acessar a nossa base de
dados "test" e nossa tabela "pessoa"
*/

--Criando um Login (nome do usuario: user1 / senha: 123)
create login user1
with password ='123'

--Criando um Usuário user1 e o associando com o Login acima
create user user1
for login user1

/*Neste caso o nome do usuario (user1) está igual ao login (user1) para facilitar a identificação, todavia isto não é mandatório, o nome do usuario pode ser
diferente.

Uma vez que o novo usuario (user1) foi criado, podemos nos autenticar e abrir uma nova janela de conexão para execução de comandos.

Vá até o object explorer > connect object explorer (ícone da tomada) > realize o login com as credencias criadas acima.
Perceba que uma nova conexão foi criada com o novo login. 

Agora vamos abrir uma nova janela de conexão para execução de comandos com o novo usuario.

Clique com o botão esquerdo do mouse em cima de nossa nova conexão e em seguida clique em "New Query" (um dos icones que aparecem no canto superior esquerdo do SSMS),
ou clique com o botão direito na nova conexão e em seguida selecione "New Query" dentre as opções que aparecerão no menu.
*/

--Na nova janela com o novo usuario (user1) tente se connectar a base test criada anteriormente neste guia usando os seguintes comandos

use test --(copie e execute esta linha comando na nova janela)

--agora tente acessar nossa tabela "pessoa" para ver os dados

select * from pessoa --(copie e execute esta linha comando na nova janela)

--Perceba que ocorreu um alerta "The SELECT permission was denied on the object 'pessoa', database 'test', schema 'dbo'. 

--Isso indica que nosso usuário não tem permissão para visualizar nossa tabela "pessoa". Para isso se faz necessário o uso dos comandos DCL

--GRANT - Comando utilizado para conceder privilégios aos usuários

--Concedendo permissão de leitura ao user1 para acessar a tabela "pessoa"

grant select on pessoa to user1

--Execute novamente o comando select acima com o user1 na outra janela e perceba que o mesmo agora possui acesso para visualizar os dados.

--Podemos também inserir dados atraves do usuario user1, basta concedermos a permissão necessaria 

grant insert on pessoa to user1

--Comando para inserir os dados

insert into pessoa (nome, idade) values ('Joao',22) --(copie e execute esta linha comando na nova janela).

--Execute novamente o comando select na outra janela e veja que os dados foram inseridos.

--DENY - Comando utilizado para conceder restrições aos usuários

/*Supondo que agora nós precisamos restringir a permissão de inserção de dados na tabela "pessoa" para o user1*/

deny insert on pessoa to user1

/*Se rodarmos o comando seguinte com o user1 e tentarmos inserir um novo registro receberemos um alerta informando de que a permissão foi negada:
The INSERT permission was denied on the object 'pessoa', database 'test', schema 'dbo'.*/

insert into pessoa (nome, idade) values ('Caio',30) --(copie e execute esta linha comando na nova janela).

/*Podemos também utilizar o seguinte comando para revogar privilégios ou restrições*/

--REVOKE - Comando utilizado para revogar privilégios ou restrições de usuários.

--Vamos revogar a permissão de select para o user1 na nossa "" pessoa

revoke select on pessoa to user1

/*Agora se tentarmos selecionar a tabela "pessoa" através do user1 receberemos o seguinte alerta:
The SELECT permission was denied on the object 'pessoa', database 'test', schema 'dbo'.
Indicando que a permissão foi revogada com sucesso.*/

select * from pessoa --(copie e execute esta linha comando na nova janela).

--***Comandinhos extras para excluir o Login e o Usuario após os exemplos (caso necessario)

--excluindo o usuario
drop user user1

--excluindo o login (atenção para exclusão de um login, este login não pode possuir sessões ativas)
drop login user1

/*Caso não consiga excluir o login. Execute a procedure abaixo:

Com ela podemos observar as conexões que estão abertas no momento. Localize no campo "loginame" o nosso usuario user1 e observe o valor da coluna spid equivalente.
Esta coluna corresponde ao id daquela conexão"*/

sp_who

/*Agora execute o comando kill para matar aquela sessão da seguinte maneira:

kill + valor da coluna spid para o loginame user1

Exemplo se eu quero deletar a conexão onde o spid tem o valor 60, o comando seria:

kill 60

*/

kill -- (acrescente o valor da coluna spid desejado)

--Após isso, tente excluir o login novamente.

/*================================================================================================================================================================*/

/*DQL - Data Query Language - Comando para seleção de dados

															(SELECT)

/*================================================================================================================================================================*/

SELECT - Comando utilizado para seleção de dados das tabelas

Caracter (*) - Indica que todas as colunas de uma tabela devem ser retornadas */

select * from pessoa

/*Também podemos realizar seleções onde temos como retorno apenas colunas específicas que desejamos. 
Supondo que queremos obervar apenas a coluna "nome" da tabela "pessoa".*/

select nome from pessoa

/*Podemos realizar consultas informando parametrôs através da clausula WHERE. Utilizamos esta cláusula para informarmos onde, ou com base em qual valor/parametro ou
condição queremos que uma determinada ação seja executada.

No seguinte comando, estamos selecionando todas as colunas de nossa tabela "pessoa" onde a coluna nome é igual a Gabriel*/

select * from pessoa where nome ='Gabriel'

/*Também podemos combinar a seleção específica de colunas com a cláusula WHERE.

Neste seguinte comando, estamos dizendo que queremos apenas o valor da coluna nome onde o valor da coluna idade é igual a 22 na mesma linha de registro 
correspondente*/

select nome from pessoa where idade = 22

--***Comandinho extra para exluir a base de dados após a conclusão do tutorial 

/*Para a exclusão da base de dados, a mesma não pode estar em uso. Então precisamos mudar o nosso contexto de execução com o comando USE.

Vamos alterar nosso contexto de execução para a base master, uma base de dados padrão do sistema.
Com isso dizemos que os seguintes comandos não serão mais executados dentro de nossa base "test" e a partir disso poderemos excluí-la*/

use master --alterando o contexto 

drop database test -- excluindo a base

--Enfim, é isso, espero ter ajudado. Obrigado.