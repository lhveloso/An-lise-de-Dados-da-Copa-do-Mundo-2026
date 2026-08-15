-- Objetivo: Identificar os 10 clubes com o maior número de jogadores de linha
-- convocados para suas respectivas seleções.

SELECT TOP 10
    club,
    COUNT(*) AS total_jogadores
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE club IS NOT NULL
GROUP BY club
ORDER BY total_jogadores DESC;
