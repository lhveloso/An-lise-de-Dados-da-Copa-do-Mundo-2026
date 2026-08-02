# Análise de Dados da Copa do Mundo 2026 SQL Server

Este projeto contém consultas em **SQL Server (T-SQL)** desenvolvidas para analisar o perfil dos jogadores convocados e estatísticas de seleções e clubes para a Copa do Mundo.

## Tecnologias Utilizadas

* **SGBD:** Microsoft SQL Server
* **Linguagem:** T-SQL (Transact-SQL)
* **Ferramenta:** SQL Server Management Studio (SSMS)

## Consultas e Perguntas de Negócio

### 1. Top 10 Artilheiros por Seleção ⚽
**Objetivo:** Identificar os 10 jogadores com o maior número de gols marcados por suas seleções nacionais (`international_goals`).

```sql
SELECT TOP 10 
    player_name, 
    country, 
    international_goals
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE international_goals IS NOT NULL
ORDER BY international_goals DESC;
