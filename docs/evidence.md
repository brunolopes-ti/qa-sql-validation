# Evidências de Execução SQL

## 01 - Criação das tabelas

O script `01_create_tables.sql` foi executado com sucesso no PostgreSQL utilizando o DBeaver.

Tabelas criadas:

- users
- products
- orders
- order_items

Evidência:

![Tabelas criadas no DBeaver](../screenshots/01_tables_created_dbeaver.png)  

## 02 - Inserção da massa de dados de teste

O script `02_insert_test_data.sql` foi executado com sucesso no PostgreSQL utilizando o DBeaver.

Foram inseridos dados nas seguintes tabelas:

- users
- products
- orders
- order_items

Total de linhas inseridas:

- 4 usuários
- 5 produtos
- 3 pedidos
- 4 itens de pedido

Total geral: 16 registros inseridos.

Evidência da execução do script:

![Execução da massa de dados](../screenshots/02_insert_test_data_execution.png)

Evidências das validações com SELECT:

![Validação da tabela users](../screenshots/03_users_data_validation.png)

![Validação da tabela products](../screenshots/04_products_data_validation.png)

![Validação da tabela orders](../screenshots/05_orders_data_validation.png)

![Validação da tabela order_items](../screenshots/06_order_items_data_validation.png)