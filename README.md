# QA SQL Validation Project

Projeto prático de validação de dados com SQL, desenvolvido para demonstrar conhecimentos aplicados à área de Quality Assurance.

O projeto simula um banco de dados simples de e-commerce, permitindo validar usuários, produtos, pedidos, itens de pedido, regras de negócio e consistência entre tabelas.

---

## Objetivo

Demonstrar o uso de SQL como ferramenta de apoio ao trabalho de QA, utilizando consultas para:

- validar dados cadastrados;
- identificar inconsistências;
- verificar regras de negócio;
- cruzar informações entre tabelas;
- apoiar testes funcionais e análise de defeitos;
- documentar evidências de execução.

---

## Tecnologias utilizadas

- PostgreSQL
- DBeaver
- SQL
- Git
- GitHub
- Markdown

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

## Scripts SQL

### 01 - Criação das tabelas

Arquivo:

```text
scripts/01_create_tables.sql
```

Cria as tabelas principais do banco:

- `users`
- `products`
- `orders`
- `order_items`

Também define chaves primárias, chaves estrangeiras, restrições de unicidade e validações com `CHECK`.

---

### 02 - Inserção da massa de dados

Arquivo:

```text
scripts/02_insert_test_data.sql
```

Insere dados de teste nas tabelas:

- 4 usuários
- 5 produtos
- 3 pedidos
- 4 itens de pedido

Esses dados são utilizados nas consultas de validação.

---

### 03 - Consultas básicas

Arquivo:

```text
scripts/03_basic_selects.sql
```

Contém consultas com:

- `SELECT`
- `WHERE`
- `ORDER BY`

Exemplos de validação:

- usuários ativos;
- usuários bloqueados;
- produtos sem estoque;
- produtos inativos;
- pedidos por status;
- produtos ordenados por preço.

---

### 04 - Validações de regras de negócio

Arquivo:

```text
scripts/04_validation_queries.sql
```

Contém consultas voltadas à análise de inconsistências, como:

- produtos ativos sem estoque;
- pedidos sem itens;
- divergência entre total do pedido e soma dos itens;
- pedidos de usuários bloqueados;
- pedidos de usuários inativos;
- produtos inativos vinculados a pedidos;
- status inválidos;
- valores zerados ou negativos.

---

### 05 - Consultas com JOIN

Arquivo:

```text
scripts/05_join_queries.sql
```

Contém consultas relacionais para cruzar dados entre:

- usuários e pedidos;
- pedidos e itens;
- itens e produtos;
- pedido completo com usuário, produto e total calculado.

Essas consultas simulam validações comuns realizadas por QA para confirmar se os dados exibidos no sistema estão consistentes com os dados gravados no banco.

---

## Documentação

### Dicionário de dados

Arquivo:

```text
docs/data-dictionary.md
```

Descreve as tabelas, campos, tipos de dados, relacionamentos e regras de integridade aplicadas no banco.

---

### Cenários de teste SQL

Arquivo:

```text
docs/test-scenarios.md
```

Documenta os cenários de validação utilizados no projeto, incluindo objetivo, critério de validação, resultado esperado e importância para QA.

---

### Evidências de execução

Arquivo:

```text
docs/evidence.md
```

Reúne prints da execução dos scripts e consultas no DBeaver, demonstrando a criação das tabelas, inserção da massa de dados, consultas básicas, validações de regra de negócio e consultas com JOIN.

---

## Principais validações realizadas

- Validação de usuários bloqueados
- Validação de usuários inativos
- Validação de produtos ativos sem estoque
- Validação de produtos inativos
- Validação de pedidos sem itens
- Validação de consistência do total do pedido
- Validação de pedidos vinculados a usuários bloqueados ou inativos
- Validação de produtos inativos vinculados a pedidos
- Validação de status inválidos
- Validação de valores zerados ou negativos
- Validação de relacionamento entre tabelas com JOIN

---

## Como executar o projeto

### Pré-requisitos

- PostgreSQL instalado
- DBeaver instalado
- Banco de dados criado com o nome:

```text
qa_lab
```

### Ordem de execução dos scripts

Execute os scripts no DBeaver seguindo esta ordem:

```text
1. scripts/01_create_tables.sql
2. scripts/02_insert_test_data.sql
3. scripts/03_basic_selects.sql
4. scripts/04_validation_queries.sql
5. scripts/05_join_queries.sql
```

---

## Competências demonstradas

Este projeto demonstra conhecimentos práticos em:

- SQL básico e intermediário;
- criação de tabelas relacionais;
- chaves primárias e estrangeiras;
- restrições de integridade;
- inserção de massa de dados;
- consultas com filtros;
- ordenação de resultados;
- validações de regras de negócio;
- consultas com `INNER JOIN` e `LEFT JOIN`;
- documentação técnica;
- evidências de teste;
- versionamento com Git e GitHub;
- raciocínio aplicado à área de Quality Assurance.

---

## Aplicação em QA

Em um cenário real, um QA pode utilizar SQL para validar se as informações exibidas no sistema, retornadas por uma API ou gravadas após uma ação do usuário estão corretas no banco de dados.

Este projeto simula esse tipo de validação, demonstrando como consultas SQL podem apoiar testes funcionais, testes de integração, análise de defeitos e investigação de inconsistências.

---

## Autor

Bruno Ramos Lopes

Projeto desenvolvido como parte da transição profissional para a área de Tecnologia, com foco inicial em Quality Assurance.