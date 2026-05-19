# Cenários de Teste SQL

Este documento descreve cenários de validação SQL aplicados ao projeto `qa-sql-validation`.

O objetivo é demonstrar como consultas SQL podem ser utilizadas por um QA para validar regras de negócio, integridade de dados e consistência entre tabelas.

---

## CT-SQL-01 - Validar usuários bloqueados

**Objetivo:**  
Verificar se existem usuários com status bloqueado no sistema.

**Tabela utilizada:**  
`users`

**Consulta relacionada:**  
`QA-VAL-01`

**Critério de validação:**  
Usuários com status `locked` devem ser identificados corretamente.

**Resultado esperado:**  
A consulta deve retornar os usuários bloqueados cadastrados na base.

**Importância para QA:**  
Esse cenário ajuda a validar se usuários bloqueados estão corretamente classificados no banco e podem ser impedidos de realizar ações no sistema.

---

## CT-SQL-02 - Validar produtos ativos sem estoque

**Objetivo:**  
Identificar produtos que estão ativos, mas possuem estoque igual a zero.

**Tabela utilizada:**  
`products`

**Consulta relacionada:**  
`QA-VAL-02`

**Critério de validação:**  
Produtos com `is_active = TRUE` e `stock_quantity = 0` devem ser analisados.

**Resultado esperado:**  
A consulta deve retornar produtos ativos sem estoque, caso existam.

**Importância para QA:**  
Esse cenário pode indicar risco de o sistema exibir produtos indisponíveis para compra.

---

## CT-SQL-03 - Validar produtos inativos

**Objetivo:**  
Verificar se existem produtos marcados como inativos.

**Tabela utilizada:**  
`products`

**Consulta relacionada:**  
`QA-VAL-03`

**Critério de validação:**  
Produtos com `is_active = FALSE` devem ser identificados.

**Resultado esperado:**  
A consulta deve retornar os produtos inativos cadastrados.

**Importância para QA:**  
Ajuda a validar se produtos inativos não estão sendo exibidos ou vendidos indevidamente.

---

## CT-SQL-04 - Validar pedidos sem itens

**Objetivo:**  
Verificar se existem pedidos cadastrados sem itens vinculados.

**Tabelas utilizadas:**  
`orders`  
`order_items`

**Consulta relacionada:**  
`QA-VAL-04`

**Critério de validação:**  
Todo pedido deve possuir pelo menos um item vinculado.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Pedido sem item pode indicar falha no processo de compra, integração ou gravação dos dados.

---

## CT-SQL-05 - Validar consistência do valor total do pedido

**Objetivo:**  
Comparar o valor total registrado no pedido com a soma dos itens vinculados a ele.

**Tabelas utilizadas:**  
`orders`  
`order_items`

**Consulta relacionada:**  
`QA-VAL-05`

**Critério de validação:**  
O campo `orders.total_amount` deve ser igual à soma de `quantity * unit_price` dos itens do pedido.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Esse cenário valida a consistência financeira do pedido e pode revelar divergências entre cálculo de tela, API e banco de dados.

---

## CT-SQL-06 - Validar pedidos de usuários bloqueados

**Objetivo:**  
Verificar se existem pedidos vinculados a usuários bloqueados.

**Tabelas utilizadas:**  
`users`  
`orders`

**Consulta relacionada:**  
`QA-VAL-06`

**Critério de validação:**  
Usuários com status `locked` não deveriam possuir novos pedidos válidos.

**Resultado esperado:**  
A consulta não deve retornar registros, dependendo da regra de negócio definida.

**Importância para QA:**  
Ajuda a validar se restrições de conta bloqueada estão sendo respeitadas pelo sistema.

---

## CT-SQL-07 - Validar pedidos de usuários inativos

**Objetivo:**  
Verificar se existem pedidos vinculados a usuários inativos.

**Tabelas utilizadas:**  
`users`  
`orders`

**Consulta relacionada:**  
`QA-VAL-07`

**Critério de validação:**  
Usuários com status `inactive` não deveriam realizar novos pedidos.

**Resultado esperado:**  
A consulta não deve retornar registros, dependendo da regra de negócio definida.

**Importância para QA:**  
Esse cenário ajuda a identificar possíveis falhas de controle de acesso ou regras de negócio.

---

## CT-SQL-08 - Validar produtos inativos vinculados a pedidos

**Objetivo:**  
Verificar se produtos inativos estão vinculados a pedidos.

