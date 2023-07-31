# PROJETO_MODULO_3

# Descrição do Projeto:
Este repositório contém código SQL utilizado para criar e gerenciar tabelas de um sistema de gerenciamento de cursos no PostgreSQL, implementado através do pgAdmin. O esquema do banco de dados inclui tabelas para gerenciar cursos, módulos, estudantes, facilitadores e informações relacionadas.

Modernizar o processo de armazenamento de dados e construção para gerenciamento da estrutura de ensino da empresa.
Para isso, são armazenadas diversas informações do braço de
ensino da empresa como dados sobre os estudantes, pessoas facilitadoras,turmas, módulos e cursos em planilhas. Essas informações são colocadas
em planilhas diferentes, dificultando muitas das vezes a extração de dados estratégicos para a empresa.

## Os Arquivos estão separados por pasta(diretórios), cada pasta contem um arquivo sql
- create/create.sql
- delete/delete.sql
- full/código1_completo.sql
- insert/insert.sql
- select/select.sql
- update/update.sql
- diagrama/diagrama.png

## Pessoas Desenvolvedoras do Projeto:
Co-facilitador:
- Jaymerson Ferreria
  
Gestor de conhecimento:
- Lucas Texeira
  
Gestor de engajamento:
- Helder Fernandes:
  
Colaborador:
- Wedson tavares

# Descrição das Tabelas
## turmas
Tabela para armazenar informações sobre grupos ou classes de cursos.

Colunas:
- id (SERIAL): Identificador único para cada turma.
- nome (VARCHAR(255)): Nome da turma.
- data_inicio (DATE): Data de início da turma.
- data_fim (DATE): Data de término da turma.

## cursos
Tabela para armazenar informações sobre cursos.

Colunas:
- id (SERIAL): Identificador único para cada curso.
- nome (VARCHAR(255)): Nome do curso.
- qtd_estudantes (INTEGER): Número de estudantes no curso.
- id_turma (INTEGER): Chave estrangeira referenciando a coluna id da tabela turmas.

## modulos
Tabela para armazenar informações sobre módulos de cursos.

Colunas:
- id (SERIAL): Identificador único para cada módulo.
- nome (VARCHAR(255)): Nome do módulo.
- data_inicio (DATE): Data de início do módulo.
- data_fim (DATE): Data de término do módulo.
- descricao (TEXT): Descrição do módulo.
- id_curso (INTEGER): Chave estrangeira referenciando a coluna id da tabela cursos.

## estudantes
Tabela para armazenar informações sobre estudantes.

Colunas:
- id (SERIAL): Identificador único para cada estudante.
- nome (VARCHAR(255)): Nome do estudante.
- cpf (VARCHAR(14)): CPF (Cadastro de Pessoas Físicas) do estudante.
- data_nascimento (DATE): Data de nascimento do estudante.
- email (VARCHAR(255)): Endereço de e-mail do estudante.
- telefone (VARCHAR(15)): Número de telefone do estudante.
- endereco (VARCHAR(255)): Endereço do estudante.
- status (VARCHAR(20)): Status do estudante.
- id_turma (INTEGER): Chave estrangeira referenciando a coluna id da tabela turmas.

## pessoas_facilitadoras
Tabela para armazenar informações sobre facilitadores.

Colunas:
- id (SERIAL): Identificador único para cada facilitador.
- nome (VARCHAR(255)): Nome do facilitador.
- cpf (VARCHAR(14)): CPF (Cadastro de Pessoas Físicas) do facilitador.
- data_nascimento (DATE): Data de nascimento do facilitador.
- email (VARCHAR(255)): Endereço de e-mail do facilitador.
- especialidades (VARCHAR(255)): Especialidades do facilitador.
- telefone (VARCHAR(15)): Número de telefone do facilitador.
- endereco (VARCHAR(255)): Endereço do facilitador.
- id_turma (INTEGER): Chave estrangeira referenciando a coluna id da tabela turmas.

