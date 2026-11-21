
Projeto de modelagem de banco de dados relacional para um sistema de gestão de clínica veterinária, contemplando as etapas de **Modelagem Conceitual (DER)** e **Modelagem Lógica (Relacional)**. O sistema abrange o cadastro de tutores e animais, controle de veterinários e suas especialidades, agendamento de consultas, registro de atendimentos clínicos e histórico de vacinação.

O objetivo desta modelagem é estruturar os dados essenciais para a operação de uma clínica veterinária, garantindo integridade referencial, normalização de atributos multivalorados e compostos, e rastreabilidade completa do histórico clínico e vacinal de cada paciente.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Descrição do MER:

ENTIDADES - Tutor: A entidade tutor representa os tutores dos animais que estão cadastrados no Petshop, são os donos. Nele estão guardados os atributos de Nome, telefone, CPF, E-Mail, ID do Tutor, e dados de endereço como cidade, rua, número, bairro e cep.

Animal: A entidade animal representa os animais que estão cadastrados no PetShop. Nela estão guardados os atributos de Nome, raça, sexo, espécie, ID do animal, porte, data de nascimento e idade.

Vacina: A entidade vacina representa as vacinas que os animais que estão cadastrados no PetShop receberam. Nela estão guardados os atributos de Nome, fabricante, descrição, intervalo de doses e ID da vacina.

Veterinário: A entidade veterinário representa os veterinários que trabalham no PetShop e que estão cadastrados no sistema. Nele estão guardados os atributos de Nome, CPF, CRMV, E-Mail, telefone, data de contratação, ID do veterinário. 

Especialidade: A entidade especialidade representa as especialidades dos veterinários que estão cadastrados no sistema. Nela estão guardados os atributos de Nome, descrição da especialidade e ID da especialidade dos veterinários. 

Consulta: A entidade consulta representa as consultas que estão marcadas no PetShop e que estão cadastradas no sistema. Nela estão guardados os atributos de motivo, horário, status da consulta, valor da consulta, ID da consulta e a data da consulta. 

Atendimento: A entidade atendimento representa o atendimento que foi feito após a consulta e qual a conclusão do veterinário diante de cada caso. Nela estão guardados os atributos de sintomas, diagnóstico, data de atendimento, tratamento, observações e ID do atendimento realizado. 




ATRIBUTOS - A entidade TUTOR recebe atributo identificador (id_tutor), 2 atributos simples (Nome); (CPF), 2 atributos Multivalorados (E-mail); (Telefone), e um atributo composto (Endereço) que vai se dividir em (Cidade), (Rua), (Número), (Bairro), (CEP). 

A entidade ANIMAL recebe atributo identificador (id_animal), 6 atributos simples (Nome); (Raça); (Sexo); (Espécie); (Porte); (Data_nascimento), e um atributo derivado (Idade). 

A entidade VETERINÁRIO recebe atributo identificador (id_veterinario), 4 atributos simples (Nome);  (CRMV); (CPF); (Data de contratação), também recebe 2 atributos multivalorados (E-Mail); (Telefone). 

A entidade CONSULTA  recebe atributo identificador (id_consulta), e 5 atributos simples (Data_consulta); (Horário); (Valor); (Status_consulta); (Motivo).

A entidade ATENDIMENTO  recebe atributo identificador (id_atendimento), e 5 atributos simples (Data_atendimento); (Diagnóstico); (Síntomas); (Tratamento); (Observações).

A entidade ESPECIALIDADE  recebe atributo identificador (id_especialidade), e 2 atributos simples (Nome); (Descrição).

A entidade VACINA  recebe atributo identificador (id_vacina), e 4 atributos simples (Intervalo_doses); (Nome); (Fabricante); (Descrição).




RELACIONAMENTOS E CARDINALIDADES - 

Tutor - Possuí - Animal: (1:N).
Explicação: Nesse relacionamento um tutor pode possuir vários animais cadastrados na clínica, porém cada animal pertence a apenas um tutor.

Animal - Realiza - Consulta: (1:N).
Explicação: Nesse relacionamento um animal pode realizar várias consultas, porém cada consulta está relacionada a apenas um único animal. 

Veterinário - Atende - Consulta: (1:N).
Explicação: Nesse relacionamento um veterinário pode realizar diversas consultas, enquanto cada consulta é realizada por um único veterinário. 

Consulta - Gera - Atendimento: (1:1).
Explicação: Nesse relacionamento cada consulta pode possuir um único atendimento associado, e cada atendimento pertence a uma única consulta.

Animal - Recebe - Vacina: (N:N).
Explicação: Nesse relacionamento cada animal pode receber diferentes vacinas e diferentes vacinas podem ser aplicadas nos animais. 

Veterinário - Possui - Especialidade: (N:N).
Explicação: Nesse relacionamento um veterinário pode possuir várias especialidades, e uma mesma especialidade pode pertencer a vários veterinários da clínica. 
