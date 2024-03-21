create database bosonfacul

use bosonfacul

use master;
drop database bosonfacul

create table departamento(
	cod_departamento int identity(1,1) primary key,
	nome_departamento varchar(20) not null
);

create table curso(
	cod_curso int identity(1,1) primary key,
	nome_curso varchar(20),
	cod_departamento int,
	constraint fk_curso_cod_departamento foreign key (cod_departamento) references departamento(cod_departamento)
);

create table professor(
	cod_professor int identity(1,1) primary key,
	nome_professor varchar(20) not null ,
	sobrenome_professor varchar(50) not null,
	status bit,
	cod_departamento int,
	constraint fk_prof_cod_departamento foreign key (cod_departamento) references departamento(cod_departamento)
);


create table disciplina(
	cod_disciplina int identity(1,1) primary key,
	nome_disciplina varchar(20),
	cod_departamento int not null,
	carga_horaria int not null,
	descricao varchar(50),
	num_alunos int not null,
	cod_disciplina_depende int,
	constraint fk_dis_cod_departamento foreign key (cod_departamento) references departamento(cod_departamento),
	constraint fk_cod_disciplina foreign key (cod_disciplina_depende) references disciplina(cod_disciplina)
);

create table prof_disciplina(
	cod_professor int not null,
	cod_disciplina int not null,
	primary key (cod_professor,cod_disciplina),
	constraint fk_prof_disciplina_prof foreign key (cod_professor) references professor(cod_professor), 
	constraint fk_prof_disciplina_dis foreign key (cod_disciplina) references disciplina(cod_disciplina)
);

create table curso_disciplina(
	cod_curso int not null,
	cod_disciplina int not null,
	primary key(cod_curso,cod_disciplina),
	constraint fk_curso_disciplina_curso foreign key(cod_curso) references curso(cod_curso), 
	constraint fk_curso_disciplina_dis foreign key (cod_disciplina) references disciplina(cod_disciplina)
);

create table turma(
	cod_turma int identity(1,1) primary key,
	cod_curso int,
	periodo varchar(8),
	num_alunos int,
	data_inicio date,
	data_fim date,
	constraint fk_turma_curso foreign key (cod_curso) references curso(cod_curso)
);

create table aluno(
	ra int identity(1,1) primary key,
	nome_aluno varchar(20) not null,
	sobrenome_aluno varchar(20) not null,
	cpf varchar(11) unique not null,
	status bit,
	cod_turma int,
	sexo varchar(1),
	cod_curso int,
	nome_pai varchar(50) not null,
	nome_mae varchar(50) not null,
	email varchar(50) not null,
	whatsapp varchar(50) not null,
	constraint fk_aluno_turma foreign key (cod_turma) references turma(cod_turma),
	constraint fk_aluno_curso foreign key (cod_curso) references curso(cod_curso)
);

create table aluno_disc(
	ra int not null,
	cod_disciplina int not null,
	primary key(ra,cod_disciplina),
	constraint fk_aluno_disc_aluno foreign key (ra) references aluno(ra),
	constraint fk_aluno_disc_dis foreign key (cod_disciplina) references disciplina(cod_disciplina)
);

create table historico(
	cod_historico int identity(1,1) primary key,
	ra int not null,
	data_inicio date not null,
	data_final date,
	constraint fk_historico_aluno foreign key (ra) references aluno(ra)
);

create table disc_hist(
	cod_historico int not null,
	cod_disciplina int not null,
	primary key(cod_historico,cod_disciplina),
	nota float(4),
	frequencia int,
	constraint fk_disc_hist_historico foreign key (cod_historico) references historico(cod_historico),
	constraint fk_disc_hist_disciplina foreign key (cod_disciplina) references disciplina(cod_disciplina)
);

create table tipo_telefone(
	cod_tipo_telefone int identity(1,1) primary key,
	tipo_telefone varchar(8)
);

create table telefones_aluno(
	cod_telefone_alunos int identity(1,1) primary key,
	ra int not null,
	cod_tipo_telefone int not null,
	num_telefone varchar(20) not null,
	constraint fk_telefones_aluno_aluno foreign key (ra) references aluno(ra),
	constraint fk_telefones_aluno_tipo_tel foreign key (cod_tipo_telefone) references tipo_telefone(cod_tipo_telefone)
);

