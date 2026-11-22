---------------------------------------------------------   
------------CONSULTA DE ANIMAIS POR TUTORES--------------
---------------------------------------------------------

SELECT
    a.id_animal,
    a.nome_animal,
    a.especie_animal,
    a.raca,
    t.id_tutor,
    t.nome_tutor
FROM animal a
INNER JOIN tutor t
    ON a.id_tutor = t.id_tutor
WHERE a.nome_animal IS NOT NULL
ORDER BY t.nome_tutor ASC;

----------------------------------------------------------------
--------LISTAR ANIMAIS E SEUS TUTORES POR ESPECIE E PORTE-------
----------------------------------------------------------------

SELECT
    a.nome_animal,
    a.especie_animal,
    a.raca,
    a.porte,
    t.nome_tutor
FROM animal a
INNER JOIN tutor t
    ON a.id_tutor = t.id_tutor
WHERE a.especie_animal IS NOT NULL
ORDER BY a.especie_animal ASC, a.nome_animal ASC;

----------------------------------------------------------
-------IDENTIFICAR AS CONSULTAS DE CADA VETERINÁRIO-------
----------------------------------------------------------

SELECT
    c.id_consulta,
    v.id_veterinario,
    v.nome_veterinario
FROM consulta c
INNER JOIN veterinario v
    ON c.id_veterinario = v.id_veterinario
WHERE c.id_veterinario IS NOT NULL
ORDER BY v.nome_veterinario ASC, c.id_consulta ASC;

--------------------------------------------------------------------
-------CONSULTAR DIAGNOSTICOS E TRATAMENTOS DE CADA ANIMAL----------
--------------------------------------------------------------------

SELECT
    at.id_atendimento,
    at.data_atendimento,
    at.diagnostico,
    at.sintomas,
    at.tratamento,
    c.id_consulta
FROM atendimento at
INNER JOIN consulta c
    ON at.id_consulta = c.id_consulta
WHERE at.diagnostico IS NOT NULL
ORDER BY at.data_atendimento DESC;

-------------------------------------------------------------------
----IDENTIFICAR OS PROFISSIONAIS RESPONSAVEIS POR CADA CONSULTA----
-------------------------------------------------------------------

SELECT
    at.id_atendimento,
    at.data_atendimento,
    at.diagnostico,
    v.id_veterinario,
    v.nome_veterinario
FROM atendimento at
INNER JOIN consulta c
    ON at.id_consulta = c.id_consulta
INNER JOIN veterinario v
    ON c.id_veterinario = v.id_veterinario
WHERE at.data_atendimento IS NOT NULL
ORDER BY v.nome_veterinario ASC, at.data_atendimento DESC;

-----------------------------------------------------------------
----CONSULTAR QUAIS SÃO AS ESPECIALIDADES DOS VETERINÁRIOS-------
-----------------------------------------------------------------

SELECT
    v.id_veterinario,
    v.nome_veterinario,
    e.id_especialidade,
    e.nome_especialidade
FROM veterinario v
INNER JOIN veterinario_especialidade ve
    ON v.id_veterinario = ve.id_veterinario
INNER JOIN especialidade e
    ON ve.id_especialidade = e.id_especialidade
WHERE e.nome_especialidade IS NOT NULL
ORDER BY e.nome_especialidade ASC, v.nome_veterinario ASC;

----------------------------------------------------------------
------IDENTIFICAR QUANTOS ANIMAIS CADA TUTOR POSSUÍ-------------
----------------------------------------------------------------

SELECT
    t.id_tutor,
    t.nome_tutor,
    COUNT(a.id_animal) AS total_animais
FROM tutor t
INNER JOIN animal a
    ON t.id_tutor = a.id_tutor
WHERE a.id_animal IS NOT NULL
GROUP BY
    t.id_tutor,
    t.nome_tutor
ORDER BY total_animais DESC, t.nome_tutor ASC;

---------------------------------------------------------------------
----IDENTIFICAR QUAIS SÃO OS VETERINÁRIOS QUE TEM MAIS CONSULTAS-----
---------------------------------------------------------------------

SELECT
    v.id_veterinario,
    v.nome_veterinario,
    COUNT(c.id_consulta) AS total_consultas
FROM veterinario v
INNER JOIN consulta c
    ON v.id_veterinario = c.id_veterinario
WHERE c.id_consulta IS NOT NULL
GROUP BY
    v.id_veterinario,
    v.nome_veterinario
ORDER BY total_consultas DESC, v.nome_veterinario ASC;

--------------------------------------------------------------------
------CONTAGEM DE VETERINÁRIOS POR ESPECIALIDADES-------------------
--------------------------------------------------------------------

SELECT
    e.id_especialidade,
    e.nome_especialidade,
    COUNT(v.id_veterinario) AS total_veterinarios
FROM especialidade e
INNER JOIN veterinario_especialidade ve
    ON e.id_especialidade = ve.id_especialidade
INNER JOIN veterinario v
    ON ve.id_veterinario = v.id_veterinario
WHERE v.nome_veterinario IS NOT NULL
GROUP BY
    e.id_especialidade,
    e.nome_especialidade
ORDER BY total_veterinarios DESC, e.nome_especialidade ASC;

------------------------------------------------------------------------------------
-------APRESENTAR O HISTÓRICO DOS ATENDIMENTOS E SEUS RESPECTIVOS VETERINÁRIOS------
------------------------------------------------------------------------------------

SELECT
    at.id_atendimento,
    at.data_atendimento,
    at.diagnostico,
    at.sintomas,
    at.tratamento,
    v.id_veterinario,
    v.nome_veterinario
FROM atendimento at
INNER JOIN consulta c
    ON at.id_consulta = c.id_consulta
INNER JOIN veterinario v
    ON c.id_veterinario = v.id_veterinario
WHERE at.tratamento IS NOT NULL
ORDER BY at.data_atendimento DESC, v.nome_veterinario ASC;