**Tabelas utilizadas:**  
`products`  
`orders`  
`order_items`

**Consulta relacionada:**  
`QA-VAL-08`

**Critério de validação:**  
Produtos inativos não deveriam estar disponíveis para novas compras.

**Resultado esperado:**  
A consulta não deve retornar registros para pedidos recentes ou válidos, dependendo da regra de negócio.

**Importância para QA:**  
Esse cenário ajuda a identificar se produtos desativados continuam sendo utilizados indevidamente em pedidos.

---

## CT-SQL-09 - Validar produtos sem estoque vinculados a pedidos não cancelados

**Objetivo:**  
Verificar se existem produtos sem estoque vinculados a pedidos com status diferente de cancelado.

**Tabelas utilizadas:**  
`products`  
`orders`  
`order_items`

**Consulta relacionada:**  
`QA-VAL-09`

**Critério de validação:**  
Produtos com `stock_quantity = 0` não deveriam estar vinculados a pedidos ativos, pagos ou pendentes.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Esse cenário pode indicar venda de produto indisponível em estoque.

---

## CT-SQL-10 - Validar status inválido em pedidos

**Objetivo:**  
Verificar se existem pedidos com status fora dos valores permitidos.

**Tabela utilizada:**  
`orders`

**Consulta relacionada:**  
`QA-VAL-10`

**Critério de validação:**  
O campo `order_status` deve conter apenas os valores `pending`, `paid` ou `cancelled`.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Ajuda a validar padronização dos dados e prevenir falhas em relatórios, filtros e regras do sistema.

---

## CT-SQL-11 - Validar status inválido em usuários

**Objetivo:**  
Verificar se existem usuários com status fora dos valores permitidos.

**Tabela utilizada:**  
`users`

**Consulta relacionada:**  
`QA-VAL-11`

**Critério de validação:**  
O campo `status` deve conter apenas os valores `active`, `locked` ou `inactive`.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Ajuda a garantir consistência nos estados possíveis de um usuário no sistema.

---

## CT-SQL-12 - Validar produtos com preço zerado ou negativo

**Objetivo:**  
Verificar se existem produtos com preço inválido.

**Tabela utilizada:**  
`products`

**Consulta relacionada:**  
`QA-VAL-12`

**Critério de validação:**  
Produtos não devem possuir preço menor ou igual a zero, salvo regra específica de negócio.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Esse cenário ajuda a identificar falhas de cadastro ou problemas que podem impactar o processo de compra.

---

## CT-SQL-13 - Validar pedidos com valor zerado ou negativo

**Objetivo:**  
Verificar se existem pedidos com valor total inválido.

**Tabela utilizada:**  
`orders`

**Consulta relacionada:**  
`QA-VAL-13`

**Critério de validação:**  
Pedidos não devem possuir `total_amount` menor ou igual a zero, salvo regra específica de negócio.

**Resultado esperado:**  
A consulta não deve retornar registros.

**Importância para QA:**  
Esse cenário ajuda a identificar inconsistências financeiras nos pedidos.

---

## Resumo das validações

| Cenário | Validação | Resultado esperado |
|---|---|---|
| CT-SQL-01 | Usuários bloqueados | Retornar usuários bloqueados existentes |
| CT-SQL-02 | Produtos ativos sem estoque | Retornar produtos para análise |
| CT-SQL-03 | Produtos inativos | Retornar produtos inativos existentes |
| CT-SQL-04 | Pedidos sem itens | Não retornar registros |
| CT-SQL-05 | Divergência no total do pedido | Não retornar registros |
| CT-SQL-06 | Pedidos de usuários bloqueados | Não retornar registros |
| CT-SQL-07 | Pedidos de usuários inativos | Não retornar registros |
| CT-SQL-08 | Produtos inativos em pedidos | Não retornar registros |
| CT-SQL-09 | Produtos sem estoque em pedidos não cancelados | Não retornar registros |
| CT-SQL-10 | Status inválido em pedidos | Não retornar registros |
| CT-SQL-11 | Status inválido em usuários | Não retornar registros |
| CT-SQL-12 | Produtos com preço inválido | Não retornar registros |
| CT-SQL-13 | Pedidos com valor inválido | Não retornar registros |

---

## Conclusão

Os cenários documentados demonstram o uso de SQL como apoio ao processo de Quality Assurance.

As validações permitem investigar dados, confirmar regras de negócio, identificar inconsistências e apoiar testes funcionais, testes de integração e análise de defeitos.