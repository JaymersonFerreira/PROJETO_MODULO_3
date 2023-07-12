--1. Selecionar a quantidade total de estudantes cadastrados no banco;
SELECT COUNT(*) FROM estudantes ORDER BY DESC;

--//////////////////////////////////////////////////////////////////////
--2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
SELECT pessoas_facilitadoras.nome, COUNT(pessoas_facilitadoras.id_turma)
FROM pessoas_facilitadoras
GROUP BY pessoas_facilitadoras.nome
WHERE COUNT(pessoas_facilitadoras.id_turma) > 1;

--//////////////////////////////////////////////////////////////////////
--3. Crie uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma;
CREATE OR REPLACE VIEW evasao_turma AS
SELECT 
  COUNT(estudantes.id),
  COUNT(estudantes.estudante_id),
  (COUNT(estudantes.id) - COUNT(estudante_log.estudante_id))
FROM estudantes 
LEFT JOIN estudante_log ON estudantes.id = estudante_log.estudante_id;

select * from evasao_turma;

--//////////////////////////////////////////////////////////////////////
--4. Crie um trigger para ser disparado quando o atributo status de um estudante for atualizado e
--inserir um novo dado em uma tabela de log.
--_Atualizar
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

--_inserir
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

--////////////////////////////////////////////////////////////////////
--Pesquisa com subquery
--_número total de estudantes matriculados em cada curso.
SELECT cursos.nome, (
  SELECT COUNT(*) 
  FROM estudantes 
  WHERE estudantes.id_turma = cursos.id_turma
) AS total_estudantes
FROM cursos;

--//////////////////////////////////////////////////////////////////
--Pesquisa com join com 3 tabelas
--seleciona o nome do estudante, o nome do curso e o nome do módulo em que cada estudante está matriculado.
SELECT estudantes.nome, cursos.nome, modulos.nome
FROM estudantes
JOIN turmas  ON est.id_turma = turmas.id
JOIN cursos  ON turmas.id    = cursos.id_turma
JOIN modulos ON cursos.id    = modulos.id_curso;


--/////////////////////////////////////////////////////////////////
--Extra
--Seleciona todos os estudantes inscritos em uma turma:
SELECT * FROM estudantes
WHERE id_turma = 1;

--Contar o número de estudantes em cada curso
SELECT cursos.nome, COUNT(estudantes.id) AS total_estudantes
FROM cursos 
LEFT JOIN estudantes e ON cursos.id = estudantes.id_turma
GROUP BY cursos.id, cursos.nome;

--Pesquisa com view
CREATE OR REPLACE VIEW estudantes_ativos_por_turma AS
SELECT turmas.id, turmas.nome, COUNT(*)
FROM turmas 
JOIN estudantes ON turmas.id = estudantes.id_turma
WHERE estudantes.status = 'ativo'
GROUP BY turmas.id, turmas.nome;

SELECT * FROM estudantes_ativos_por_turma;



