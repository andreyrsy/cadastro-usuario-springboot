# Cadastro de Usuários com Spring Boot

Este projeto foi desenvolvido como parte do meu aprendizado em Java com Spring Boot, focando em conceitos essenciais de estruturação, convenções, anotações e integração com banco de dados usando JPA/Hibernate.

---

## 📁 Estrutura de Pastas

- **business/**: Contém as regras de negócio (ex: `UsuarioService`).
- **controller/**: Recebe e trata as requisições HTTP (ex: `UsuarioController`).
- **infrastructure/**
  - **entities/**: Classes que representam tabelas do banco de dados (ex: `Usuario.java`).
  - **repository/**: Interfaces para acessar o banco de dados (ex: `UsuarioRepository.java`).
- **resources/**: Arquivos de configuração e recursos estáticos.
- **test/**: Testes automatizados.

---

## 🏗️ Convenções Utilizadas

- **Separação de responsabilidades**: Cada camada (controller, service, repository) tem uma função clara.
- **Padrão de nomes**: Classes e métodos nomeados de acordo com sua função.
- **Uso de pacotes**: Organização do código para facilitar manutenção e escalabilidade.

---

## 📝 Anotações Importantes

- `@Entity`: Marca a classe como uma entidade JPA (tabela do banco).
- `@Id`, `@GeneratedValue`: Indicam a chave primária e sua geração automática.
- `@Table`, `@Column`: Configuram nomes de tabelas e colunas.
- `@Repository`: Marca a interface como repositório de dados.
- `@Service`: Indica uma classe de serviço (regras de negócio).
- `@RestController`, `@RequestMapping`, `@PostMapping`, etc.: Definem endpoints e rotas HTTP.
- **Lombok**:  
  - `@Getter`, `@Setter`, `@Builder`, `@NoArgsConstructor`, `@AllArgsConstructor`: Geram código automaticamente, como getters, setters e construtores.

---

## 🗄️ JPA/Hibernate

- **JPA**: Especificação para mapear objetos Java para tabelas do banco (ORM).
- **Hibernate**: Implementação do JPA, faz o trabalho de persistência dos dados.
- Permitem salvar, buscar, atualizar e deletar objetos Java no banco sem SQL manual.

---

## ⚙️ Exemplos de Funcionalidades

- **Salvar usuário**: `usuarioRepository.save(usuario)`
- **Buscar por e-mail**: `usuarioRepository.findByEmail(email)`
- **Atualizar usuário**: Lógica para atualizar apenas campos enviados.
- **Deletar usuário**: `usuarioRepository.deleteByEmail(email)`

---

## 🚀 Aprendizados

- Como estruturar um projeto Spring Boot de forma organizada.
- Importância da separação de camadas (controller, service, repository).
- Uso de anotações do Spring e do Lombok para facilitar o desenvolvimento.
- Como o JPA/Hibernate simplifica o acesso ao banco de dados.
- Como criar endpoints REST para operações CRUD.

---

# Cadastro de Usuários com Spring Boot

## 🐳 Rodando o projeto com Docker Compose

1. **Compile o projeto:**
   ```sh
   ./mvnw clean package
   ```
   ou no Windows:
   ```
   mvnw.cmd clean package
   ```

2. **Suba a aplicação e o banco de dados:**
   ```
   docker-compose up --build
   ```

3. **Acesse em:**  
   [http://localhost:8081-h2/console](http://localhost:8081)

4. **Para parar tudo:**
   ```
   docker-compose down
   ```

> Não precisa instalar Java ou banco de dados localmente, só o Docker. 
