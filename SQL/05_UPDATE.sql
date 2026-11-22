------------------------------------------
---VERIFICANDO A DISPONIBILIDADE DO CPF---
------------------------------------------
SELECT *
FROM tutor
WHERE cpf = '888.888.888-88';

-------------------------------------------------------------------------
--CPF NÃO ENCONTRADO, ENTÃO PODEMOS INSERIR O DADO PARA O TESTE DO UPDATE
-------------------------------------------------------------------------
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
    'Tutor Teste UPDATE',
    '888.888.888-88',
    'Rua do Teste',
    888,
    'Bairro Teste',
    'Franca',
    '14400-000'
)
RETURNING *;

-------------------------------------------------------------------------------------------------------------------------------------------
---COMO POSSUÍ RETURNING, NÃO É NECESSÁRIO FAZER UM SELECT PARA VERIFICAR SE FOI SALVO. AGORA EU FAÇO O UPDATE, ALTERANDO O NOME DO TUTOR--
-------------------------------------------------------------------------------------------------------------------------------------------
UPDATE tutor
SET nome_tutor = 'Tutor Teste Atualizado'
WHERE cpf = '888.888.888-88'
RETURNING *;

------------------------------------------------------------------------------------------------
---APÓS ISSO EU TESTO PARA VER SE FOI ATUALIZADO NO BANCO DE DADOS PARA QUE O UPDATE FUNCIONE---
------------------------------------------------------------------------------------------------
SELECT *
FROM tutor
WHERE cpf = '888.888.888-88';

----------------------------------------------------
---APÓS ISSO EU FAÇO O DELETE DO DADO TESTE---------
----------------------------------------------------
DELETE FROM tutor
WHERE cpf = '888.888.888-88'
RETURNING *;

----------------------------------------------------
---APÓS ISSO EU TESTO PARA VER SE FOI DELETADO------
----------------------------------------------------
SELECT *
FROM tutor
WHERE cpf = '888.888.888-88';