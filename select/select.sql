--1. Selecionar a quantidade total de estudantes cadastrados no banco.
SELECT COUNT(*) FROM estudantes ORDER BY COUNT(*) DESC;

--2. Seleciona quais pessoas facilitadoras atuam em mais de uma turma.
SELECT pessoas_facilitadoras.nome, COUNT(pessoas_facilitadoras.id_turma)
FROM pessoas_facilitadoras
WHERE pessoas_facilitadoras.id_turma > 1
GROUP BY pessoas_facilitadoras.nome;


--3. Cria uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma.
CREATE OR REPLACE VIEW evasao_turma AS
SELECT
  estudantes.id_turma,
  COUNT(estudantes.id) AS total_estudantes,
  COUNT(estudante_insert_log.estudante_id) AS total_evasao,
  ((COUNT(estudantes.id) - COUNT(estudante_insert_log.estudante_id)) * 100.0 / COUNT(estudantes.id)) AS porcentagem_evasao
FROM estudantes
LEFT JOIN estudante_insert_log ON estudantes.id = estudante_insert_log.estudante_id
GROUP BY estudantes.id_turma;

SELECT * FROM evasao_turma;



--4. Cria um trigger para ser disparado quando o atributo status de um estudante for atualizado e inserir um novo dado em uma tabela de log.

-- tabela de log dos estudantes
CREATE TABLE estudante_log (
  id SERIAL PRIMARY KEY,
  estudante_id INTEGER,
  data_atualizacao TIMESTAMP,
  coluna_afetada TEXT,
  valor_anterior TEXT,
  valor_atual TEXT,
  FOREIGN KEY (estudante_id) REFERENCES estudantes (id)
);
-- trigger para atualização de estudante
CREATE OR REPLACE FUNCTION estudante_update_trigger()
  RETURNS TRIGGER
AS $$
DECLARE
  nome_coluna TEXT;
  valor_anterior TEXT;
  valor_atual TEXT;
BEGIN
  IF TG_OP = 'UPDATE' THEN
    FOR nome_coluna IN SELECT column_name FROM information_schema.columns WHERE table_name = 'estudantes' LOOP
      valor_anterior := OLD.nome_coluna::text;
      valor_atual := NEW.nome_coluna::text;
      
      IF valor_anterior <> valor_atual THEN
        INSERT INTO estudante_log (estudante_id, data_atualizacao, coluna_afetada, valor_anterior, valor_atual)
        VALUES (NEW.id, CURRENT_TIMESTAMP, nome_coluna, valor_anterior, valor_atual);
      END IF;
    END LOOP;
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Criação do trigger para atualização de estudante
CREATE TRIGGER trigger_estudante_update
AFTER UPDATE ON estudantes
FOR EACH ROW
EXECUTE FUNCTION estudante_update_trigger();


-- trigger para atualização do status de estudante
CREATE OR REPLACE FUNCTION estudante_status_trigger()
  RETURNS TRIGGER
BEGIN
  IF NEW.status <> OLD.status THEN
    INSERT INTO estudante_log (estudante_id, data_atualizacao, novo_status)
    VALUES (NEW.id, CURRENT_TIMESTAMP, NEW.status);
  END IF;
  RETURN NEW;
END;
TRIGGER LANGUAGE plpgsql;

-- Criação do trigger para atualização do status de estudante
CREATE TRIGGER trigger_estudante_status
AFTER UPDATE ON estudantes
FOR EACH ROW
EXECUTE FUNCTION estudante_status_trigger();


--Pesquisa com subquery
--_número total de estudantes matriculados em cada curso.
SELECT cursos.nome, (
  SELECT COUNT(*) 
  FROM estudantes 
  WHERE estudantes.id_turma = cursos.id_turma)
FROM cursos;


--Pesquisa com join com 3 tabelas
--seleciona o nome do estudante, o nome do curso e o nome do módulo em que cada estudante está.
SELECT
  cursos.nome AS nome_curso,
  COUNT(estudantes.id) AS total_estudantes
FROM
  cursos
JOIN
  turmas ON cursos.id_turma = turmas.id
LEFT JOIN
  estudantes ON estudantes.id_turma = turmas.id
GROUP BY
  cursos.nome;


--Extra
--Seleciona todos os estudantes inscritos em uma turma:
SELECT * FROM estudantes
WHERE id_turma = 1;

--Contar o número de estudantes em cada curso
SELECT cursos.nome, COUNT(estudantes.id)
FROM cursos 
LEFT JOIN estudantes e ON cursos.id = estudantes.id_turma
GROUP BY cursos.id, cursos.nome;

--Pesquisa com view
--Cria uma view que pega os dados da tabela de estudantes e calcule a contagem de estudantes ativos por turma
CREATE VIEW estudantes_ativos_por_turma AS
SELECT
  t.id AS id_turma,
  t.nome AS nome_turma,
  COUNT(*) AS total_estudantes_ativos
FROM
  estudantes e
JOIN
  turmas t ON e.id_turma = t.id
WHERE
  e.status = 'ativo'
GROUP BY
  t.id, t.nome;
  
SELECT * FROM estudantes_ativos_por_turma;

--Crie uma view que agregue os dados da tabela de estudantes e calcule a PORCENTAGEM de estudantes ativos por turma
CREATE OR REPLACE VIEW estudantes_ativos_por_turma AS
SELECT turmas.id AS id_turma, turmas.nome AS nome_turma, COUNT(*),
       COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()
FROM turmas
JOIN estudantes ON turmas.id = estudantes.id_turma
WHERE estudantes.status = 'ativo'
GROUP BY turmas.id, turmas.nome;
--Chamada
SELECT *
FROM estudantes_ativos_por_turma;






