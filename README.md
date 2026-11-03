# 📚 Sistema de Gerenciamento de Biblioteca (MySQL)

Este repositório contém o script SQL para a criação, manipulação e consulta de um banco de dados de biblioteca, desenvolvido no **MySQL Workbench**. O projeto demonstra a aplicação de conceitos fundamentais de Banco de Dados Relacional, incluindo criação de tabelas, inserção de dados, atualizações condicionais com cálculo, remoção de registros e consultas de agregação.

---

## 🛠️ Tecnologias Utilizadas

- **SGBD:** MySQL
- **Ferramenta de Modelagem e Execução:** MySQL Workbench
- **Linguagem:** SQL (DDL e DML)

---

## 🗄️ Estrutura do Banco de Dados

O banco de dados é denominado `biblioteca` e possui a tabela `livro` com a seguinte estrutura:

| Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `AUTO_INCREMENT`, `PRIMARY KEY` | Identificador único do livro |
| `titulo` | `VARCHAR(100)` | `NOT NULL` | Título da obra |
| `autor` | `VARCHAR(60)` | `NOT NULL` | Nome do autor |
| `ano` | `INT` | `NOT NULL` | Ano de publicação |
| `quantidade` | `INT` | `NOT NULL` | Quantidade de exemplares em estoque |
| `status` | `VARCHAR(15)` | `NOT NULL` | Estado do livro (`Disponível` / `Emprestado`) |

---

## 📑 Conteúdo e Exercícios Práticos

O script realiza as seguintes operações organizadas passo a passo:

1. **Criação do Schema e Tabela:** Definição da estrutura principal do banco `biblioteca`.
2. **Carga Inicial de Dados:** Inserção de 8 obras clássicas da literatura brasileira.
3. **Questão 01 - Atualização Dupla (`UPDATE`):** Alteração de status e quantidade após a devolução de um livro (`id = 5`).
4. **Questão 02 - Atualização com Cálculo (`UPDATE`):** Incremento de 2 exemplares no estoque de todos os livros do autor *Machado de Assis*.
5. **Questão 03 - Remoção de Registro (`DELETE`):** Exclusão do livro *Iracema* (`id = 3`) devido à perda.
6. **Questão 04 - Consulta com Múltiplas Condições (`SELECT ... AND`):** Identificação de livros emprestados com publicação anterior a 1900 para descarte.
7. **Questão 05 - Filtragem Simples (`SELECT ... WHERE`):** Listagem dos títulos atualmente disponíveis para empréstimo.
8. **Questão 06 - Funções de Agregação (`SUM` e `MAX`):**
   - Soma total de exemplares no acervo (`SUM(quantidade)`).
   - Identificação do ano de publicação da obra mais recente (`MAX(ano)`).

---

## 🚀 Como Executar

1. Abra o **MySQL Workbench**.
2. Conecte-se ao seu servidor MySQL local ou remoto.
3. Abra um novo arquivo de script SQL (`Ctrl + T` ou `Cmd + T`).
4. Copie o conteúdo do arquivo `script.sql` (ou cole o código abaixo) no editor.
5. Execute o script (`Ctrl + Shift + Enter` ou clique no ícone do raio).

---

## 📜 Script SQL Completo

```sql
-- Criação do banco de dados e seleção
CREATE DATABASE biblioteca;
USE biblioteca;

-- Criação da tabela livro
CREATE TABLE livro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(60) NOT NULL,
  ano INT NOT NULL,
  quantidade INT NOT NULL,
  status VARCHAR(15) NOT NULL
);

-- Inserção de 8 livros iniciais
INSERT INTO livro (titulo, autor, ano, quantidade, status) VALUES
  ('Dom Casmurro', 'Machado de Assis', 1899, 3, 'Disponível'),
  ('O Cortiço', 'Aluísio Azevedo', 1890, 2, 'Emprestado'),
  ('Iracema', 'José de Alencar', 1865, 1, 'Disponível'),
  ('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 4, 'Disponível'),
  ('Vidas Secas', 'Graciliano Ramos', 1938, 0, 'Emprestado'),
  ('Capitães da Areia', 'Jorge Amado', 1937, 2, 'Disponível'),
  ('A Hora da Estrela', 'Clarice Lispector', 1977, 1, 'Emprestado'),
  ('O Alienista', 'Machado de Assis', 1882, 5, 'Disponível');

-- QUESTÃO 01: Atualização de devolução do livro Vidas Secas (id 5)
UPDATE livro SET status = 'Disponivel', quantidade = 1 WHERE id = 5;

-- Desativação temporária do modo de atualização segura para atualização em lote
SET SQL_SAFE_UPDATES = 0;

-- QUESTÃO 02: Adição de +2 exemplares para livros de Machado de Assis
UPDATE livro SET quantidade = quantidade + 2 WHERE autor = 'Machado de Assis';

-- QUESTÃO 03: Deleção do registro do livro perdido Iracema (id 3)
DELETE FROM livro WHERE id = 3;

-- QUESTÃO 04: Seleção dos livros emprestados anteriores a 1900
SELECT titulo FROM livro
WHERE status = 'Emprestado' AND ano < 1900;

-- QUESTÃO 05: Consulta de títulos com status 'Disponivel'
SELECT titulo FROM livro
WHERE status = 'Disponivel';

-- QUESTÃO 06: Agregações (Total de exemplares e ano do livro mais novo)
SELECT SUM(quantidade) AS total_exemplares FROM livro;
SELECT MAX(ano) AS ano_mais_recente FROM livro;
