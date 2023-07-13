# PROJETO_MODULO_3

# Descrição do Projeto:
Modernizar o processo de armazenamento de dados e construção para gerenciamento da estrutura de ensino da empresa.
Para isso, são armazenadas diversas informações do braço de
ensino da empresa como dados sobre os estudantes, pessoas facilitadoras,turmas, módulos e cursos em planilhas. Essas informações são colocadas
em planilhas diferentes, dificultando muitas das vezes a extração de dados estratégicos para a empresa.
## Os Arquivos estão separados por pasta(diretórios), cada pasta contem um arquivo sql
### create -> create.sql
### delete -> delete.sql
### full   -> código1_completo.sql
### insert -> insert.sql
### select -> select.sql
### update -> update.sql

# Pessoas Desenvolvedoras do Projeto:
Helder Fernandes;
Jaymerson Ferreria;
Lucas Texeira;
Wedson tavares.

# Status do Projeto:
Finalizado

# Como acessar:
Primeiramente crie um banco de dados de preferencia no PgAdmin, pois o código é escrito na linguagem SQL PLpgSQL, com o nome de sua preferencia.
Em seguinda cole o código da pasta "create" para criar as tabelas, depois o código da pasta "insert" para popular essas tabelas.
Caso queira realizar algumas consultas, pode ser feito atravéz dos códigos disponibilizados na pasta "select".
O mesmo vale para update e delete, nas pasta "update" e "delete" respectivamente.

# Funcionalidades e Demonstração da Aplicação:
## Tabela "turmas": 
Essa tabela armazena informações sobre as turmas, como um identificador único ("id"), o nome da turma ("nome"), a data de início ("data_inicio") e a data de término ("data_fim").

## Tabela "cursos": 
Essa tabela armazena informações sobre os cursos, como um identificador único ("id"), o nome do curso ("nome"), a quantidade de estudantes ("qtd_estudantes") e o identificador da turma a qual o curso pertence ("id_turma"). A coluna "id_turma" é uma chave estrangeira que referencia a tabela "turmas" pelo seu identificador ("id").

## Tabela "modulos": 
Essa tabela armazena informações sobre os módulos dos cursos, como um identificador único ("id"), o nome do módulo ("nome"), a data de início ("data_inicio"), a data de término ("data_fim"), uma descrição do módulo ("descricao") e o identificador do curso ao qual o módulo pertence ("id_curso"). A coluna "id_curso" é uma chave estrangeira que referencia a tabela "cursos" pelo seu identificador ("id").

## Tabela "estudantes": 
Essa tabela armazena informações sobre os estudantes, como um identificador único ("id"), o nome do estudante ("nome"), o CPF do estudante ("cpf"), a data de nascimento ("data_nascimento"), o email ("email"), o telefone ("telefone"), o endereço ("endereco"), o status do estudante ("status") e o identificador da turma em que o estudante está matriculado ("id_turma"). A coluna "id_turma" é uma chave estrangeira que referencia a tabela "turmas" pelo seu identificador ("id").

## Tabela "pessoas_facilitadoras": 
Essa tabela armazena informações sobre as pessoas facilitadoras, como um identificador único ("id"), o nome da pessoa facilitadora ("nome"), o CPF da pessoa facilitadora ("cpf"), a data de nascimento ("data_nascimento"), o email ("email"), as especialidades ("especialidades"), o telefone ("telefone"), o endereço ("endereco") e o identificador da turma em que a pessoa facilitadora está vinculada ("id_turma"). A coluna "id_turma" é uma chave estrangeira que referencia a tabela "turmas" pelo seu identificador ("id").

## Tabela "estudante_insert_log": 
Essa tabela é usada para registrar logs de inserção de estudantes. Ela possui um identificador único ("id"), o identificador do estudante relacionado ("estudante_id"), a data de atualização ("data_atualizacao") e o novo status do estudante ("novo_status"). A coluna "estudante_id" é uma chave estrangeira que referencia a tabela "estudantes" pelo seu identificador ("id").

## Função "estudante_status_trigger": 
Essa função é executada como um gatilho (trigger) após uma atualização na tabela "estudantes". Ela verifica se o status do estudante foi alterado e, se sim, insere um registro na tabela "estudante_insert_log" com as informações relevantes.

## Gatilho "trigger_estudante_status": 
Esse gatilho é disparado após uma atualização na tabela "estudantes" e chama a função "estudante_status_trigger" para realizar a ação de inserção de log.

## Tabela "estudante_update_log": 
Essa tabela é usada para registrar logs de atualização de estudantes. Ela possui um identificador único ("id"), o identificador do estudante relacionado ("estudante_id"), a data de atualização ("data_atualizacao"), o nome da coluna afetada ("coluna_afetada"), o valor anterior da coluna ("valor_anterior") e o valor atual da coluna ("valor_atual"). A coluna "estudante_id" é uma chave estrangeira que referencia a tabela "estudantes" pelo seu identificador ("id").

## Função "estudante_update_trigger": 
Essa função é executada como um gatilho (trigger) após uma atualização na tabela "estudantes". Ela percorre as colunas da tabela "estudantes" e, para cada coluna afetada pela atualização, insere um registro na tabela "estudante_update_log" com as informações relevantes.

## Gatilho "trigger_estudante_update": 
Esse gatilho é disparado após uma atualização na tabela "estudantes" e chama a função "estudante_update_trigger" para realizar a ação de inserção de log.

# Tecnologias utilizadas:
## SQL
PLpgSQL
## Visual Studio Code e PgAdmin
Editores de código 
## Git e Github
Controle de versionamento

