# Análise de Dados - Copa do Mundo FIFA 2026

Este projeto consiste em uma análise exploratória de dados relacionais com foco nos atletas de linha e goleiros convocados para a Copa do Mundo FIFA 2026. A análise foi realizada utilizando o **SQL Server (SSMS)**, aplicando desde conceitos fundamentais de agregação até funções avançadas de janela (*Window Functions*).

---

## Estrutura do Banco de Dados

O banco de dados `FIFA_DB_players` é composto por duas tabelas principais:
1. `dbo.players_datasets_Stats_FIFA_worldcup2026`: Dados estatísticos de jogadores de linha.
2. `dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026`: Dados estatísticos específicos dos goleiros.

---

## Estrutura do Repositório

```
.
├── README.md
└── queries/
    ├── 01_top10_artilheiros_por_selecao.sql
    ├── 02_top10_clubes_com_mais_convocados.sql
    ├── 03_top10_clubes_fabrica_de_goleiros.sql
    ├── 04_top10_goleiros_mais_jogos_e_clubes.sql
    ├── 05_top5_goleiros_mais_experientes.sql
    ├── 06_top10_selecoes_mais_experientes.sql
    └── 07_comparativo_idade_individual_vs_media_selecao.sql
```

---

## Consultas SQL e Análises Realizadas

### Parte 1: Análise de Jogadores de Linha

#### 1. Top 10 Artilheiros por Seleção
* **Objetivo:** Listar os 10 jogadores com o maior histórico de gols marcados por suas seleções nacionais (`international_goals`).
* **Query:** [`queries/01_top10_artilheiros_por_selecao.sql`](queries/01_top10_artilheiros_por_selecao.sql)

```sql
SELECT TOP 10
    player_name,
    country,
    international_goals
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE international_goals IS NOT NULL
ORDER BY international_goals DESC;
```

#### 2. Top 10 Clubes com Mais Convocados
* **Objetivo:** Identificar os 10 clubes com o maior número de jogadores de linha convocados para suas respectivas seleções.
* **Query:** [`queries/02_top10_clubes_com_mais_convocados.sql`](queries/02_top10_clubes_com_mais_convocados.sql)

```sql
SELECT TOP 10
    club,
    COUNT(*) AS total_jogadores
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE club IS NOT NULL
GROUP BY club
ORDER BY total_jogadores DESC;
```

#### 3. Top 10 Seleções Mais Experientes (Maior Média de Idade)
* **Objetivo:** Identificar as 10 seleções com a maior média de idade entre os jogadores de linha convocados.
* **Query:** [`queries/06_top10_selecoes_mais_experientes.sql`](queries/06_top10_selecoes_mais_experientes.sql)

```sql
SELECT TOP 10
    country,
    AVG(age) AS media_idade
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE country IS NOT NULL
GROUP BY country
ORDER BY media_idade DESC;
```

#### 4. Comparativo de Idade Individual vs. Média da Seleção (Window Function)
* **Objetivo:** Comparar a idade de cada jogador com a idade média da sua seleção, utilizando uma *window function* (`AVG() OVER PARTITION BY`) para manter o detalhe individual junto do agregado por grupo.
* **Query:** [`queries/07_comparativo_idade_individual_vs_media_selecao.sql`](queries/07_comparativo_idade_individual_vs_media_selecao.sql)

```sql
SELECT
    player_name,
    country,
    age AS idade_jogador,
    AVG(age) OVER (PARTITION BY country) AS media_idade_selecao
FROM dbo.players_datasets_Stats_FIFA_worldcup2026
WHERE age IS NOT NULL
ORDER BY media_idade_selecao DESC, age DESC;
```

---

### Parte 2: Análise de Goleiros

#### 5. Top 10 Clubes "Fábrica de Goleiros"
* **Objetivo:** Identificar os 10 clubes que mais "revelam"/fornecem goleiros convocados para suas seleções.
* **Query:** [`queries/03_top10_clubes_fabrica_de_goleiros.sql`](queries/03_top10_clubes_fabrica_de_goleiros.sql)

```sql
SELECT TOP 10
    club,
    COUNT(*) AS total_goleiros
FROM dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026
WHERE club IS NOT NULL
GROUP BY club
ORDER BY total_goleiros DESC;
```

#### 6. Top 10 Goleiros com Mais Jogos e Seus Clubes
* **Objetivo:** Listar os 10 goleiros com mais partidas internacionais disputadas (`international_caps`), junto com o clube ao qual pertencem.
* **Query:** [`queries/04_top10_goleiros_mais_jogos_e_clubes.sql`](queries/04_top10_goleiros_mais_jogos_e_clubes.sql)

```sql
SELECT TOP 10
    player_name,
    country,
    club,
    international_caps AS jogos_internacionais
FROM dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026
WHERE international_caps IS NOT NULL
  AND club IS NOT NULL
ORDER BY international_caps DESC;
```

#### 7. Top 5 Goleiros Mais Experientes (Mais Partidas Internacionais)
* **Objetivo:** Listar os 5 goleiros mais experientes, com base no número de partidas internacionais disputadas.
* **Query:** [`queries/05_top5_goleiros_mais_experientes.sql`](queries/05_top5_goleiros_mais_experientes.sql)

```sql
SELECT TOP 5
    player_name,
    country,
    international_caps
FROM dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026
WHERE international_caps IS NOT NULL
ORDER BY international_caps DESC;
```

---

## Conceitos de SQL Aplicados

* Filtragem e ordenação (`WHERE`, `ORDER BY`, `TOP`)
* Agregações e agrupamento (`COUNT`, `AVG`, `GROUP BY`)
* Funções de janela (*Window Functions*) com `AVG() OVER (PARTITION BY ...)`

## Como Executar

1. Restaurar/criar o banco de dados `FIFA_DB_players` no SQL Server, garantindo as tabelas `dbo.players_datasets_Stats_FIFA_worldcup2026` e `dbo.GoalKeeper_datasets_stats_FIFA_Worldcup2026`.
2. Abrir cada arquivo `.sql` da pasta [`queries/`](queries/) no SSMS (ou outro cliente compatível com T-SQL).
3. Executar a query desejada sobre o banco `FIFA_DB_players`.