create table tipo_logradouro(
	cod_tipo_logradouro int identity(1,1) primary key,
	tipo_logradouro varchar(11)
);

create table endereco_aluno(
	cod_endereco_aluno int identity(1,1) primary key,
	ra int not null,
	cod_tipo_logradouro int not null,
	nome_rua varchar(50) not null,
	num_rua int not null,
	complemento varchar(20) null,
	cep varchar(8) not null,
	constraint fk_endereco_aluno_aluno foreign key (ra) references aluno(ra),
	constraint fk_endereco_aluno_tipo_log foreign key(cod_tipo_logradouro) references tipo_logradouro(cod_tipo_logradouro)
);


-- Carga de Dados para Testes
INSERT INTO Departamento (Nome_Departamento)
VALUES
('Ciências Humanas'),
('Matemática'),
('Biológicas'),
('Estágio');

INSERT INTO Professor (Nome_Professor, Sobrenome_Professor, Status, Cod_Departamento)
VALUES
('Fábio', 'dos Reis', 0, 2),
('Sophie', 'Allemand', 1, 1),
('Monica', 'Barroso', 1, 3);

INSERT INTO Curso (Nome_Curso, Cod_Departamento)
VALUES
('Matemática', 2),
('Psicologia', 1),
('Análise de Sistemas', 2),
('Biologia', 3),
('História', 1),
('Engenharia', 2);

INSERT INTO Turma (Cod_Curso, Periodo, Num_Alunos, Data_Inicio, Data_Fim)
VALUES
(2, 'Manhã', 20, '2016-05-12', '2017-10-15'),
(1, 'Noite', 10, '2014-05-12', '2020-03-05'),
(3, 'Tarde', 15, '2012-05-12', '2014-05-10');

INSERT INTO Disciplina (Nome_Disciplina, Cod_Departamento, Carga_Horaria, Descrição, Num_Alunos)
VALUES
('Raciocínio Lógico', 2, 1200, 'Desenvolver o raciocínio lógico', 50),
('Psicologia Cognitiva', 1, 1400, 'Entender o funcionamento do aprendizado', 30),
('Programação em C', 2, 1200, 'Aprender uma linguagem de programação', 20),
('Eletrônica Digital', 2, 300, 'Funcionamento de circuitos digitais', 30);

INSERT INTO Aluno (Nome_Aluno, Sobrenome_Aluno, CPF, Status, Cod_Turma, Sexo, Cod_Curso, Nome_Pai, Nome_Mae, Email, Whatsapp)
VALUES
('Marcos', 'Aurelio Martins', 14278914536, 1, 2, 'M', 3, 'Marcio Aurelio', 'Maria Aparecida', 'marcosaurelio@gmail.com', 946231249),
('Gabriel', 'Fernando de Almeida', 14470954536, 1, 1, 'M', 1, 'Adão Almeida', 'Fernanda Almeida', 'gabrielalmeida@yahoo.com', 941741247),
('Beatriz', 'Sonia Meneguel', 1520984537, 1, 3, 'F', 3, 'Samuel Meneguel', 'Gabriella Meneguel', 'batrizmene@hotmail.com', 945781412),
('Jorge', 'Soares', 14223651562, 1, 3, 'M', 4, 'João Soares', 'Maria Richter', 'jorgesoares@gmail.com', 925637857),
('Ana Paula', 'Ferretti', 32968914522, 1, 3, 'F', 5, 'Marcio Ferretti', 'Ana Hoffbahn', 'anapaulaferretti@hotmail.com', 974267423),
('Mônica', 'Yamaguti', 32988914510, 1, 2, 'F', 6, 'Wilson Oliveira', 'Fernanda Yamaguti', 'monyamaguti@outlook.com', 932619560);

INSERT INTO Aluno_Disc (RA, Cod_Disciplina)
VALUES
(3, 1),
(1, 2),
(2, 3),
(4, 3),
(5, 4),
(6, 1);

