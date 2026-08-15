-- Objetivo: Listar os 10 goleiros com mais partidas internacionais disputadas,
-- junto com o clube ao qual pertencem.

SELECT TOP 10
    player_name,
    country,
    club,
    international_caps AS jogos_internacionais
FROM dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026
WHERE international_caps IS NOT NULL
  AND club IS NOT NULL
ORDER BY international_caps DESC;
