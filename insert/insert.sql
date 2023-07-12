-- Inserção dos dados
INSERT INTO turmas (nome, data_inicio, data_fim)
VALUES ('Vamos Aí', '2023-04-01', '2023-10-30'),
       ('Vamos Lá', '2023-11-01', '2024-05-30'),
       ('Vamos Alí', '2000-01-01', '2000-10-10');

INSERT INTO cursos (nome, qtd_estudantes, id_turma)
VALUES ('Análise de dados', 50, 1),
       ('Ciência de dados', 50, 2),
       ('Front-end', 50, 3);
	   
--Turma vamos lá
INSERT INTO modulos (nome, data_inicio, data_fim, descricao, id_curso)
VALUES ('Módulo 0', '2023-04-01', '2023-04-30', 'Analise de dados da turma vamos aí, Módulo 0', 1),
       ('Módulo 1', '2023-05-01', '2023-05-30', 'Analise de dados da turma vamos aí, Módulo 1', 1),
       ('Módulo 2', '2023-06-01', '2023-06-30', 'Analise de dados da turma vamos aí, Módulo 2', 1),
       ('Módulo 3', '2023-07-01', '2023-07-30', 'Analise de dados da turma vamos aí, Módulo 3', 1),
       ('Módulo 4', '2023-08-01', '2023-08-30', 'Analise de dados da turma vamos aí, Módulo 4', 1),
       ('Módulo 5', '2023-09-01', '2023-09-30', 'Analise de dados da turma vamos aí, Módulo 5', 1);


INSERT INTO modulos (nome, data_inicio, data_fim, descricao, id_curso)
VALUES ('Módulo 0', '2023-11-01', '2023-11-30', 'Ciência de dados da turma vamos lá, Módulo 0', 2),
       ('Módulo 1', '2023-12-01', '2023-12-30', 'Ciência de dados da turma vamos lá, Módulo 1', 2),
       ('Módulo 2', '2024-01-01', '2023-01-30', 'Ciência de dados da turma vamos lá, Módulo 2', 2),
       ('Módulo 3', '2024-02-01', '2023-02-10', 'Ciência de dados da turma vamos lá, Módulo 3', 2),
       ('Módulo 4', '2024-03-01', '2023-03-30', 'Ciência de dados da turma vamos lá, Módulo 4', 2),
       ('Módulo 5', '2024-04-01', '2023-04-30', 'Ciência de dados da turma vamos lá, Módulo 5', 2);

