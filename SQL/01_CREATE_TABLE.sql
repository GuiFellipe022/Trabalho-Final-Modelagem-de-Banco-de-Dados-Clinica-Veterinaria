create table email (
  id_email serial primary key,
  email varchar(100) not null
);

create table telefone (
  id_telefone serial primary key,
  numero_telefone varchar(20) not null
);

create table tutor (
  id_tutor serial primary key,
  nome_tutor varchar(100) not null,
  cpf varchar(14) not null unique,
  rua varchar(100),
  numero int,
  bairro varchar(60),
  cidade varchar(60),
  cep varchar(9)
);

create table veterinario (
  id_veterinario serial primary key,
  nome_veterinario varchar(100) not null,
  crmv varchar(20) not null unique,
  cpf varchar(14) not null unique,
  data_contratacao date
);

create table especialidade (
  id_especialidade serial primary key,
  nome_especialidade varchar(50) not null,
  descricao_especialidade text
);

create table vacina (
  id_vacina serial primary key,
  nome_vacina varchar(100) not null,
  fabricante varchar(100),
  descricao text,
  intervalo_doses varchar(60)
);

create table animal (
  id_animal serial primary key,
  nome_animal varchar(50) not null,
  especie_animal varchar(40),
  raca varchar(40),
  sexo varchar(15),
  data_nascimento date,
  porte varchar(20),
  id_tutor int not null references tutor(id_tutor)
);

create table consulta (
  id_consulta serial primary key,
  data_consulta date not null,
  horario time not null,
  motivo text,
  status_consulta varchar(30),
  valor_consulta decimal(10,2),
  id_animal int not null references animal(id_animal),
  id_veterinario int not null references veterinario(id_veterinario)
);

create table atendimento (
  id_atendimento serial primary key,
  data_atendimento date not null,
  diagnostico text,
  sintomas text,
  tratamento text,
  observacoes text,
  id_consulta int not null references consulta(id_consulta)
);

create table vacinacao (
  id_vacinacao serial primary key,
  data_aplicacao date not null,
  proxima_dose date,
  lote varchar(60),
  observacoes text,
  id_animal int not null references animal(id_animal),
  id_vacina int not null references vacina(id_vacina)
);

create table telefone_tutor (
  id_telefone_tutor serial primary key,
  id_telefone int not null references telefone(id_telefone),
  id_tutor int not null references tutor(id_tutor)
);

create table tutor_email (
  id_email_tutor serial primary key,
  id_email int not null references email(id_email),
  id_tutor int not null references tutor(id_tutor)
);

create table telefone_veterinario (
  id_telefone_veterinario serial primary key,
  id_telefone int not null references telefone(id_telefone),
  id_veterinario int not null references veterinario(id_veterinario)
);

create table email_veterinario (
  id_email_veterinario serial primary key,
  id_email int not null references email(id_email),
  id_veterinario int not null references veterinario(id_veterinario)
);

create table veterinario_especialidade (
  id_veterinario_especialidade serial primary key,
  id_especialidade int not null references especialidade(id_especialidade),
  id_veterinario int not null references veterinario(id_veterinario)
);

