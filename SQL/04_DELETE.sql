--------------------------------------------------------------
----PRIMEIRO CRIAMOS DADOS PARA PODER FAZER O DELETE----------
--------------------------------------------------------------
INSERT INTO tutor (
    nome_tutor,
    cpf,
    rua,
    numero,
    bairro,
    cidade,
    cep
)
VALUES (
    'Tutor Teste DELETE',
    '999.999.999-99',
    'Rua Exclusiva de Teste',
    999,
    'Bairro Teste',
    'Franca',
    '14400-000'
)
RETURNING *;

-------------------------------------------------------------------------------------------
---APÓS ISSO EU TESTO PARA VER SE FOI SALVO NO BANCO DE DADOS PARA QUE O DELETE FUNCIONE---
-------------------------------------------------------------------------------------------
SELECT *
FROM tutor
WHERE id_tutor = 501;

---------------------------------------------------
---APÓS ISSO EU FAÇO O DELETE DO DADO TESTE--------
---------------------------------------------------
DELETE FROM tutor
WHERE id_tutor = 501
RETURNING *;

----------------------------------------------------
---APÓS ISSO EU TESTO PARA VER SE FOI DELETADO------
----------------------------------------------------
SELECT *
FROM tutor
WHERE id_tutor = 501;  

----------------------------------------------------
-----MENSAGEM FINAL: Success. No rows returned------
----------------------------------------------------
