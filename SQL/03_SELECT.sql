------------------------------------
------ 01_listar_tutores.sql -------
------------------------------------
SELECT
    id_tutor,
    nome_tutor,
    cpf,
    rua,
    numero,
    bairro,
    cidade,
    cep
FROM tutor
ORDER BY id_tutor
LIMIT 20;
-----------------------------------
-----02_listar_veterinarios.sql----
-----------------------------------
SELECT
    id_veterinario,
    nome_veterinario,
    cpf,
    crmv
FROM veterinario
ORDER BY id_veterinario
LIMIT 20;
-----------------------------------
-------03_listar_animais.sql-------
-----------------------------------
SELECT
    a.id_animal,
    a.nome_animal,
    a.especie_animal,
    a.raca,
    a.sexo,
    a.porte,
    t.nome_tutor
FROM animal a
INNER JOIN tutor t
    ON a.id_tutor = t.id_tutor
ORDER BY a.id_animal
LIMIT 20;
-----------------------------------
-------04_listar_vacinas.sql-------
-----------------------------------
SELECT
    id_vacina,
    nome_vacina,
    fabricante,
    descricao,
    intervalo_doses
FROM vacina
ORDER BY id_vacina
LIMIT 20;
-----------------------------------
-------05_listar_consultas.sql-----
-----------------------------------
SELECT
    id_consulta,
    data_consulta,
    horario,
    id_animal,
    id_veterinario
FROM consulta
ORDER BY id_consulta
LIMIT 20;
-----------------------------------
----06_consultas_completas.sql-----
-----------------------------------
SELECT
    c.id_consulta,
    c.data_consulta,
    c.horario,
    a.nome_animal,
    t.nome_tutor,
    v.nome_veterinario
FROM consulta c
INNER JOIN animal a
    ON c.id_animal = a.id_animal
INNER JOIN tutor t
    ON a.id_tutor = t.id_tutor
INNER JOIN veterinario v
    ON c.id_veterinario = v.id_veterinario
ORDER BY c.id_consulta
LIMIT 20;
---------------------------------------------
----07_listar_atendimentos_completos.sql-----
---------------------------------------------
SELECT
    at.id_atendimento,
    at.data_atendimento,
    at.diagnostico,
    at.sintomas,
    at.tratamento,
    at.observacoes,
    c.data_consulta,
    a.nome_animal,
    t.nome_tutor,
    v.nome_veterinario
FROM atendimento at
INNER JOIN consulta c
    ON at.id_consulta = c.id_consulta
INNER JOIN animal a
    ON c.id_animal = a.id_animal
INNER JOIN tutor t
    ON a.id_tutor = t.id_tutor
INNER JOIN veterinario v
    ON c.id_veterinario = v.id_veterinario
ORDER BY at.id_atendimento
LIMIT 20;


