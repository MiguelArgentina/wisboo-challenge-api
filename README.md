![](https://img.shields.io/badge/tucu-software-red)

## Project: Coding challenge for Wisboo

## Features

- The challenge consists in creating an API with an endpoint that returns a list of products. The endpoint accepts this arguments: page, size, query and currency. All these are for visualizing and filtering products according to the user's needs.
- The json object returned must meet a specific format asked by the challenge. A Presenter is used to format the data. 


## Built With

- Ruby 3.0.3
- Rails 7.0.4


## Prerequisites
- Ruby 3.0.3
- Rails 7.0.4
- Postgres: >=13


## Getting Started

- Open your terminal - Windows: `Win + R`, then type `cmd` | Mac: `Command + space`, then type `Terminal`
- Navigate to a directory of your choosing using the `cd` command
- Run this command in your OS terminal: `git clone git@github.com:MiguelArgentina/wisboo-challenge-api.git` to get a copy of the project.
- Navigate to the project's directory using the `cd` command
- Install gems with: `bundle install`
- Setup database with:

```
   rails db:create
   rails db:migrate
   rails db:seed
```

### Usage

* Start server with `rails server` and make sure you get this page when you visit `http://localhost:3000` in your browser:
![rails server.png](rails%20server.png)


* Make a POST request to http://localhost:3000/api/v1/products/index with the following params:

```
    page: the number of page to show
    size: the number of products to show per page
    query: test used to filter products by name
    currency: the currency to filter products (USD EUR GBP)
```

* If you don't have a software to perform requests (like Postman) you can use this cURL command. You can change the params to see the different results. This command is run in a different terminal than where the server is running:

```
curl -d "product[page]=1" -d "product[size]=10" -d "product[query]=test" -d "product[currency]=USD" http://localhost:3000/api/v1/products/index
```

### Run tests

- Run `rails test -vc` from the command line to run all tests. The optional parameters will provide detailed information for each one


## Author


### Miguel Gomez

<img width="100" alt="Miguel Gomez Profile Picture" src="https://avatars.githubusercontent.com/u/50305489?s=400&u=2d451ca03611a85431ac4e851ab7a4fc3425bb7d&v=4">


* GitHub: [@MiguelArgentina](https://github.com/MiguelArgentina)
* twitter - https://twitter.com/Qete_arg

### Acknowledgments

- The challenge was proposed by Wisboo

### 🤝 Contributing

- Contributions, issues, and feature requests are welcome!

- Feel free to check the [issues page](https://github.com/MiguelArgentina/wisboo-challenge-api/issues).

### Show your support

Give a ⭐️ if you like this project!