-- Estudantes
INSERT INTO estudantes (nome, cpf, data_nascimento, email, telefone, endereco, status, id_turma)
VALUES
  ('Alex Deividy', '666.537.580-36', '2000-01-11', 'estudante01@resilia.com', '(68) 3640-1708', 'Rua A', 'Ativo', 1),
  ('Alice Calage', '864.646.970-05', '2000-02-13', 'estudante02@resilia.com', '(65) 3172-1484', 'Rua B', 'Ativo', 1),
  ('Aline Braga', '822.807.500-66', '2000-03-08', 'estudante03@resilia.com', '(63) 2047-4597', 'Rua C', 'Ativo', 1),
  ('Aron Augusto', '455.493.970-72', '2000-02-28', 'estudante04@resilia.com', '(49) 3293-8238', 'Rua D', 'Ativo', 1),
  ('Arthur Vilaverde', '337.539.800-05', '2000-07-26', 'estudante05@resilia.com', '(68) 3137-0727', 'Rua E', 'Ativo', 1),
  ('Cristhian Monteiro', '042.362.170-07', '2000-08-17', 'estudante06@resilia.com', '(51) 3654-1729', 'Rua F', 'Ativo', 1),
  ('Daniel Freitas', '106.664.380-64', '2000-01-04', 'estudante07@resilia.com', '(96) 2629-6980', 'Rua G', 'Ativo', 1),
  ('Danylo Sousa', '526.675.930-57', '2000-02-21', 'estudante08@resilia.com', '(83) 2204-8562', 'Rua H', 'Ativo', 1),
  ('David Williams', '828.185.490-19', '2000-04-14', 'estudante09@resilia.com', '(99) 2648-7791', 'Rua J', 'Ativo', 1),
  ('Denyson de Brito', '192.363.600-68', '2000-09-30', 'estudante10@resilia.com', '(66) 3147-7637', 'Rua AA', 'Ativo', 1),
  ('Fabiana Alves', '724.141.770-47', '2000-12-19', 'estudante11@resilia.com', '(67) 3234-8622', 'Rua CALANGO', 'Ativo', 1),
  ('Fernando Casanova', '355.556.030-10', '2000-05-10', 'estudante12@resilia.com', '(83) 2756-0417', 'Rua LAGARTICHA', 'Ativo', 1),
  ('Gideoni Barbosa', '255.484.050-47', '2000-05-31', 'estudante13@resilia.com', '(54) 2102-3021', 'Rua OO', 'Ativo', 1),
  ('Gustavo Daher', '997.547.630-97', '2000-01-18', 'estudante14@resilia.com', '(55) 3718-9855', 'Rua 5', 'Ativo', 1),
  ('Helder Fernandes', '721.031.490-33', '2000-07-06', 'estudante15@resilia.com', '(95) 3780-9426', 'Rua 2', 'Ativo', 1),
  ('Jaqueline dos Santos', '852.324.630-47', '2000-06-07', 'estudante16@resilia.com', '(84) 2069-8172', 'Rua 11', 'Ativo', 1),
  ('Jaymerson Ferreira', '557.722.240-00', '2000-04-16', 'estudante17@resilia.com', '(74) 3638-7377', 'Rua 5', 'Ativo', 1),
  ('Jefferson Cezar', '301.009.440-00', '2000-03-10', 'estudante18@resilia.com', '(61) 2661-5488', 'Rua IO', 'Ativo', 1),
  ('João Vitor', '635.654.560-78', '2000-02-13', 'estudante19@resilia.com', '(82) 2486-6557', 'Rua POI', 'Ativo', 1),
  ('Joel Nunes', '066.291.830-45', '2000-08-17', 'estudante20@resilia.com', '(98) 3861-5293', 'Rua PIU-PIU', 'Ativo', 1),
  ('José Wedson', '290.837.620-25', '2000-09-30', 'estudante21@resilia.com', '(53) 2951-6575', 'Rua ARROZ', 'Ativo', 1),
  ('Josean Pereira', '572.482.070-63', '2000-10-11', 'estudante22@resilia.com', '(66) 2676-7723', 'Rua DO CHINA', 'Ativo', 1),
  ('Juliana Gomes', '371.401.310-58', '2000-11-21', 'estudante23@resilia.com', '(96) 3896-5458', 'Rua LOGO ALI', 'Ativo', 1),
  ('Lucas Teixeira', '752.437.460-70', '2000-10-22', 'estudante24@resilia.com', '(17) 3833-3837', 'Rua BATATA', 'Ativo', 1),
  ('Luciana Otávio', '454.570.260-00', '2000-12-27', 'estudante25@resilia.com', '(41) 3328-4551', 'Rua TOMATE', 'Ativo', 1),
  ('Luis Gustavo', '869.522.250-05', '2000-06-29', 'estudante26@resilia.com', '(63) 3104-4429', 'Rua FEIJÃO', 'Ativo', 1),
  ('Marcos da Costa', '118.273.960-16', '2000-01-15', 'estudante27@resilia.com', '(46) 2042-7852', 'Rua FAROFA', 'Ativo', 1),
  ('Matheus Santiago', '753.366.090-05', '2000-10-24', 'estudante28@resilia.com', '(96) 2061-3242', 'Rua CHUHRRASCO', 'Ativo', 1),
  ('Michael Barbosa', '476.446.450-04', '2000-02-18', 'estudante29@resilia.com', '(13) 2175-5778', 'Rua LEGUMES', 'Ativo', 1),
  ('Pâmela de Carvalho', '581.371.240-20', '2000-09-26', 'estudante30@resilia.com', '(69) 3634-1138', 'Rua BISCOITE', 'Ativo', 1),
  ('Rafael Antônio', '392.248.890-00', '2000-11-16', 'estudante31@resilia.com', '(54) 3874-6653', 'Rua BOLACHA', 'Ativo', 1),
  ('Rafael César', '667.244.010-03', '2000-03-02', 'estudante32@resilia.com', '(61) 3256-4215', 'Rua NESCAL', 'Ativo', 1),
  ('Rodrigo Marques', '094.716.220-85', '2000-04-05', 'estudante33@resilia.com', '(97) 2684-6277', 'Rua LEITE-MOÇA', 'Ativo', 1),
  ('Thiago Bernardes', '552.309.280-00', '2000-07-25', 'estudante34@resilia.com', '(68) 3356-5573', 'Rua VINAGRE', 'Ativo', 1),
  ('Wdson Danrlei', '796.820.430-50', '2000-08-13', 'estudante35@resilia.com', '(87) 3034-9178', 'Rua OLHO-DE-DEDE', 'Ativo', 1),
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



