-- Banco e tabela da biblioteca
CREATE DATABASE biblioteca;
USE biblioteca;
 
CREATE TABLE livro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(60) NOT NULL,
  ano INT NOT NULL,
  quantidade INT NOT NULL,
  status VARCHAR(15) NOT NULL
);
 
-- 8 livros
INSERT INTO livro (titulo, autor, ano, quantidade, status) VALUES
  ('Dom Casmurro', 'Machado de Assis', 1899, 3, 'Disponível'),
  ('O Cortiço', 'Aluísio Azevedo', 1890, 2, 'Emprestado'),
  ('Iracema', 'José de Alencar', 1865, 1, 'Disponível'),
  ('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 4, 'Disponível'),
  ('Vidas Secas', 'Graciliano Ramos', 1938, 0, 'Emprestado'),
  ('Capitães da Areia', 'Jorge Amado', 1937, 2, 'Disponível'),
  ('A Hora da Estrela', 'Clarice Lispector', 1977, 1, 'Emprestado'),
  ('O Alienista', 'Machado de Assis', 1882, 5, 'Disponível');

-- QUESTÃO 01: Vidas Secas (id 5) foi devolvido: o status passa a ser Disponível e a quantidade, 1. (UPDATE com duas colunas)
UPDATE livro SET status = 'Disponivel', quantidade = 1 WHERE id = 5;

SET SQL_SAFE_UPDATES = 0;
-- QUESTÃO 02: Chegaram 2 exemplares novos de cada livro do Machado de Assis. Quantas linhas mudaram? (UPDATE com cálculo)
UPDATE livro SET quantidade = quantidade + 2 WHERE autor = 'Machado de Assis';

-- QUESTÃO 03: O livro Iracema (id 3) foi perdido: apague o registro. (DELETE)
delete from livro WHERE ID = 03;

-- QUESTÃO 04: A biblioteca vai descartar os livros emprestados publicados antes de 1900. Qual livro foi apagado? (DELETE com AND)
SELECT titulo from livro
where status = 'Emprestado' and ano < 1900;

-- QUESTÃO 05: Relembrando: mostre o título dos livros com status Disponível. (WHERE)
SELECT titulo FROM livro
where status = 'Disponivel'; 
-- QUESTÃO 06: Relembrando: quantos exemplares a biblioteca tem ao todo? E qual o ano do livro mais novo? (SUM e MAX) 
select sum(quantidade) from livro;
select max(ano) from livro;
