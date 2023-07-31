 
--Selecionar a quantidade total de estudantes cadastrados no banco.
SELECT COUNT(*) FROM estudantes ORDER BY COUNT(*);

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
CREATE VIEW estudantes_ativos_por_turma AS
SELECT t.nome AS turma_nome, COUNT(*) AS total_estudantes_ativos
FROM turmas t
JOIN estudantes e ON t.id = e.id_turma
WHERE e.status = 'Ativo'
GROUP BY t.nome;

SELECT * FROM estudantes_ativos_por_turma;


--apaga a view
drop view porcentagem_estudantes_ativos;