INSERT INTO estudantes (nome, cpf, data_nascimento, email, telefone, endereco, status, id_turma)
VALUES
  ('Aeronauta Barata', '666.537.580-36', '2000-01-11', 'estudante01@resilia.com', '(68) 3640-1708', 'Rua A', 'Ativo', 2),
  ('Agrícola Beterraba Areia', '864.646.970-05', '2000-02-13', 'estudante02@resilia.com', '(65) 3172-1484', 'Rua B', 'Ativo', 2),
  ('Agrícola da Terra Fonseca', '822.807.500-66', '2000-03-08', 'estudante03@resilia.com', '(63) 2047-4597', 'Rua C', 'Ativo', 2),
  ('Alce Barbuda', '455.493.970-72', '2000-02-28', 'estudante04@resilia.com', '(49) 3293-8238', 'Rua D', 'Iniatvo', 2),
  ('Amado Amoroso', '337.539.800-05', '2000-07-26', 'estudante05@resilia.com', '(68) 3137-0727', 'Rua E', 'Ativo', 2),
  ('Amável Pinto', '042.362.170-07', '2000-08-17', 'estudante06@resilia.com', '(51) 3654-1729', 'Rua F', 'Ativo', 2),
  ('Amazonas Rio do Brasil Pimpão', '106.664.380-64', '2000-01-04', 'estudante07@resilia.com', '(96) 2629-6980', 'Rua G', 'Ativo', 2),
  ('América do Sul Brasil de Santana', '526.675.930-57', '2000-02-21', 'estudante08@resilia.com', '(83) 2204-8562', 'Rua H', 'Ativo', 2),
  ('Amin Amou Amado', '828.185.490-19', '2000-04-14', 'estudante09@resilia.com', '(99) 2648-7791', 'Rua J', 'Ativo', 2),
  ('Antonio Manso Pacífico de Oliveira Sossegado', '192.363.600-68', '2000-09-30', 'estudante10@resilia.com', '(66) 3147-7637', 'Rua AA', 'Ativo', 2),
  ('Antônio Morrendo das Dores', '724.141.770-47', '2000-12-19', 'estudante11@resilia.com', '(67) 3234-8622', 'Rua CALANGO', 'Ativo', 2),
  ('Aricléia Café Chá', '355.556.030-10', '2000-05-10', 'estudante12@resilia.com', '(83) 2756-0417', 'Rua LAGARTICHA', 'Ativo', 2),
  ('Ava Gina', '255.484.050-47', '2000-05-31', 'estudante13@resilia.com', '(54) 2102-3021', 'Rua OO', 'Ativo', 2),
  ('Asteróide Silverio', '997.547.630-97', '2000-01-18', 'estudante14@resilia.com', '(55) 3718-9855', 'Rua 5', 'Ativo', 2),
  ('Bandeirante do Brasil Paulistano', '721.031.490-33', '2000-07-06', 'estudante15@resilia.com', '(95) 3780-9426', 'Rua 2', 'Ativo', 2),
  ('Barrigudinha Seleida', '852.324.630-47', '2000-06-07', 'estudante16@resilia.com', '(84) 2069-8172', 'Rua 21', 'Ativo', 2),
  ('Bispo de Paris', '557.722.240-00', '2000-04-16', 'estudante17@resilia.com', '(74) 3638-7377', 'Rua 5', 'Ativo', 2),
  ('Bizarro Assada', '301.009.440-00', '2000-03-10', 'estudante18@resilia.com', '(61) 2661-5488', 'Rua IO', 'Ativo', 2),
  ('Céu Azul do Sol Poente', '635.654.560-78', '2000-02-13', 'estudante19@resilia.com', '(82) 2486-6557', 'Rua POI', 'Ativo', 2),
  ('Chevrolet da Silva Ford', '066.291.830-45', '2000-08-17', 'estudante20@resilia.com', '(98) 3861-5293', 'Rua PIU-PIU', 'Ativo', 2),
  ('Disney Chaplin Milhomem da Silva', '290.837.620-25', '2000-09-30', 'estudante21@resilia.com', '(53) 2951-6575', 'Rua ARROZ', 'Ativo', 2),
  ('Dezêncio Feverêncio de Oitenta e Cinco', '572.482.070-63', '2000-10-11', 'estudante22@resilia.com', '(66) 2676-7723', 'Rua DO CHINA', 'Ativo', 2),
  ('Dolores Fuertes de Barriga', '371.401.310-58', '2000-11-21', 'estudante23@resilia.com', '(96) 3896-5458', 'Rua LOGO ALI', 'Ativo', 2),
  ('Esparadrapo Clemente de Sá', '752.437.460-70', '2000-10-22', 'estudante24@resilia.com', '(17) 3833-3837', 'Rua BATATA', 'Ativo', 2),
  ('Homem Bom da Cunha Souto Maior', '454.570.260-00', '2000-12-27', 'estudante25@resilia.com', '(41) 3328-4551', 'Rua TOMATE', 'Ativo', 2),
  ('Ilegível Inilegível', '869.522.250-05', '2000-06-29', 'estudante26@resilia.com', '(63) 3104-4429', 'Rua FEIJÃO', 'Ativo', 2),
  ('Inocêncio Coitadinho', '118.273.960-16', '2000-01-15', 'estudante27@resilia.com', '(46) 2042-7852', 'Rua FAROFA', 'Ativo', 2),
  ('Janeiro Fevereiro de Março Abril', '753.366.090-05', '2000-10-24', 'estudante28@resilia.com', '(96) 2061-3242', 'Rua CHUHRRASCO', 'Ativo', 2),
  ('Lança Perfume Rodometálico de Andrade', '476.446.450-04', '2000-02-18', 'estudante29@resilia.com', '(13) 2175-5778', 'Rua LEGUMES', 'Ativo', 2),
  ('Marciano Verdinho das Antenas Longas', '581.371.240-20', '2000-09-26', 'estudante30@resilia.com', '(69) 3634-1138', 'Rua BISCOITE', 'Ativo', 2),
  ('Maria Privada de Jesus', '392.248.890-00', '2000-11-16', 'estudante31@resilia.com', '(54) 3874-6653', 'Rua BOLACHA', 'Ativo', 2),
  ('Maria Tributina Prostituta Cataerva', '667.244.010-03', '2000-03-02', 'estudante32@resilia.com', '(61) 3256-4215', 'Rua NESCAL', 'Ativo', 2),
  ('Maria-você-me-mata', '094.716.220-85', '2000-04-05', 'estudante33@resilia.com', '(97) 2684-6277', 'Rua LEITE-MOÇA', 'Ativo', 2),
  ('Mimaré Índio Brazileiro de Campos', '552.309.280-00', '2000-07-25', 'estudante34@resilia.com', '(68) 3356-5573', 'Rua VINAGRE', 'Ativo', 2),
  ('Napoleão Sem Medo e Sem Mácula', '796.820.430-50', '2000-08-13', 'estudante35@resilia.com', '(87) 3034-9178', 'Rua OLHO-DE-DEDE', 'Ativo', 2),
  ('Natal Carnaval', '958.745.580-04', '2000-01-14', 'estudante36@resilia.com', '(43) 2265-5817', 'Rua 4', 'Ativo', 2),
  ('Necrotério Pereira da Silva', '790.512.150-02', '2000-06-30', 'estudante37@resilia.com', '(84) 3963-5400', 'Rua 22', 'Ativo', 2),
  ('Oceâno Atlântico Linhares', '790.512.150-02', '2000-05-20', 'estudante38@resilia.com', '(69) 3814-8221', 'Rua 66', 'Ativo', 2),
  ('Otávio Bundasseca', '659.561.480-47', '2000-10-10', 'estudante39@resilia.com', '(79) 2638-6703', 'Rua 24', 'Ativo', 2),
  ('Pacífico Armando Guerra', '084.350.010-75', '2000-12-21', 'estudante40@resilia.com', '(51) 2436-1794', 'Rua DAS PRIMAS', 'Ativo', 2),
  ('Padre Filho do Espírito Santo Amém', '159.725.700-17', '2000-01-27', 'estudante41@resilia.com', '(27) 3247-6268', 'Rua DE BAIXO', 'Ativo', 2),
  ('Plácido e Seus Companheiros', '894.104.620-37', '2000-03-05', 'estudante42@resilia.com', '(27) 2746-0356', 'Rua DE CIMA', 'Ativo', 2),
  ('Remédio Amargo', '051.646.010-28', '2000-08-16', 'estudante43@resilia.com', '(21) 2767-4541', 'Rua DO CHAPEU', 'Ativo', 2),
  ('Renato Pordeus Furtado', '719.765.870-50', '2000-09-09', 'estudante44@resilia.com', '(61) 3827-8424', 'Rua VIRE A ESQUERDA', 'Ativo', 2),
  ('Restos Mortais de Catarina', '552.028.830-56', '2000-11-19', 'estudante45@resilia.com', '(64) 2316-9163', 'FIM DA Rua', 'Ativo', 2),
  ('Rocambole Simionato', '041.800.990-20', '2000-10-22', 'estudante46@resilia.com', '(79) 3784-5348', 'Rua DEF', 'Ativo', 2),
  ('Universo Cândido', '433.454.460-65', '2000-01-08', 'estudante47@resilia.com', '(99) 3487-2413', 'Rua INT', 'Ativo', 2),
  ('Vicente Mais ou  Menos de Souza', '609.143.310-51', '2000-02-07', 'estudante48@resilia.com', '(97) 3447-4421', 'Rua FLOAT', 'Ativo', 2),
  ('Zélia Tocafundo Pinto', '498.160.720-25', '2000-04-16', 'estudante49@resilia.com', '(98) 2224-3966', 'Rua LEN', 'Ativo', 2),
  ('Zezin da tapioca', '692.369.730-19', '2000-08-17', 'estudante50@resilia.com', '(28) 3767-0482', 'Rua RANGE', 'Ativo', 2);

INSERT INTO pessoas_facilitadoras (nome, data_nascimento, email, especialidades, telefone, endereco, id_turma)
VALUES
  ('Will', '1982-04-11', 'facilitador2@resilia.com', 'Soft, Soft-Skill', '(97) 3447-4421', 'Rua Amarela', 1),
  ('José Luis', '1983-05-22', 'facilitador3@resilia.com', 'Hard, Python', '(98) 2224-3966', 'Rua Vermelha', 1),
  ('A Vic', '1984-01-16', 'facilitador4@resilia.com', 'Soft, Soft-Skill', '(21) 2767-4541', 'Rua Verde', 1),
  ('Joãozin', '1984-01-27', 'facilitador5@resilia.com', 'Hard, Python, sql', '(28) 3767-0482', 'Rua Roxo', 2),
  ('Pedrin da Web', '1985-08-12', 'facilitador6@resilia.com', 'Soft, Soft-Skill', '(27) 2746-0356', 'Rua Marron', 2),
  ('Bernardor Berzerrar', '1984-01-27', 'facilitador7@resilia.com', 'Hard, Python, sql', '(28) 3767-1482', 'Rua Pink', 3);
  