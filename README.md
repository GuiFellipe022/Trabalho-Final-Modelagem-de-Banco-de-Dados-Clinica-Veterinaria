🐾 Sistema de Gestão de Clínica Veterinária

Este projeto foi desenvolvido como Trabalho Final da disciplina de Modelagem de Banco de Dados, com o objetivo de aplicar os conhecimentos adquiridos ao longo do semestre na criação e implementação de um banco de dados relacional.

O sistema consiste em uma solução fictícia de gerenciamento para uma clínica veterinária, desenvolvida para organizar e controlar informações de tutores, animais, veterinários, especialidades, consultas, atendimentos e vacinações.

A proposta busca solucionar a necessidade de centralizar e organizar os dados da clínica, facilitando o gerenciamento dos cadastros, o acompanhamento da saúde dos animais e o controle dos serviços veterinários.

O projeto contempla as etapas de desenvolvimento de um banco de dados: modelagem conceitual, modelagem lógica e modelagem física, além da implementação de tabelas, relacionamentos, operações CRUD e consultas SQL para geração de relatórios.

Tecnologias utilizadas:

PostgreSQL
Supabase
SQL
GitHub
Draw.io (diagrams.net)

1. Cenário

O projeto consiste no desenvolvimento de um banco de dados para uma clínica veterinária fictícia, denominada Clínica Veterinária Vida Animal.

A clínica realiza atendimentos veterinários, consultas, acompanhamento clínico, vacinação e outros serviços relacionados à saúde e ao bem-estar dos animais.

Com o crescimento da quantidade de clientes e animais atendidos, surgiu a necessidade de informatizar o gerenciamento das informações, substituindo controles manuais por um sistema organizado e centralizado.

O banco de dados foi desenvolvido para armazenar e relacionar informações de tutores, animais, veterinários, especialidades, consultas, atendimentos, vacinas e contatos.

Objetivos do sistema:

Cadastrar tutores e seus respectivos animais.
Manter informações dos veterinários e suas especialidades.
Registrar consultas e atendimentos.
Controlar aplicações de vacinas e próximas doses.
Armazenar telefones e e-mails dos tutores e veterinários.
Facilitar consultas e relatórios administrativos.
Garantir a integridade e a organização das informações.
Entidades do sistema

2. Modelagem Conceitual

A modelagem conceitual foi desenvolvida utilizando o Modelo Entidade-Relacionamento (MER), representando as entidades, seus atributos e os relacionamentos existentes entre elas.

O modelo contempla os seguintes tipos de atributos:

Simples: nome, CPF, CRMV, valor da consulta e fabricante.
Compostos: endereço do tutor, dividido em rua, número, bairro, cidade e CEP.
Multivalorados: telefones e e-mails, permitindo múltiplos contatos.
Derivados: idade do animal, calculada a partir da data de nascimento.
Chaves primárias: identificadores únicos de cada entidade.
Relacionamentos

O modelo apresenta os seguintes relacionamentos:

1:1 (Um para Um)

Consulta e Atendimento: cada consulta pode possuir um único atendimento associado.

1:N (Um para Muitos)

Tutor e Animal.
Animal e Consulta.
Veterinário e Consulta.
Animal e Vacinação.
Vacina e Vacinação.

N:N (Muitos para Muitos)

Veterinário e Especialidade.
Tutor e Telefone.
Veterinário e Telefone.
Tutor e E-mail.
Veterinário e E-mail.

Os relacionamentos N:N são implementados por meio de tabelas associativas, garantindo a organização e a integridade dos dados.

3. Modelagem Lógica

A modelagem lógica transforma o modelo conceitual em um conjunto de tabelas relacionais.

Foram definidos os atributos, tipos de dados, chaves primárias (PK) e chaves estrangeiras (FK), respeitando os relacionamentos e as regras de integridade referencial.

Os principais tipos de dados utilizados são:

INTEGER: identificadores e relacionamentos.
VARCHAR: nomes, descrições e informações textuais.
DATE: datas de nascimento, consultas e vacinações.
TIME: horários das consultas.
NUMERIC: valores financeiros.
TEXT: observações e descrições.

As chaves estrangeiras garantem que os registros relacionados estejam vinculados corretamente, evitando referências inexistentes.

Diagramas do Banco de Dados

Os diagramas foram desenvolvidos utilizando a ferramenta Draw.io (diagrams.net), representando visualmente as etapas de modelagem do banco de dados da Clínica Veterinária.

Modelo Conceitual (DER)

Representa as entidades, seus atributos, relacionamentos e respectivas cardinalidades, conforme as regras do Modelo Entidade-Relacionamento (MER).

!Modelo Conceitual

Visualizar Modelo Conceitual

Modelo Lógico Relacional

Apresenta a transformação do modelo conceitual em tabelas relacionais, identificando atributos, chaves primárias (PK), chaves estrangeiras (FK) e relacionamentos entre as tabelas.