--para inserir
INSERT INTO estudantes (nome, cpf, data_nascimento, email, telefone, endereco, status, id_turma)
VALUES
  ('Aeronauta Barata', '666.537.580-36', '2000-01-11', 'estudante01@resilia.com', '(68) 3640-1708', 'Rua A', 'Ativo', 1),
  ('Agrícola Beterraba Areia', '864.646.970-05', '2000-02-13', 'estudante02@resilia.com', '(65) 3172-1484', 'Rua B', 'Ativo', 1),
  ('Agrícola da Terra Fonseca', '822.807.500-66', '2000-03-08', 'estudante03@resilia.com', '(63) 2047-4597', 'Rua C', 'Ativo', 1),
  ('Alce Barbuda', '455.493.970-72', '2000-02-28', 'estudante04@resilia.com', '(49) 3293-8238', 'Rua D', 'Ativo', 1),
  ('Amado Amoroso', '337.539.800-05', '2000-07-26', 'estudante05@resilia.com', '(68) 3137-0727', 'Rua E', 'Ativo', 1),
  ('Amável Pinto', '042.362.170-07', '2000-08-17', 'estudante06@resilia.com', '(51) 3654-1729', 'Rua F', 'Ativo', 1),
  ('Amazonas Rio do Brasil Pimpão', '106.664.380-64', '2000-01-04', 'estudante07@resilia.com', '(96) 2629-6980', 'Rua G', 'Ativo', 1),
  ('América do Sul Brasil de Santana', '526.675.930-57', '2000-02-21', 'estudante08@resilia.com', '(83) 2204-8562', 'Rua H', 'Ativo', 1),
  ('Amin Amou Amado', '828.185.490-19', '2000-04-14', 'estudante09@resilia.com', '(99) 2648-7791', 'Rua J', 'Ativo', 1),
  ('Antonio Manso Pacífico de Oliveira Sossegado', '192.363.600-68', '2000-09-30', 'estudante10@resilia.com', '(66) 3147-7637', 'Rua AA', 'Ativo', 1),
  ('Antônio Morrendo das Dores', '724.141.770-47', '2000-12-19', 'estudante11@resilia.com', '(67) 3234-8622', 'Rua CALANGO', 'Ativo', 1),
  ('Aricléia Café Chá', '355.556.030-10', '2000-05-10', 'estudante12@resilia.com', '(83) 2756-0417', 'Rua LAGARTICHA', 'Ativo', 1),
  ('Ava Gina', '255.484.050-47', '2000-05-31', 'estudante13@resilia.com', '(54) 2102-3021', 'Rua OO', 'Ativo', 1),
  ('Asteróide Silverio', '997.547.630-97', '2000-01-18', 'estudante14@resilia.com', '(55) 3718-9855', 'Rua 5', 'Ativo', 1),
  ('Bandeirante do Brasil Paulistano', '721.031.490-33', '2000-07-06', 'estudante15@resilia.com', '(95) 3780-9426', 'Rua 2', 'Ativo', 1),
  ('Barrigudinha Seleida', '852.324.630-47', '2000-06-07', 'estudante16@resilia.com', '(84) 2069-8172', 'Rua 11', 'Ativo', 1),
  ('Bispo de Paris', '557.722.240-00', '2000-04-16', 'estudante17@resilia.com', '(74) 3638-7377', 'Rua 5', 'Ativo', 1),
  ('Bizarro Assada', '301.009.440-00', '2000-03-10', 'estudante18@resilia.com', '(61) 2661-5488', 'Rua IO', 'Ativo', 1),
  ('Céu Azul do Sol Poente', '635.654.560-78', '2000-02-13', 'estudante19@resilia.com', '(82) 2486-6557', 'Rua POI', 'Ativo', 1),
  ('Chevrolet da Silva Ford', '066.291.830-45', '2000-08-17', 'estudante20@resilia.com', '(98) 3861-5293', 'Rua PIU-PIU', 'Ativo', 1),
  ('Disney Chaplin Milhomem da Silva', '290.837.620-25', '2000-09-30', 'estudante21@resilia.com', '(53) 2951-6575', 'Rua ARROZ', 'Ativo', 1),
  ('Dezêncio Feverêncio de Oitenta e Cinco', '572.482.070-63', '2000-10-11', 'estudante22@resilia.com', '(66) 2676-7723', 'Rua DO CHINA', 'Ativo', 1),
  ('Dolores Fuertes de Barriga', '371.401.310-58', '2000-11-21', 'estudante23@resilia.com', '(96) 3896-5458', 'Rua LOGO ALI', 'Ativo', 1),
  ('Esparadrapo Clemente de Sá', '752.437.460-70', '2000-10-22', 'estudante24@resilia.com', '(17) 3833-3837', 'Rua BATATA', 'Ativo', 1),
  ('Homem Bom da Cunha Souto Maior', '454.570.260-00', '2000-12-27', 'estudante25@resilia.com', '(41) 3328-4551', 'Rua TOMATE', 'Ativo', 1),
  ('Ilegível Inilegível', '869.522.250-05', '2000-06-29', 'estudante26@resilia.com', '(63) 3104-4429', 'Rua FEIJÃO', 'Ativo', 1),
  ('Inocêncio Coitadinho', '118.273.960-16', '2000-01-15', 'estudante27@resilia.com', '(46) 2042-7852', 'Rua FAROFA', 'Ativo', 1),
  ('Janeiro Fevereiro de Março Abril', '753.366.090-05', '2000-10-24', 'estudante28@resilia.com', '(96) 2061-3242', 'Rua CHUHRRASCO', 'Ativo', 1),
  ('Lança Perfume Rodometálico de Andrade', '476.446.450-04', '2000-02-18', 'estudante29@resilia.com', '(13) 2175-5778', 'Rua LEGUMES', 'Ativo', 1),
  ('Marciano Verdinho das Antenas Longas', '581.371.240-20', '2000-09-26', 'estudante30@resilia.com', '(69) 3634-1138', 'Rua BISCOITE', 'Ativo', 1),
  ('Maria Privada de Jesus', '392.248.890-00', '2000-11-16', 'estudante31@resilia.com', '(54) 3874-6653', 'Rua BOLACHA', 'Ativo', 1),
  ('Maria Tributina Prostituta Cataerva', '667.244.010-03', '2000-03-02', 'estudante32@resilia.com', '(61) 3256-4215', 'Rua NESCAL', 'Ativo', 1),
  ('Maria-você-me-mata', '094.716.220-85', '2000-04-05', 'estudante33@resilia.com', '(97) 2684-6277', 'Rua LEITE-MOÇA', 'Ativo', 1),
  ('Mimaré Índio Brazileiro de Campos', '552.309.280-00', '2000-07-25', 'estudante34@resilia.com', '(68) 3356-5573', 'Rua VINAGRE', 'Ativo', 1),
  ('Napoleão Sem Medo e Sem Mácula', '796.820.430-50', '2000-08-13', 'estudante35@resilia.com', '(87) 3034-9178', 'Rua OLHO-DE-DEDE', 'Ativo', 1),
  ('Natal Carnaval', '958.745.580-04', '2000-01-14', 'estudante36@resilia.com', '(43) 2265-5817', 'Rua 4', 'Ativo', 1),
  ('Necrotério Pereira da Silva', '790.512.150-02', '2000-06-30', 'estudante37@resilia.com', '(84) 3963-5400', 'Rua 22', 'Ativo', 1),
  ('Oceâno Atlântico Linhares', '790.512.150-02', '2000-05-20', 'estudante38@resilia.com', '(69) 3814-8221', 'Rua 66', 'Ativo', 1),
  ('Otávio Bundasseca', '659.561.480-47', '2000-10-10', 'estudante39@resilia.com', '(79) 2638-6703', 'Rua 24', 'Ativo', 1),
  ('Pacífico Armando Guerra', '084.350.010-75', '2000-12-21', 'estudante40@resilia.com', '(51) 2436-1794', 'Rua DAS PRIMAS', 'Ativo', 1),
  ('Padre Filho do Espírito Santo Amém', '159.725.700-17', '2000-01-27', 'estudante41@resilia.com', '(27) 3247-6268', 'Rua DE BAIXO', 'Ativo', 1),
  ('Plácido e Seus Companheiros', '894.104.620-37', '2000-03-05', 'estudante42@resilia.com', '(27) 2746-0356', 'Rua DE CIMA', 'Ativo', 1),
  ('Remédio Amargo', '051.646.010-28', '2000-08-16', 'estudante43@resilia.com', '(21) 2767-4541', 'Rua DO CHAPEU', 'Ativo', 1),
  ('Renato Pordeus Furtado', '719.765.870-50', '2000-09-09', 'estudante44@resilia.com', '(61) 3827-8424', 'Rua VIRE A ESQUERDA', 'Ativo', 1),
  ('Restos Mortais de Catarina', '552.028.830-56', '2000-11-19', 'estudante45@resilia.com', '(64) 2316-9163', 'FIM DA Rua', 'Ativo', 1),
  ('Rocambole Simionato', '041.800.990-20', '2000-10-22', 'estudante46@resilia.com', '(79) 3784-5348', 'Rua DEF', 'Ativo', 1),
  ('Universo Cândido', '433.454.460-65', '2000-01-08', 'estudante47@resilia.com', '(99) 3487-2413', 'Rua INT', 'Ativo', 1),
  ('Vicente Mais ou  Menos de Souza', '609.143.310-51', '2000-02-07', 'estudante48@resilia.com', '(97) 3447-4421', 'Rua FLOAT', 'Ativo', 1),
  ('Zélia Tocafundo Pinto', '498.160.720-25', '2000-04-16', 'estudante49@resilia.com', '(98) 2224-3966', 'Rua LEN', 'Ativo', 1),
  ('Zezin da tapioca', '692.369.730-19', '2000-08-17', 'estudante50@resilia.com', '(28) 3767-0482', 'Rua RANGE', 'Ativo', 1);

