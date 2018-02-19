# Github Con 

This project connects with github api(v3) and find the 5 top trending repositories given 5 languages.

### Prerequisites

Ruby 2.5.0
Rails 5.1.4
PostgreSQL

## Getting Started

Clone project
```
git clone git@github.com:Tarcisiosk/github_con.git
```

Run bundle

```
bundle install
```

Create database

```
rake db:create
```

Run migrations

```
rake db:migrate
```

Run server

```
rails s
```

You should be able to see the app running at `localhost:3000`

### Running the tests

The tests secure the app main functionalities and the github api data handling.

To run the tests use the command bellow:

```
rspec spec
```

You may need to:

```
rake db:test:prepare
```

### WEBAPP

https://secret-chamber-93348.herokuapp.com/
