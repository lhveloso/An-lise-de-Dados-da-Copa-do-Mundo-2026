-- Objetivo: Identificar os 10 clubes que mais "revelam"/fornecem goleiros
-- convocados para suas seleções.

SELECT TOP 10
    club,
    COUNT(*) AS total_goleiros
FROM dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026
WHERE club IS NOT NULL
GROUP BY club
ORDER BY total_goleiros DESC;
