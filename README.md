# Projeto-Restaurante

## Banco de dados de um restaurante

# Projeto Restaurante — Banco de Dados MySQL

Sistema de Gerenciamento e Análise de Dados desenvolvido para o **Restaurante Beira Mar**[cite: 1]. O projeto abrange desde a modelagem relacional (DDL), carga e atualização de dados (DML) até consultas analíticas avançadas e junções complexas (DQL)[cite: 1, 2, 3, 4, 5, 6].

---

## 📌 Visão Geral do Sistema

O banco de dados relacional foi projetado para integrar o fluxo operacional de atendimento, gestão de fornecedores e controle financeiro[cite: 1]. A modelagem é composta por 5 tabelas[cite: 1]:

- **`funcionarios`**: Cadastro da equipe, cargos, salários e admissões[cite: 1].
- **`clientes`**: Dados cadastrais e contatos da cartela de clientes[cite: 1].
- **`produtos`**: Cardápio oficial categorizado com descrições e valores unitários[cite: 1].
- **`info_produtos`**: Detalhamento de ingredientes e fornecedores de cada produto[cite: 1].
- **`pedidos`**: Registros de vendas conectando cliente, atendente e produto consumido[cite: 1].

---

## 🛠️ Estrutura dos Scripts

### 1. Modelagem Relacional (`DDL`)
- Criação do banco de dados `Restaurante_Beira_Mar`[cite: 1].
- Definição de chaves primárias e relacionamentos com chaves estrangeiras (`FOREIGN KEY`)[cite: 1].
- Tratamento de idempotência com `DROP TABLE IF EXISTS`[cite: 1].

### 2. Carga e Manutenção de Dados (`DML`)
- **Carga Inicial:** Inserção de 10 funcionários, 30 clientes, 20 produtos e 49 pedidos reais[cite: 2].
- **Manutenção:** Atualização de cargos/salários (`UPDATE`), padronização de status de pedidos antigos e remoções condicionais (`DELETE`)[cite: 2].

---

## 📊 Relatório das Análises (DQL)

### Atividade 3 — Consultas Básicas, Filtros e Ordenação
- **Itens de Alto Valor:** Identificação de pratos acima de R$ 30,00 (ex: Bobó de Camarão - R$ 45,00; Picanha na Chapa - R$ 42,00)[cite: 2, 3].
- **Perfil Demográfico:** Mapeamento de clientes nascidos antes de 1985[cite: 2, 3].
- **Filtro de Insumos:** Busca por ingredientes contendo "carne" via operador `LIKE`[cite: 2, 3].
- **Paginação:** Utilização de `LIMIT` e `OFFSET` para seleção de pratos em promoção[cite: 3].

### Atividade 4 — Tratamento de Dados e Condicionais
- **Pendências:** Filtragem de pedidos não concluídos por funcionário[cite: 2, 4].
- **Tratamento de Nulos:** Utilização da função `COALESCE` para exibir status nulos como "Cancelado"[cite: 2, 4].
- **Classificação Salarial:** Aplicação de condicional (`CASE WHEN`) para classificar funcionários com salário acima ou abaixo da média[cite: 4].

### Atividade 5 — Agregação e Métricas Financeiras
- **Indicadores:** Cálculo do total de pedidos (49) e clientes únicos (24)[cite: 2, 5].
- **Média de Preços:** Média geral do cardápio em R$ 23,12 e agrupamento por categoria (Pratos Principais com média de R$ 36,54)[cite: 2, 5].
- **Análise de Fornecedores:** Agrupamento por fornecedor (`GROUP BY` e `HAVING`) destacando parceiros com múltiplos insumos cadastrados[cite: 5].

### Atividade 6 — Cruzamento de Dados (JOINs)
- **Visão 360° de Vendas:** Junção múltipla (`INNER JOIN`) entre `pedidos`, `clientes`, `funcionarios` e `produtos` para cálculo de faturamento por item[cite: 1, 6].
- **Auditoria de Clientes Inativos:** Identificação de clientes sem pedidos através de `LEFT JOIN`[cite: 6].
- **Fidelização:** Ranking dos clientes mais assíduos da base[cite: 6].

---

## 💻 Como Executar

1. Clone o repositório em sua máquina.
2. Abra o seu cliente MySQL (ex: **MySQL Workbench**).
3. Execute o script do **Projeto 1** para criar a estrutura[cite: 1].
4. Execute o script do **Projeto 2** para popular e atualizar a base[cite: 2].
5. Execute as rotinas analíticas das **Atividades 3 a 6** sequencialmente[cite: 3, 4, 5, 6].

