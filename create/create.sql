-- Criação da tabela "turmas"
CREATE TABLE "turmas" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "data_inicio" DATE,
  "data_fim" DATE
);

--Criação da tabela "cursos"
CREATE TABLE "cursos" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "qtd_estudantes" INTEGER,
  "id_turma" INTEGER,
  FOREIGN KEY ("id_turma") REFERENCES "turmas" ("id")
);

-- Criação da tabela "modulos"
CREATE TABLE "modulos" (
  "id" SERIAL PRIMARY KEY,
  "nome" VARCHAR(255),
  "data_inicio" DATE,
  "data_fim" DATE,
  "descricao" TEXT,
  "id_curso" INTEGER,
  FOREIGN KEY ("id_curso") REFERENCES "cursos" ("id")
);

-- Criação da tabela "estudantes"
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

-- Criação da tabela "pessoas_facilitadoras"
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

--log de inserções de estudantes
CREATE TABLE estudante_insert_log (
  id SERIAL PRIMARY KEY,
  estudante_id INTEGER,
  data_atualizacao TIMESTAMP,
  novo_status VARCHAR(20),
  FOREIGN KEY (estudante_id) REFERENCES estudantes (id)
);

-- Criação da função "estudante_status_trigger"
CREATE OR REPLACE FUNCTION estudante_status_trigger()
  RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status <> OLD.status THEN
    INSERT INTO estudante_insert_log (estudante_id, data_atualizacao, novo_status)
    VALUES (NEW.id, CURRENT_TIMESTAMP, NEW.status);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do acionador "trigger_estudante_status"
CREATE TRIGGER trigger_estudante_status
AFTER UPDATE ON estudantes
FOR EACH ROW
EXECUTE FUNCTION estudante_status_trigger();

-- Criação da tabela "estudante_update_log" 
CREATE TABLE estudante_update_log (
  id SERIAL PRIMARY KEY,
  estudante_id INTEGER,
  data_atualizacao TIMESTAMP,
  coluna_afetada VARCHAR(255),
  valor_anterior TEXT,
  valor_atual TEXT,
  FOREIGN KEY (estudante_id) REFERENCES estudantes (id)
);

-- Criação da função "estudante_update_trigger"
CREATE OR REPLACE FUNCTION estudante_update_trigger()
  RETURNS TRIGGER AS $$
DECLARE
  nome_coluna TEXT;
  valor_anterior TEXT;
  valor_atual TEXT;
BEGIN
  IF TG_OP = 'UPDATE' THEN
    FOR nome_coluna IN SELECT column_name FROM information_schema.columns WHERE table_name = 'estudantes' LOOP
      valor_anterior := OLD[nome_coluna]::text;
      valor_atual := NEW[nome_coluna]::text;
      
      IF valor_anterior <> valor_atual THEN
        INSERT INTO estudante_update_log (estudante_id, data_atualizacao, coluna_afetada, valor_anterior, valor_atual)
        VALUES (NEW.id, CURRENT_TIMESTAMP, nome_coluna, valor_anterior, valor_atual);
      END IF;
    END LOOP;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do acionador "trigger_estudante_update"(gatilho)
CREATE TRIGGER trigger_estudante_update
AFTER UPDATE ON estudantes
FOR EACH ROW
EXECUTE FUNCTION estudante_update_trigger();
