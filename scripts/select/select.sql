 
--Selecionar a quantidade total de estudantes cadastrados no banco.
SELECT COUNT(*) FROM estudantes ORDER BY COUNT(*) DESC;

--Seleciona quais pessoas facilitadoras atuam em mais de uma turma.
SELECT id_turma, COUNT(DISTINCT id_facilitador) AS quantidade_facilitadores
FROM facilitador_turma
GROUP BY id_turma;

--Cria uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma.
CREATE VIEW porcentagem_evasao_por_turma AS
SELECT t.nome AS turma_nome, COUNT(*) AS total_estudantes,
       COUNT(CASE WHEN e.status = 'Inativo' THEN 1 END) AS estudantes_evasao,
       (COUNT(CASE WHEN e.status = 'Inativo' THEN 1 END)::float / COUNT(*)) * 100 AS porcentagem_evasao
FROM turmas t
JOIN estudantes e ON t.id = e.id_turma
GROUP BY t.nome;

SELECT * FROM porcentagem_evasao_por_turma;

--drop view porcentagem_evasao_por_turma;



--Pesquisa com subquery
--Número total de estudantes matriculados em cada curso.
SELECT cursos.nome, COUNT(estudantes.id)
FROM cursos 
LEFT JOIN estudantes ON cursos.id = estudantes.id_turma
GROUP BY cursos.id, cursos.nome;


--Pesquisa com join com 3 tabelas
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


--Seleciona todos os estudantes inscritos em uma turma:
SELECT estudantes.nome FROM estudantes
WHERE id_turma = 2;


--Pesquisa com view
--Cria uma view que pega os dados da tabela de estudantes e calcule a contagem de estudantes ativos por turma
CREATE OR REPLACE VIEW porcentagem_estudantes_ativos AS
SELECT
  turmas.nome AS nome_turma,
  COUNT(estudantes.id) AS total_estudantes,
  COUNT(estudante_insert_log.estudante_id) AS total_evasao,
  CASE
    WHEN COUNT(estudantes.id) > 0
      THEN (1 - (COUNT(estudante_insert_log.estudante_id)::decimal / COUNT(estudantes.id)::decimal)) * 100
    ELSE 0
  END AS porcentagem_ativos
FROM
  turmas
LEFT JOIN
  estudantes ON turmas.id = estudantes.id_turma
LEFT JOIN
  estudante_insert_log ON estudantes.id = estudante_insert_log.estudante_id
GROUP BY
  turmas.nome;

--chama a view
SELECT * FROM porcentagem_estudantes_ativos;

--apaga a view
drop view porcentagem_estudantes_ativos;