!Modelo Lógico

Visualizar Modelo Lógico

4. Modelagem Física

A implementação física foi realizada utilizando o Supabase, com PostgreSQL como sistema gerenciador de banco de dados.

Foram criadas as 15 tabelas do projeto, com suas respectivas colunas, tipos de dados, chaves primárias, chaves estrangeiras e restrições.

Também foram implementadas restrições de integridade, como NOT NULL, UNIQUE e relacionamentos entre tabelas.

A tabela Atendimento possui uma restrição UNIQUE sobre o campo id_consulta, garantindo que uma consulta não possua mais de um atendimento associado.

Scripts SQL

Os scripts utilizados na implementação estão organizados no repositório:

sql/01_criacao_tabelas.sql
sql/02_insercao_dados.sql
sql/03_testes_relacionamentos.sql
sql/04_operacoes_crud.sql
sql/05_relatorios.sql
Implementação no Supabase

As capturas de tela da implementação física, incluindo a estrutura das tabelas e seus relacionamentos, estão disponíveis na pasta prints/ deste repositório.

5. Dados

O banco de dados foi preparado para receber informações fictícias e coerentes com o cenário da clínica veterinária, atendendo ao requisito mínimo de 500 registros em cada tabela.

Os dados contemplam:

Tutores com informações cadastrais.
Animais com diferentes nomes, espécies, raças e portes.
Veterinários com informações profissionais.
Especialidades veterinárias.
Consultas com datas, horários, motivos e valores.
Atendimentos com diagnósticos, sintomas e tratamentos.
Vacinas e registros de vacinação.
Telefones e e-mails vinculados aos respectivos responsáveis.

Os dados são fictícios e utilizados exclusivamente para fins acadêmicos e testes de funcionamento do banco de dados.

6. CRUD

Foram realizados testes das quatro operações fundamentais de manipulação de dados, conhecidas como CRUD.

CREATE (Inserção)

Utilização do comando INSERT para cadastrar novos tutores, animais, veterinários e demais informações.

READ (Consulta)

Utilização do comando SELECT para consultar os registros armazenados e visualizar os relacionamentos entre as tabelas.

UPDATE (Atualização)

Utilização do comando UPDATE para modificar informações previamente cadastradas.

DELETE (Exclusão)

Utilização do comando DELETE para remover registros, respeitando as restrições de integridade referencial.

As capturas de tela das operações realizadas estão disponíveis na pasta prints/ do repositório.

7. Relatórios

Foram desenvolvidas 10 consultas SQL para demonstrar a capacidade de recuperação e análise das informações armazenadas no banco de dados.

As consultas utilizam SELECT, WHERE, ORDER BY e JOIN, explorando os relacionamentos entre as entidades.

Relatórios desenvolvidos
Tutores e seus animais: apresenta os tutores e os respectivos animais cadastrados.
Animais por espécie: apresenta os animais conforme suas espécies.
Consultas por veterinário: identifica os profissionais responsáveis pelas consultas realizadas.
Histórico de atendimentos: apresenta os diagnósticos, sintomas e tratamentos registrados.
Vacinas aplicadas: apresenta as vacinas administradas nos animais.
Próximas doses de vacinas: identifica as próximas datas previstas para vacinação.
Veterinários e especialidades: apresenta os profissionais e suas respectivas áreas de atuação.
Consultas por período: permite consultar os atendimentos de acordo com as datas.
Faturamento por veterinário: apresenta os valores das consultas associados aos profissionais.
Histórico completo dos animais: reúne informações dos animais, tutores, consultas, veterinários e atendimentos.

As consultas demonstram a integração entre as tabelas e a utilização dos comandos SQL para geração de informações relevantes à administração da clínica.

Considerações Finais

O desenvolvimento deste projeto permitiu aplicar, na prática, os conceitos de modelagem de banco de dados, desde a identificação das necessidades do cenário até a implementação física utilizando PostgreSQL no Supabase.

A construção dos modelos conceitual, lógico e físico possibilitou compreender a importância da organização das entidades, dos relacionamentos, das chaves primárias e estrangeiras e das restrições de integridade.

Além disso, a realização dos testes CRUD e a elaboração dos relatórios SQL demonstraram a capacidade do banco de dados de armazenar, relacionar, atualizar e recuperar informações.

Dessa forma, o projeto representa uma solução de gerenciamento de informações para uma clínica veterinária fictícia, consolidando os conhecimentos adquiridos na disciplina de Modelagem de Banco de Dados.

Disciplina: Modelagem de Banco de Dados
Trabalho: 2º Bimestre – Trabalho Final
Banco de dados: PostgreSQL / Supabase
Ferramenta de diagramas: Draw.io
Repositório: Sistema de Gestão de Clínica Veterinária