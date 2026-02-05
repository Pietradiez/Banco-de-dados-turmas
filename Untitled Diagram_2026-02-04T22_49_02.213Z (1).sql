CREATE TABLE IF NOT EXISTS "alunos" (
	"matricula" VARCHAR(50) NOT NULL UNIQUE,
	"nome" VARCHAR(150) NOT NULL,
	"data nascimento" DATE NOT NULL,
	"email" VARCHAR(150) NOT NULL UNIQUE,
	PRIMARY KEY("matricula")
);




CREATE TABLE IF NOT EXISTS "Cursos" (
	"cod_curso" VARCHAR(255) NOT NULL UNIQUE,
	"nome" VARCHAR(150) NOT NULL,
	"qtd_semestre" INTEGER NOT NULL,
	PRIMARY KEY("cod_curso")
);




CREATE TABLE IF NOT EXISTS "Disciplina " (
	"cod_disciplina " VARCHAR(255) NOT NULL UNIQUE,
	"nome" VARCHAR(150),
	"carga horaria " INTEGER,
	"cod_curso" VARCHAR(255),
	PRIMARY KEY("cod_disciplina ")
);




CREATE TABLE IF NOT EXISTS "Turmas " (
	"cod_turma" VARCHAR(255) NOT NULL UNIQUE,
	"ano" INTEGER,
	"cod_curso" VARCHAR(255),
	PRIMARY KEY("cod_turma")
);




CREATE TABLE IF NOT EXISTS "professores " (
	"ni_professor" VARCHAR(255) NOT NULL UNIQUE,
	"nome" VARCHAR(150),
	"email" VARCHAR(255) NOT NULL UNIQUE,
	PRIMARY KEY("ni_professor")
);




CREATE TABLE IF NOT EXISTS "especialidades " (
	"cod_especialidades " VARCHAR(255) NOT NULL UNIQUE,
	"descrição" VARCHAR(255),
	"ni_professor" VARCHAR(255),
	PRIMARY KEY("cod_especialidades ")
);




CREATE TABLE IF NOT EXISTS "professores_disciplinas" (
	"ni_professor " VARCHAR(255) NOT NULL UNIQUE,
	"cod_disciplina" VARCHAR(255),
	PRIMARY KEY("ni_professor ")
);




CREATE TABLE IF NOT EXISTS "alunos_tuma " (
	"matricula_alunos" VARCHAR(255) NOT NULL UNIQUE,
	"cod_turma" VARCHAR(255),
	PRIMARY KEY("matricula_alunos")
);




CREATE TABLE IF NOT EXISTS "notas" (
	"matricula_aluno" VARCHAR(255) NOT NULL UNIQUE,
	"cod_turma" VARCHAR(255),
	"cod_disciplina" VARCHAR(255),
	"ano" INTEGER,
	"semestre " INTEGER,
	"nota" DECIMAL,
	PRIMARY KEY("matricula_aluno")
);



ALTER TABLE "Cursos"
ADD FOREIGN KEY("cod_curso") REFERENCES "Disciplina "("cod_curso")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Cursos"
ADD FOREIGN KEY("cod_curso") REFERENCES "Turmas "("cod_curso")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "professores "
ADD FOREIGN KEY("ni_professor") REFERENCES "especialidades "("ni_professor")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Disciplina "
ADD FOREIGN KEY("cod_disciplina ") REFERENCES "professores_disciplinas"("cod_disciplina")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "professores "
ADD FOREIGN KEY("ni_professor") REFERENCES "professores_disciplinas"("ni_professor ")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "professores "
ADD FOREIGN KEY("ni_professor") REFERENCES "especialidades "("ni_professor")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Disciplina "
ADD FOREIGN KEY("cod_disciplina ") REFERENCES "notas"("cod_disciplina")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Cursos"
ADD FOREIGN KEY("cod_curso") REFERENCES "notas"("cod_disciplina")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "notas"
ADD FOREIGN KEY("cod_turma") REFERENCES "Turmas "("cod_turma")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "notas"
ADD FOREIGN KEY("matricula_aluno") REFERENCES "alunos"("matricula")
ON UPDATE NO ACTION ON DELETE NO ACTION;