INSERT INTO pessoas_facilitadoras (nome, data_nascimento, email, especialidades, telefone, endereco, id_turma)
VALUES
  ('Facilitador 1', '1980-01-01', 'facilitador1@example.com', 'Especialidade 1', '111111111', 'Rua X', 1),
  ('Facilitador 1', '1980-01-01', 'facilitador1@example.com', 'Especialidade 1', '111111111', 'Rua X', 1),
  ('Facilitador 1', '1980-01-01', 'facilitador1@example.com', 'Especialidade 1', '111111111', 'Rua X', 1),
  ('Facilitador 1', '1980-01-01', 'facilitador1@example.com', 'Especialidade 1', '111111111', 'Rua X', 1),
  ('Facilitador 2', '1980-02-02', 'facilitador2@example.com', 'Especialidade 2', '222222222', 'Rua Y', 2);


--para atualizar
UPDATE estudantes
SET
  telefone = '999999999',
  endereco = 'Nova Rua',
  status = 'Inativo'
WHERE id = 1;

UPDATE pessoas_facilitadoras
SET
  telefone = '888888888',
  endereco = 'Novo Endereço'
WHERE id = 1;

--para deletar
DELETE FROM estudantes
WHERE id = 1; 

DELETE FROM pessoas_facilitadoras
WHERE id = 1;

