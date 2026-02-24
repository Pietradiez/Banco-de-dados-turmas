CREATE TABLE IF NOT EXISTS "alunos" (
	"matricula" VARCHAR(50) NOT NULL UNIQUE,
	"data_nascimento" DATE NOT NULL,
	"nome" VARCHAR(150) NOT NULL,
	"email" VARCHAR(150) NOT NULL UNIQUE,
	PRIMARY KEY("matricula")
);




CREATE TABLE IF NOT EXISTS "cursos" (
	"cod_curso" VARCHAR(100) NOT NULL UNIQUE,
	"nome" VARCHAR(100) NOT NULL,
	"qtde_semestres" INTEGER NOT NULL,
	PRIMARY KEY("cod_curso")
);




CREATE TABLE IF NOT EXISTS "disciplinas" (
	"cod_disciplina" VARCHAR(255) NOT NULL UNIQUE,
	"nome" VARCHAR(100) NOT NULL,
	"carga_horaria" INTEGER NOT NULL,
	"cod_curso" VARCHAR(100) NOT NULL,
	PRIMARY KEY("cod_disciplina")
);




CREATE TABLE IF NOT EXISTS "turmas" (
	"cod_turma" VARCHAR(255) NOT NULL UNIQUE,
	"ano" INTEGER NOT NULL,
	"cod_curso" VARCHAR(100) NOT NULL,
	PRIMARY KEY("cod_turma")
);




CREATE TABLE IF NOT EXISTS "professores" (
	"ni_professor" VARCHAR(255) NOT NULL UNIQUE,
	"nome" VARCHAR(150) NOT NULL,
	"email" VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY("ni_professor")
);




CREATE TABLE IF NOT EXISTS "especialidades" (
	"cod_especialidade" VARCHAR(255) NOT NULL UNIQUE,
	"descricao" VARCHAR(150) NOT NULL,
	"ni_professor" VARCHAR(100) NOT NULL,
	PRIMARY KEY("cod_especialidade")
);




CREATE TABLE IF NOT EXISTS "professores_disciplinas" (
	"ni_professor" VARCHAR(100) NOT NULL,
	"cod_disciplina" VARCHAR(100) NOT NULL,
	PRIMARY KEY("ni_professor", "cod_disciplina")
);




CREATE TABLE IF NOT EXISTS "alunos_turmas" (
	"matricula_aluno" VARCHAR(100) NOT NULL,
	"cod_turma" VARCHAR(100) NOT NULL,
	PRIMARY KEY("matricula_aluno", "cod_turma")
);




CREATE TABLE IF NOT EXISTS "notas" (
	"matricula_aluno" VARCHAR(255) NOT NULL,
	"cod_turma" VARCHAR(100) NOT NULL,
	"cod_disciplina" VARCHAR(100) NOT NULL,
	"ano" INTEGER NOT NULL,
	"semestre" INTEGER NOT NULL,
	"nota" DECIMAL(4,2) NOT NULL DEFAULT 10,
	PRIMARY KEY("matricula_aluno", "cod_turma", "cod_disciplina", "ano", "semestre")
);




CREATE TABLE IF NOT EXISTS "grade_aulas" (
	"id_grade" SERIAL,
	"cod_turma" VARCHAR(100) NOT NULL,
	"cod_disciplina" VARCHAR(100) NOT NULL,
	"ni_professor" VARCHAR(100) NOT NULL,
	"cod_sala" VARCHAR(50) NOT NULL,
	"dia_semana" VARCHAR(20) NOT NULL,
	PRIMARY KEY("id_grade")
);




CREATE TABLE IF NOT EXISTS "salas" (
	"cod_sala" VARCHAR(50),
	"bloco" VARCHAR(50) NOT NULL,
	"numero" INTEGER NOT NULL,
	"capacidade" INTEGER NOT NULL CHECK("[object Object]" > 0),
	"tipo" VARCHAR(50) NOT NULL,
	PRIMARY KEY("cod_sala")
);




CREATE TABLE IF NOT EXISTS "frequencias" (
	"id_frequencia" SERIAL,
	"matricula_aluno" VARCHAR(100) NOT NULL,
	"cod_turma" VARCHAR(100) NOT NULL,
	"cod_disciplina" VARCHAR(100) NOT NULL,
	"total_aulas" INTEGER NOT NULL CHECK("[object Object]" > 0),
	"presencas" INTEGER NOT NULL CHECK("[object Object]" >= 0),
	PRIMARY KEY("id_frequencia")
);



ALTER TABLE "disciplinas"
ADD FOREIGN KEY("cod_curso") REFERENCES "cursos"("cod_curso")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "turmas"
ADD FOREIGN KEY("cod_curso") REFERENCES "cursos"("cod_curso")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "especialidades"
ADD FOREIGN KEY("ni_professor") REFERENCES "professores"("ni_professor")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "professores_disciplinas"
ADD FOREIGN KEY("ni_professor") REFERENCES "professores"("ni_professor")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "professores_disciplinas"
ADD FOREIGN KEY("cod_disciplina") REFERENCES "disciplinas"("cod_disciplina")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "alunos_turmas"
ADD FOREIGN KEY("matricula_aluno") REFERENCES "alunos"("matricula")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "alunos_turmas"
ADD FOREIGN KEY("cod_turma") REFERENCES "turmas"("cod_turma")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "notas"
ADD FOREIGN KEY("matricula_aluno") REFERENCES "alunos"("matricula")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "notas"
ADD FOREIGN KEY("cod_turma") REFERENCES "turmas"("cod_turma")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "notas"
ADD FOREIGN KEY("cod_disciplina") REFERENCES "disciplinas"("cod_disciplina")
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE "alunos_turmas"
ADD FOREIGN KEY("cod_turma") REFERENCES "grade_aulas"("cod_turma")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "professores"
ADD FOREIGN KEY("ni_professor") REFERENCES "grade_aulas"("ni_professor")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "grade_aulas"
ADD FOREIGN KEY("cod_sala") REFERENCES "salas"("cod_sala")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "alunos_turmas"
ADD FOREIGN KEY("cod_turma") REFERENCES "frequencias"("cod_turma")
ON UPDATE NO ACTION ON DELETE NO ACTION;
