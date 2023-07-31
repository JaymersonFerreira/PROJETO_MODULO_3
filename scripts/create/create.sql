-- Criação das tabelas
CREATE TABLE "turmas" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "data_inicio" DATE,
  "data_fim" DATE
);

CREATE TABLE "cursos" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "qtd_estudantes" INTEGER,
  "id_turma" INTEGER,
  FOREIGN KEY ("id_turma") REFERENCES "turmas" ("id")
);

CREATE TABLE "modulos" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "data_inicio" DATE,
  "data_fim" DATE,
  "descricao" TEXT,
  "id_curso" INTEGER,
  FOREIGN KEY ("id_curso") REFERENCES "cursos" ("id")
);

CREATE TABLE "estudantes" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "cpf" VARCHAR (14),
  "data_nascimento" DATE,
  "email" VARCHAR(255),
  "telefone" VARCHAR(15),
  "endereco" VARCHAR(255),
  "status" VARCHAR(20),
  "id_turma" INTEGER,
  FOREIGN KEY ("id_turma") REFERENCES "turmas" ("id")
);

CREATE TABLE "pessoas_facilitadoras" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "cpf" VARCHAR(14),
  "data_nascimento" DATE,
  "email" VARCHAR(255),
  "especialidades" VARCHAR(255),
  "telefone" VARCHAR(15),
  "endereco" VARCHAR(255),
  "id_turma" INTEGER,
  FOREIGN KEY ("id_turma") REFERENCES "turmas" ("id")
);


-- Criação da tabela estudante_update_log
CREATE TABLE estudante_update_log (
  id_estudante INTEGER,
  data_update TIMESTAMP,
  novo_status VARCHAR(50)
);

--select * from estudante_update_log;

-- Criação da função e gatilho para atualização do atributo status
CREATE OR REPLACE FUNCTION estudante_update_status_log()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
  -- Insere um registro na tabela estudante_update_log
  INSERT INTO estudante_update_log (id_estudante, data_update, novo_status)
  VALUES (NEW.id, current_timestamp, NEW.status);

  RETURN NEW;
END;
$$;

CREATE TRIGGER UPDATE_STATUS_LOG_TRIGGER
BEFORE UPDATE ON estudantes
FOR EACH ROW
EXECUTE FUNCTION estudante_update_status_log();


CREATE TABLE estudante_insert_log (
  id_estudante INTEGER,
  data_insert TIMESTAMP
);

--select * from estudante_insert_log;

CREATE OR REPLACE FUNCTION estudante_log()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN

  INSERT INTO estudante_insert_log (id_estudante, data_insert) VALUES (new.id, current_timestamp);
  RETURN NEW;
END;
$$;

CREATE TRIGGER INSERT_LOG_TRIGGER
AFTER INSERT ON estudantes 
FOR EACH ROW
EXECUTE PROCEDURE estudante_log();

CREATE TABLE facilitador_turma (
  id_facilitador INT,
  id_turma INT,
  FOREIGN KEY (id_facilitador) REFERENCES pessoas_facilitadoras(id),
  FOREIGN KEY (id_turma) REFERENCES turmas(id)
);
