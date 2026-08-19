# QA SQL Validation Project

![SQL](https://img.shields.io/badge/SQL-Data%20Validation-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Relational%20Database-blue)
![DBeaver](https://img.shields.io/badge/DBeaver-Database%20Tool-brown)
![Data Validation](https://img.shields.io/badge/Data%20Validation-QA-green)
![Database Testing](https://img.shields.io/badge/Database%20Testing-Quality%20Assurance-blueviolet)

Projeto prático de **validação de dados com SQL**, desenvolvido para demonstrar conhecimentos aplicados à área de Quality Assurance.

O projeto simula um banco de dados relacional de e-commerce, permitindo validar usuários, produtos, pedidos, itens de pedido, regras de negócio, relacionamentos entre tabelas e consistência dos dados utilizando **PostgreSQL e DBeaver**.

---

## Objetivo

Demonstrar o uso de SQL como ferramenta de apoio ao trabalho de QA, utilizando consultas para:

- Validar dados cadastrados;
- Identificar inconsistências;
- Verificar regras de negócio;
- Cruzar informações entre tabelas;
- Validar relacionamentos;
- Conferir integridade dos dados;
- Apoiar testes funcionais;
- Apoiar testes de integração;
- Investigar defeitos;
- Documentar evidências de execução.

---

## Tecnologias utilizadas

- SQL;
- PostgreSQL;
- DBeaver;
- Git;
- GitHub;
- Markdown;
- Visual Studio Code.

---

## Estrutura do projeto

```text
qa-sql-validation/
├── docs/
│   ├── data-dictionary.md
│   ├── evidence.md
│   └── test-scenarios.md
│
├── screenshots/
│   ├── 01_tables_created_dbeaver.png
│   ├── 02_insert_test_data_execution.png
│   ├── 03_users_data_validation.png
│   ├── 04_products_data_validation.png
│   ├── 05_orders_data_validation.png
│   ├── 06_order_items_data_validation.png
│   ├── 07_locked_users_validation.png
│   ├── 08_out_of_stock_products_validation.png
│   ├── 09_inactive_products_validation.png
│   ├── 10_orders_by_status_validation.png
│   ├── 11_active_product_without_stock_validation.png
│   ├── 12_order_total_consistency_validation.png
│   ├── 13_blocked_user_orders_validation.png
│   ├── 14_invalid_status_validation.png
│   ├── 15_orders_with_users_join.png
│   ├── 16_complete_order_join.png
│   └── 17_order_total_join_validation.png
│
├── scripts/
│   ├── 01_create_tables.sql
│   ├── 02_insert_test_data.sql
│   ├── 03_basic_selects.sql
│   ├── 04_validation_queries.sql
│   └── 05_join_queries.sql
│
└── README.md
```

---

# Modelagem e estrutura do banco

O projeto utiliza quatro tabelas principais:

```text
users
products
orders
order_items
```

Essas tabelas simulam um fluxo básico de e-commerce envolvendo usuários, produtos, pedidos e os respectivos itens.

A estrutura também contempla:

- Chaves primárias;
- Chaves estrangeiras;
- Relacionamentos entre tabelas;
- Restrições de unicidade;
- Regras de integridade;
- Restrições com `CHECK`.

---

# Scripts SQL

## 01 - Criação das tabelas

Arquivo:

```text
scripts/01_create_tables.sql
```

Responsável pela criação das tabelas:

- `users`;
- `products`;
- `orders`;
- `order_items`.

Também define:

- Primary Keys;
- Foreign Keys;
- Restrições de unicidade;
- Regras de integridade;
- Validações com `CHECK`.

---

## 02 - Inserção da massa de dados

Arquivo:

```text
scripts/02_insert_test_data.sql
```

Insere a massa de dados utilizada nos testes:

| **Entidade** | **Quantidade** |
|---|---:|
| Usuários | 4 |
| Produtos | 5 |
| Pedidos | 3 |
| Itens de pedido | 4 |

Esses dados servem como base para as consultas e cenários de validação.

---

## 03 - Consultas básicas

Arquivo:

```text
scripts/03_basic_selects.sql
```

Contém consultas utilizando:

- `SELECT`;
- `WHERE`;
- `ORDER BY`.

Entre as validações estão:

- Usuários ativos;
- Usuários bloqueados;
- Produtos sem estoque;
- Produtos inativos;
- Pedidos por status;
- Produtos ordenados por preço.

---

## 04 - Validações de regras de negócio

Arquivo:

```text
scripts/04_validation_queries.sql
```

Contém consultas direcionadas à identificação de possíveis inconsistências e violações de regras de negócio.

Validações realizadas:

- Produtos ativos sem estoque;
- Pedidos sem itens;
- Divergência entre total do pedido e soma dos itens;
- Pedidos de usuários bloqueados;
- Pedidos de usuários inativos;
- Produtos inativos vinculados a pedidos;
- Status inválidos;
- Valores zerados ou negativos.

Essas consultas simulam verificações comuns realizadas durante testes de backend, banco de dados e integrações.

---

## 05 - Consultas com JOIN

Arquivo:

```text
scripts/05_join_queries.sql
```

Contém consultas relacionais envolvendo:

- Usuários e pedidos;
- Pedidos e itens;
- Itens e produtos;
- Usuário, pedido, produto e valor;
- Total armazenado e total calculado.

Foram utilizados:

- `INNER JOIN`;
- `LEFT JOIN`.

Essas consultas permitem verificar se informações relacionadas entre diferentes tabelas permanecem consistentes.

---

# Documentação

## Dicionário de dados

Arquivo:

```text
docs/data-dictionary.md
```

Documenta:

- Tabelas;
- Campos;
- Tipos de dados;
- Relacionamentos;
- Restrições;
- Regras de integridade.

---

## Cenários de teste SQL

Arquivo:

```text
docs/test-scenarios.md
```

Documenta os cenários de validação utilizados no projeto, incluindo:

- Objetivo;
- Regra validada;
- Consulta utilizada;
- Resultado esperado;
- Importância da validação para QA.

---

## Evidências de execução

Arquivo:

```text
docs/evidence.md
```

Reúne as evidências das execuções realizadas no DBeaver.

As screenshots demonstram:

- Criação das tabelas;
- Inserção da massa de dados;
- Consultas básicas;
- Validações de regras de negócio;
- Consultas com JOIN;
- Validação de consistência entre tabelas.

---

# Principais validações realizadas

O projeto contempla validações como:

- Usuários bloqueados;
- Usuários inativos;
- Produtos ativos sem estoque;
- Produtos inativos;
- Pedidos sem itens;
- Consistência do total do pedido;
- Pedidos vinculados a usuários bloqueados;
- Pedidos vinculados a usuários inativos;
- Produtos inativos vinculados a pedidos;
- Status inválidos;
- Valores zerados;
- Valores negativos;
- Relacionamentos entre tabelas;
- Consistência de dados utilizando JOIN.

---

# Validação do total do pedido

Uma das validações mais importantes do projeto compara o valor armazenado no pedido com o valor calculado a partir dos respectivos itens.

O objetivo é verificar se:

```text
Total armazenado no pedido
        =
Soma dos valores dos itens
```

Esse tipo de validação ajuda a identificar inconsistências que poderiam afetar:

- Faturamento;
- Checkout;
- Relatórios;
- Integrações;
- Dados apresentados na interface;
- Processos financeiros.

---

# Validação com JOIN

As consultas com JOIN permitem relacionar informações distribuídas entre diferentes tabelas.

Exemplo conceitual:

```text
Usuário
   ↓
Pedido
   ↓
Item do pedido
   ↓
Produto
```

Com esse relacionamento é possível validar se os dados armazenados em diferentes pontos do sistema estão coerentes entre si.

---

# Como executar o projeto

## Pré-requisitos

É necessário possuir:

- PostgreSQL;
- DBeaver;
- Banco de dados configurado.

Banco utilizado no projeto:

```text
qa_lab
```

---

## Ordem de execução

Execute os scripts no DBeaver seguindo esta sequência:

```text
1. scripts/01_create_tables.sql
2. scripts/02_insert_test_data.sql
3. scripts/03_basic_selects.sql
4. scripts/04_validation_queries.sql
5. scripts/05_join_queries.sql
```

Essa ordem garante que:

1. A estrutura do banco seja criada;
2. A massa de dados seja inserida;
3. As consultas básicas possam ser executadas;
4. As regras de negócio sejam validadas;
5. Os relacionamentos entre tabelas sejam analisados.

---

# Evidências

As evidências estão armazenadas na pasta:

```text
screenshots/
```

Entre as principais estão:

```text
01_tables_created_dbeaver.png
02_insert_test_data_execution.png
07_locked_users_validation.png
11_active_product_without_stock_validation.png
12_order_total_consistency_validation.png
13_blocked_user_orders_validation.png
14_invalid_status_validation.png
15_orders_with_users_join.png
16_complete_order_join.png
17_order_total_join_validation.png
```

As screenshots permitem comprovar a execução das consultas e os resultados obtidos no banco de dados.

---

# Aplicação de SQL em QA

Em um cenário real, SQL pode ser utilizado pelo QA para validar dados gerados ou alterados após ações realizadas:

```text
Interface Web / Mobile
        ↓
       API
        ↓
   Banco de dados
```

Por exemplo, após realizar uma compra na interface, o QA pode utilizar consultas SQL para verificar:

- Se o pedido foi criado;
- Se o usuário correto está relacionado ao pedido;
- Se os produtos foram registrados;
- Se as quantidades estão corretas;
- Se o valor total foi calculado corretamente;
- Se o status foi armazenado corretamente.

SQL também pode apoiar:

- Testes funcionais;
- Testes de integração;
- Testes de API;
- Análise de defeitos;
- Investigação de inconsistências;
- Validação de regras de negócio.

---

# Boas práticas aplicadas

Durante o projeto foram utilizadas práticas como:

- Separação dos scripts por finalidade;
- Organização sequencial dos arquivos SQL;
- Massa de dados controlada;
- Uso de Primary Keys;
- Uso de Foreign Keys;
- Restrições de integridade;
- Validação de regras de negócio;
- Consultas específicas para identificação de inconsistências;
- Uso de JOIN para cruzamento de informações;
- Documentação dos cenários;
- Registro de evidências;
- Versionamento com Git e GitHub.

---

# Competências demonstradas

Este projeto demonstra conhecimentos práticos em:

- SQL;
- PostgreSQL;
- DBeaver;
- Database Testing;
- Validação de dados;
- Modelagem relacional;
- Criação de tabelas;
- `CREATE TABLE`;
- `INSERT`;
- `SELECT`;
- `WHERE`;
- `ORDER BY`;
- `INNER JOIN`;
- `LEFT JOIN`;
- Primary Keys;
- Foreign Keys;
- Restrições com `CHECK`;
- Massa de dados;
- Regras de negócio;
- Integridade dos dados;
- Consultas relacionais;
- Investigação de inconsistências;
- Testes funcionais com apoio de banco de dados;
- Testes de integração;
- Evidências de execução;
- Git;
- GitHub;
- Documentação técnica.

---

# Status do projeto

**Concluído nesta etapa.**

O projeto atualmente demonstra:

- Banco relacional criado em PostgreSQL;
- 4 tabelas relacionadas;
- Massa de dados controlada;
- Consultas básicas;
- Consultas de validação;
- Regras de negócio;
- INNER JOIN;
- LEFT JOIN;
- Validação de consistência do total de pedidos;
- Validação de usuários, produtos e pedidos;
- 17 evidências documentadas;
- Uso do DBeaver para análise dos resultados;
- Aplicação prática de SQL no contexto de Quality Assurance.

---

# Próximas melhorias possíveis

- Adicionar consultas com `GROUP BY`;
- Explorar funções de agregação;
- Expandir o uso de subqueries;
- Criar novas regras de validação;
- Adicionar cenários com dados inconsistentes propositalmente;
- Validar dados retornados por uma API contra o banco;
- Explorar views;
- Criar novas consultas voltadas à investigação de defeitos;
- Integrar este laboratório com projetos de testes de API.

---

# Autor

**Bruno Ramos Lopes**

LinkedIn: [linkedin.com/in/brunolopes-ti](https://linkedin.com/in/brunolopes-ti)  
GitHub: [github.com/brunolopes-ti](https://github.com/brunolopes-ti)
