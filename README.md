# Bancos-de-Dados-SQL-e-NoSQL-na-Engenharia-de-Dados  

**Compreender o papel dos Bancos de Dados Relacionais SQL e NoSQL**

_"O principio básico de um Banco de Dados é armazenar informações de um sistema.”_

# SQL - Structured Query Language
 É utilizada para executar comandos em Banco de Dados Relacionais, isto é, baseado em tabelas. É por meio dela que criamos databases, tabelas, colunas, indices, garantimos e revogamos privilégios a usuários e consultamos os dados armazenados no banco de dados.Linguagem declarativa dividida em conjuntos de comandos;  
 
 Data Definition Language (DDL): _Linguagem de Definição de Dados_ são comandos que permitem ao usuário definir as novas tabelas e os elementos que serão associados a elas. Ela é responsável pelos comandos de criação e alteração no banco de dados como; CREATE, DROP, e ALTER.  
 
 Data Manipulation Language (DML):_Linguagem de Manipulação de Dados_ são comandos utilizados para a recuperação, inclusão, remoção e modificação de informações em bancos de dados,(INSERT, UPDATE,DELETE).  
 
 Data Control Language (DCL): _Linguagem de Controle de Dados_ são comandos utilizados para controlar o acesso e gerenciar permissões de usuários no banco de dados osprincipais comandos são: grant: comando utilizado para atribuir privilégios de acesso do usuário a objetos do banco de dados, REVOKE comando utilizado para revogar privilégios de acesso do usuário a objetos do banco de dados.  
 
 Transactional Control Language (TCL): _Linguagem de Controle de Transações_ comandos utilizados para gerenciar as mudanças feitas por instruções DML, os principais comandos são: COMMIT comando utilizado para salvar uma transação, ROLLBACK comando utilizado para restaurar o banco de dados ao estado anterior desde o último COMMIT.  
 
 Data Query Language (DQL): _Linguagem de Consulta de Dados_ utiliza-se do comando SELECT para consulta dos dados.  
 
 
# NoSQL 

_NoSQL é um termo genérico que representa os bancos de dados não relacionais_

Os bancos de dados NoSQL (ou não-relacionais) utilizam um padrão diferente de armazenamento em relação ao SQL. O grande diferencial dessa tecnologia é a capacidade de escalabilidade para as operações das empresas de uma forma mais simples e econômica do que no banco relacional.  

O NoSQL também proporciona uma performance melhor para o gerenciamento de dados das organizações, pois não há necessidade de agrupar os dados em um esquema de tabelas para usar as informações.  

Os bancos de dados NoSQL são ideais para muitos aplicativos modernos, como dispositivos móveis, Web e jogos, que exigem bancos de dados flexíveis, escaláveis, de alta performance e altamente funcionais para proporcionar ótimas experiências aos usuários.  

# Conclusão  

Devemos sempre olhar para as regras de negócio para saber qual é a melhor base de dados para armazenar as informações, pois as Bases de Dados Relacionais (SQL) são uma boa escolha para qualquer negócio que vai se beneficiar de sua estrutura e esquema pré-definidos por outro lado para negócios que possuem crescimento rápido ou bases de dados sem definições claras de esquemas ou não consigam definir um esquema para o seu banco de dados,ou o esquema passe constantemente por mudanças, a estrutura de Dados Não-Relacionais (NoSQL) pode ser a melhor opção.




