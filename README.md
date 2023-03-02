## API Coyo Mart
Esta é uma API Rest desenvolvida em Ruby on Rails para gerenciar o cadastro de produtos, categorias de produtos e clientes. A API também usa RSpec para testes automatizados e uma gem chamada simplecov para verificar a cobertura total dos testes.

#### Requisitos
Antes de usar a API, certifique-se de que você tenha os seguintes requisitos instalados:

- Rails 3.1.3
- Mysql

#### Clone o repositório:
```ruby
> git clone https://github.com/lucasdeandrade/api-coyo-mart.git
```
#### Instale as dependências:
```ruby
> bundle install
```
#### Crie o banco de dados e execute as migrações:

```ruby
> rake db:create db:migrate
```
#### Execute os testes:

```ruby
> rspec
```
## Uso
#### A API possui três recursos principais:

##### - Produtos
##### - Categorias de produtos
##### - Clientes
Para usar a API, você precisa enviar requisições HTTP para as rotas correspondentes a cada recurso. Por exemplo, para criar um novo produto, você deve enviar uma requisição POST para a rota /products com os dados do produto no corpo da requisição.

Aqui estão as rotas disponíveis para cada recurso:

#### Produtos

| Verbo | Rota | O que retorna |
|--- |--- |--- |
| GET | /products | retorna todos os produtos cadastrados. |
| POST | /products | cria um novo produto. |
| GET | /products/:id | retorna o produto com o ID especificado. |
| PUT | /products/:id | atualiza os dados do produto com o ID especificado. |
| DELETE | /products/:id | exclui o produto com o ID especificado. |


Os dados do produto para o os verbos PUT e POST devem ser enviados no corpo da requisição no formato JSON, sendo obrigatorios no POST

body
```json
{
  "name": "Produto A",
  "stock": 10,
  "price": 10.99,
  "category_id": 1
}
```
#### Categoria

| Verbo | Rota | O que retorna |
|--- |--- |--- |
| GET | /categories | retorna todas as categorias de produtos cadastrados. |
| POST | /categories | cria uma nova categoria. |
| GET | /categories/:id | retorna a categoria com o ID especificado. |
| PUT | /categories/:id | atualiza os dados da categoria com o ID especificado. |
| DELETE | /categories/:id | exclui a categoria com o ID especificado. |

Os dados da categoria de produto para o os verbos PUT e POST devem ser enviados no corpo da requisição no formato JSON, sendo obrigatorios no POST

body
```json
{
  "description": "Descrição da categoria A"
}
```
#### Clientes
| Verbo | Rota | O que retorna |
|--- |--- |--- |
| GET | /clients | retorna todos os clientes de produtos cadastrados. |
| POST | /clients | cria um novo cliente. |
| GET | /clients/:id | retorna o cliente com o ID especificado. |
| PUT | /clients/:id | atualiza os dados do cliente com o ID especificado. |
| DELETE | /clients/:id | exclui o clientes com o ID especificado. |

Os dados do cliente para o os verbos PUT e POST devem ser enviados no corpo da requisição no formato JSON, sendo obrigatorios no POST 

body
```json
{
  "name": "Cliente A",
  "cpf": "12345678936"
  "email": "cliente_a@example.com"
  "phone": 9912737522
}
```

### Conclusão
Esta é uma API simples para gerenciar o cadastro de produtos, categorias de produtos e clientes. Tem uma aplicação web feita em Vue.js que utiliza dessa api, https://github.com/lucasdeandrade/api-coyo-mart