INSERT INTO Curso_Disciplina(Cod_Curso, Cod_Disciplina)
VALUES
(1, 1),
(2, 2),
(3, 3),
(6, 4);

INSERT INTO Prof_Disciplina(Cod_Professor, Cod_Disciplina)
VALUES
(2, 1),
(1, 2),
(3, 3),
(2, 4);

INSERT INTO Historico (RA, Data_Inicio, Data_Final)
VALUES
(2, '2016-05-12', '2017-10-15'),
(3, '2014-05-12', '2020-03-05'),
(1, '2010-05-12', '2012-05-10');

INSERT INTO Tipo_Logradouro (Tipo_Logradouro)
VALUES
('Rua'),
('Avenida'),
('Alameda'),
('Travessa');

INSERT INTO Endereco_Aluno (RA, Cod_Tipo_Logradouro, Nome_Rua, Num_Rua, Complemento, CEP)
VALUES
(2, 1, 'das Giestas', 255, 'Casa 02', 02854000),
(3, 3, 'Lorena', 10, 'Apto 15', 02945000),
(1, 2, 'do Cursino', 1248, '', 0851040),
(4, 1, 'das Heras', 495, '', 03563142),
(5, 3, 'Santos', 1856, '', 04523963),
(6, 4, 'Matão', 206, '', 04213650);


-- DML
alter table disc_hist alter column nota float(4);

insert into disc_hist(cod_historico,cod_disciplina,nota,frequencia)
values
(1,2,7,6),
(2,3,8.5,2),
(3,1,6.8,8);

insert into tipo_telefone(tipo_telefone)
values
('res'),
('com'),
('cel'),
('rec');

insert into telefones_aluno (ra, cod_tipo_telefone,num_telefone)
values
(1,1,28467853),
(2,1,24653298),
(2,3,996324521),
(3,1,36549875),
(3,3,994532165), 
(4,1,21956345),
(4,3,986321452),
(5,1,24569832),
(5,2,23854696),
(6,1,27698753);

select * from disc_hist

select aluno.nome_aluno, aluno.ra
from aluno
inner join turma
on aluno.cod_turma=turma.cod_turma
where
turma.cod_curso != aluno.cod_curso

declare @a varchar(1)='s'
declare @b varchar(1)='a'
select(concat (@a,'',@b));

--de acordo com o video

-- 1. RAs, Nomes e Sobrenomes dos Alunos, Nomes dos Cursos e Períodos das Turmas, ordenados pelo primeiro nome de aluno:

select aluno.ra,aluno.nome_aluno,aluno.sobrenome_aluno, curso.nome_curso, turma.periodo
from aluno
inner join curso
on aluno.cod_curso=curso.cod_curso
inner join turma
on aluno.cod_turma=turma.cod_turma
order by nome_aluno

SELECT A.RA, A.Nome_Aluno, A.Sobrenome_Aluno, T.Periodo, C.Nome_Curso
FROM Aluno A
INNER JOIN Curso C
ON C.Cod_Curso = A.Cod_Curso
INNER JOIN Turma T
ON A.Cod_Turma = T.Cod_Turma
ORDER BY A.Nome_Aluno;


-- 2. Todas as disciplinas cursadas por um aluno, com suas respectivas notas:
-- Aluno: RA 3 (Beatriz)

select aluno.nome_aluno, aluno.sobrenome_aluno, disciplina.nome_disciplina ,disc_hist.nota
from aluno
inner join aluno_disc
on aluno.ra=aluno_disc.ra
inner join disciplina
on disciplina.cod_disciplina=aluno_disc.cod_disciplina
inner join historico
on aluno.ra=historico.ra
inner join disc_hist
on disc_hist.cod_historico=historico.cod_historico --and disc_hist.cod_disciplina=disciplina.cod_disciplina
where aluno.ra=3