## estudante_update_log
Tabela para registrar atualizações no atributo status dos estudantes.

Colunas:
- id_estudante (INTEGER): Chave estrangeira referenciando a coluna id da tabela estudantes.
- data_update (TIMESTAMP): Registro de data e hora da atualização.
- novo_status (VARCHAR(50)): Novo status após a atualização.
- Gatilhos e Funções
- estudante_update_status_log:

Função que insere um registro na tabela estudante_update_log sempre que o atributo status de um estudante (tabela estudantes) é atualizado.
- Nome do gatilho: UPDATE_STATUS_LOG_TRIGGER
- Tipo do gatilho: BEFORE UPDATE ON estudantes
- estudante_log:

Função que insere um registro na tabela estudante_insert_log sempre que um novo estudante é inserido na tabela estudantes.
- Nome do gatilho: INSERT_LOG_TRIGGER
- Tipo do gatilho: AFTER INSERT ON estudantes
- Tabelas Adicionais
- estudante_insert_log

Tabela para registrar a inserção de novos estudantes na tabela estudantes.

Colunas:
- id_estudante (INTEGER): Chave estrangeira referenciando a coluna id da tabela estudantes.
- data_insert (TIMESTAMP): Registro de data e hora da inserção.
- facilitador_turma

Tabela para criar um relacionamento muitos para muitos entre facilitadores (pessoas_facilitadoras) e turmas (turmas).

Colunas:
- id_facilitador (INT): Chave estrangeira referenciando a coluna id da tabela pessoas_facilitadoras.
- id_turma (INT): Chave estrangeira referenciando a coluna id da tabela turmas.

## Como Executar o Código
1. Instalação do PostgreSQL e pgAdmin:
Antes de executar o código, certifique-se de ter o PostgreSQL instalado em seu sistema, juntamente com o pgAdmin para gerenciamento do banco de dados.

2. Criação do Banco de Dados:

- Abra o pgAdmin e faça login em sua conta de administrador.
- Crie um novo banco de dados clicando com o botão direito em "Banco de Dados" no painel do pgAdmin e selecionando "Novo Banco de Dados".
- Defina um nome para o banco de dados e clique em "Salvar" para criar o banco de dados vazio.

3. Execução do Script SQL:

- Abra o arquivo contendo o código SQL neste repositório em um editor de texto ou ambiente SQL (como o pgAdmin).
- Selecione todo o código SQL e copie-o para a área de transferência.

4. Execução do Script no pgAdmin:

- Abra uma nova janela de consulta SQL no pgAdmin.
- Cole o código SQL copiado na janela de consulta.
- Certifique-se de que o banco de dados correto esteja selecionado na barra de ferramentas do pgAdmin (o banco de dados criado anteriormente).
- Execute o script SQL pressionando o botão "Executar" ou usando o atalho de teclado (normalmente, F5).

5. Verificação das Tabelas:

- Após a execução bem-sucedida, verifique se todas as tabelas foram criadas corretamente no painel "Objetos" do pgAdmin, expandindo o banco de dados e a seção "Tabelas".

6. Configurações Adicionais:

- Se houver necessidade de ajustar alguma configuração específica do sistema ou realizar modificações adicionais, certifique-se de fazer as alterações necessárias no código antes de executá-lo.
Nota
- Lembre-se de que este código é fornecido como referência para criar as tabelas e gatilhos necessários para um sistema de gerenciamento de cursos no PostgreSQL. É essencial adaptar o código de acordo com seus requisitos específicos e garantir o tratamento adequado da segurança e integridade dos dados. Além disso, tenha cuidado ao executar o código em um ambiente de produção, sempre faça backup dos dados importantes e execute o código com a devida atenção.

## Tecnologias utilizadas:
Linguagem SQL
- PLpgSQL
  
Editores de código
- Visual Studio Code e PgAdmin

Controle de versionamento
- Git e Github

## Status do Projeto:
- Finalizado


