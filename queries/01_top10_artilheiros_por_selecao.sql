-- Objetivo: Listar os 10 jogadores com o maior histórico de gols marcados
-- por suas seleções nacionais (international_goals).

SELECT TOP 10
    player_name,
    country,
    international_goals
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE international_goals IS NOT NULL
ORDER BY international_goals DESC;
