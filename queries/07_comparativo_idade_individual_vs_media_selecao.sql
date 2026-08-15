-- Objetivo: Comparar a idade de cada jogador com a idade média da sua
-- seleção, utilizando uma window function (AVG() OVER PARTITION BY).

SELECT
    player_name,
    country,
    age AS idade_jogador,
    AVG(age) OVER (PARTITION BY country) AS media_idade_selecao
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE age IS NOT NULL
ORDER BY media_idade_selecao DESC, age DESC;
