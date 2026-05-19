# Dicionário de Dados

Este documento descreve as tabelas utilizadas no projeto `qa-sql-validation`.

O banco simula um cenário simples de e-commerce, com usuários, produtos, pedidos e itens de pedido.  
O objetivo é apoiar validações SQL aplicadas à área de Quality Assurance.

---

## Tabela: users

Armazena os usuários cadastrados no sistema.

| Campo | Tipo | Descrição |
|---|---|---|
| user_id | SERIAL | Identificador único do usuário |
| username | VARCHAR(50) | Nome de usuário utilizado no sistema |
| email | VARCHAR(100) | E-mail do usuário |
| status | VARCHAR(20) | Status do usuário no sistema |
| created_at | TIMESTAMP | Data e hora de criação do registro |

### Valores permitidos para status

| Valor | Significado |
|---|---|
| active | Usuário ativo |
| locked | Usuário bloqueado |
| inactive | Usuário inativo |

---

## Tabela: products

Armazena os produtos disponíveis no sistema.

| Campo | Tipo | Descrição |
|---|---|---|
| product_id | SERIAL | Identificador único do produto |
| product_name | VARCHAR(100) | Nome do produto |
| category | VARCHAR(50) | Categoria do produto |
| price | NUMERIC(10,2) | Preço do produto |
| stock_quantity | INT | Quantidade disponível em estoque |
| is_active | BOOLEAN | Indica se o produto está ativo ou inativo |

---

## Tabela: orders

Armazena os pedidos realizados pelos usuários.

| Campo | Tipo | Descrição |
|---|---|---|
| order_id | SERIAL | Identificador único do pedido |
| user_id | INT | Identificador do usuário vinculado ao pedido |
| order_status | VARCHAR(20) | Status atual do pedido |
| total_amount | NUMERIC(10,2) | Valor total do pedido |
| created_at | TIMESTAMP | Data e hora de criação do pedido |

### Valores permitidos para order_status

| Valor | Significado |
|---|---|
| pending | Pedido pendente |
| paid | Pedido pago |
| cancelled | Pedido cancelado |

---

## Tabela: order_items

Armazena os itens vinculados a cada pedido.

| Campo | Tipo | Descrição |
|---|---|---|
| order_item_id | SERIAL | Identificador único do item do pedido |
| order_id | INT | Identificador do pedido |
| product_id | INT | Identificador do produto |
| quantity | INT | Quantidade do produto no pedido |
| unit_price | NUMERIC(10,2) | Preço unitário do produto no momento do pedido |

---

## Relacionamentos entre tabelas

| Relacionamento | Descrição |
|---|---|
| orders.user_id → users.user_id | Cada pedido pertence a um usuário |
| order_items.order_id → orders.order_id | Cada item pertence a um pedido |
| order_items.product_id → products.product_id | Cada item está vinculado a um produto |

---

## Regras de integridade aplicadas

| Regra | Descrição |
|---|---|
| username UNIQUE | Não permite usuários com o mesmo nome de usuário |
| email UNIQUE | Não permite usuários com o mesmo e-mail |
| status CHECK | Permite apenas status válidos para usuários |
| order_status CHECK | Permite apenas status válidos para pedidos |
| price >= 0 | Não permite produto com preço negativo |
| stock_quantity >= 0 | Não permite estoque negativo |
| quantity > 0 | Não permite item de pedido com quantidade zero ou negativa |
| total_amount >= 0 | Não permite pedido com valor negativo |

---

## Aplicação para QA

Este modelo permite validar cenários como:

- usuário bloqueado realizando pedido;
- produto ativo sem estoque;
- produto inativo vinculado a pedido;
- pedido sem itens;
- divergência entre valor total do pedido e soma dos itens;
- status inválidos;
- valores zerados ou negativos;
- consistência entre tabelas relacionadas.