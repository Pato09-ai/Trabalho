CREATE TABLE IF NOT EXISTS `Autores` (
	`id_autor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Popularidade` int NOT NULL,
	`Nacionalidade` varchar(50) NOT NULL,
	`Nome` varchar(100) NOT NULL,
	`Contato` int NOT NULL,
	PRIMARY KEY (`id_autor`)
);
CREATE TABLE IF NOT EXISTS `Livros` (
	`id_livro` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Titulo` varchar(30) NOT NULL,
	`Id_autor` int NOT NULL,
	`Ano_publicacao` date NOT NULL,
	`Classificação_indicativa` int NOT NULL,
	PRIMARY KEY (`id_livro`)
);
CREATE TABLE IF NOT EXISTS `Usuários` (
	`id_usuario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nome` varchar(20) NOT NULL,
	`Email` varchar(20) NOT NULL,
	`Telefone` varchar(21) NOT NULL,
	`Pendências` int NOT NULL,
	PRIMARY KEY (`id_usuario`)
);
CREATE TABLE IF NOT EXISTS `Empréstimos` (
	`id_empréstimo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Data_devolução` date NOT NULL,
	`Id_usuarios` int NOT NULL,
	`Data_empréstimo` date NOT NULL,
	`Quantidade_emprestimo` int NOT NULL,
	PRIMARY KEY (`id_empréstimo`)
);
CREATE TABLE IF NOT EXISTS `Itens_emprestimo` (
	`id_item` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Id_empréstimo` int NOT NULL,
	`Id_livro` int NOT NULL,
	`Valor` int NOT NULL,
	`Quantidade_empréstimos` int NOT NULL,
	PRIMARY KEY (`id_item`)
);
ALTER TABLE `Livros` ADD CONSTRAINT `Livros_fk2` FOREIGN KEY (`Id_autor`) REFERENCES `Autores`(`id_autor`);
ALTER TABLE `Empréstimos` ADD CONSTRAINT `Empréstimos_fk2` FOREIGN KEY (`Id_usuarios`) REFERENCES `Usuários`(`id_usuario`);
ALTER TABLE `Itens_emprestimo` ADD CONSTRAINT `Itens_emprestimo_fk1` FOREIGN KEY (`Id_empréstimo`) REFERENCES `Empréstimos`(`id_empréstimo`);
ALTER TABLE `Itens_emprestimo` ADD CONSTRAINT `Itens_emprestimo_fk2` FOREIGN KEY (`Id_livro`) REFERENCES `Livros`(`id_livro`);