SELECT A.Nome_Aluno, A.Sobrenome_Aluno, D.Nome_Disciplina, DH.Nota
FROM Aluno A
INNER JOIN Aluno_Disc AD
ON A.RA = AD.RA
INNER JOIN Disciplina D
ON D.Cod_Disciplina = AD.Cod_Disciplina
INNER JOIN Historico H
ON A.RA = H.RA
INNER JOIN Disc_Hist DH
ON H.Cod_Historico = DH.Cod_Historico
WHERE A.RA = 3;





-- 3. Nomes e sobrenomes dos professores, e disciplinas que ministram com suas cargas horárias:

select p.nome_professor, p.sobrenome_professor, d.nome_disciplina, d.carga_horaria
from professor p
inner join prof_disciplina pd
on p.cod_professor=pd.cod_professor
inner join disciplina d
on d.cod_disciplina= pd.cod_disciplina
order by d.nome_disciplina


SELECT P.Nome_Professor, P.Sobrenome_Professor,D.Nome_Disciplina, D.Carga_Horaria
FROM Professor P
INNER JOIN Prof_Disciplina PD
ON P.Cod_Professor = PD.Cod_Professor
INNER JOIN Disciplina D
ON D.Cod_Disciplina = PD.Cod_Disciplina
ORDER BY D.Nome_Disciplina;



-- 4. Gerar "relatório" com nomes, sobrenomes, CPF dos alunos, tipos e números de telefones e endereços completos.

select aluno.nome_aluno, aluno.sobrenome_aluno, aluno.cpf, tipo_telefone.tipo_telefone,telefones_aluno.num_telefone,
endereco_aluno.nome_rua,endereco_aluno.num_rua,endereco_aluno.complemento,endereco_aluno.cep,tipo_logradouro.tipo_logradouro
from aluno
inner join telefones_aluno
on aluno.ra=telefones_aluno.ra
inner join tipo_telefone
on telefones_aluno.cod_tipo_telefone=tipo_telefone.cod_tipo_telefone
inner join endereco_aluno
on aluno.ra=endereco_aluno.ra
inner join tipo_logradouro
on endereco_aluno.cod_tipo_logradouro=tipo_logradouro.cod_tipo_logradouro


SELECT CONCAT(A.Nome_Aluno, ' ', A.Sobrenome_Aluno) AS Aluno, A.CPF, T.Num_Telefone, CONCAT(TL.Tipo_Logradouro, ' ', E.Nome_Rua, ', ', E.Num_Rua) AS Logradouro, E.Complemento, E.CEP
FROM Aluno A
INNER JOIN Telefones_Aluno T
ON A.RA = T.RA
INNER JOIN Endereco_Aluno E
ON A.RA = E.RA
INNER JOIN Tipo_Logradouro TL
ON TL.Cod_Tipo_Logradouro = E.Cod_Tipo_Logradouro;



-- 5. Listar as disciplinas, indicando seus departamentos, cursos e professores

select disciplina.nome_disciplina, departamento.nome_departamento, curso.nome_curso, professor.nome_professor
from disciplina
inner join departamento
on disciplina.cod_departamento = departamento.cod_departamento
inner join curso_disciplina
on disciplina.cod_disciplina=curso_disciplina.cod_disciplina
inner join curso
on curso_disciplina.cod_curso=curso.cod_curso
inner join prof_disciplina
on disciplina.cod_disciplina = prof_disciplina.cod_disciplina
inner join professor
on prof_disciplina.cod_professor=professor.cod_professor
order by disciplina.nome_disciplina


SELECT Di.Nome_Disciplina, C.Nome_Curso,
CONCAT(P.Nome_Professor, ' ', P.Sobrenome_Professor) AS Docente, De.Nome_Departamento
FROM Disciplina Di
INNER JOIN Departamento De
ON Di.Cod_Departamento = De.Cod_Departamento
INNER JOIN Prof_Disciplina PD
ON Di.Cod_Disciplina = PD.Cod_Disciplina
INNER JOIN Professor P
ON P.Cod_Professor = PD.Cod_Professor
INNER JOIN Curso_Disciplina CD
ON Di.Cod_Disciplina = CD.Cod_Disciplina
INNER JOIN Curso C
ON C.Cod_Curso = CD.Cod_Curso
ORDER BY Di.Nome_Disciplina;
 

