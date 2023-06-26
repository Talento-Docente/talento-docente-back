# Edutecnia
### Installation based on Mac OS X Monterey

* Ruby version
```
- Instalar Version 3.2.0
rvm install 3.2.0`

- Crear version de Edutecnia
rvm use 3.2.0@talento-docente --create
```    

* Requirements
````
- Postgresql 14.2
mac: brew install postgresql@14
````

* Database creation
```
rails db:create
```

* Database initialization
```
rails db:migrate
rails db:seed
```

