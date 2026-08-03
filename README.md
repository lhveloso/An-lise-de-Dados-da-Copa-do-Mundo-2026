# Análise de Dados - Copa do Mundo FIFA 2026 

Este projeto consiste em uma análise exploratória de dados relacionais com foco nos atletas de linha e goleiros convocados para a Copa do Mundo FIFA 2026. A análise foi realizada utilizando o **SQL Server (SSMS)**, aplicando desde conceitos fundamentais de agregação até funções avançadas de janela (*Window Functions*).
---
## Estrutura do Banco de Dados

O banco de dados `FIFA_DB_players` é composto por duas tabelas principais:
1. `dbo.players_datasets_Stats_FIFA_worldcup2026`: Dados estatísticos de jogadores de linha.
2. `dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026`: Dados estatísticos específicos dos goleiros.
---
## Consultas SQL e Análises Realizadas

### Parte 1: Análise de Jogadores de Linha

#### 1. Top 10 Artilheiros por Seleção 
* **Objetivo:** Listar os 10 jogadores com o maior histórico de gols marcados por suas seleções nacionais (`international_goals`).

```sql
SELECT TOP 10 
    player_name, 
    country, 
    international_goals
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE international_goals IS NOT NULL
ORDER BY international_goals DESC;
