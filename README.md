# Edutecnia
### Installation based on Mac OS X Monterey

* Ruby version
```
In Mac
- Instalar Ruby Version Manager


- Instalar Version 3.2.0
rvm install 3.2.0`

- Crear version para proyecto
rvm use 3.2.0@talento-docente --create

In Windows
- Instalar MSYS2 and MINGW
https://www.msys2.org/
https://www.mingw-w64.org

- Instalar URU
https://rubyinstaller.org/add-ons/uru.html

- Descargar y asociar a Uru Ruby 3.2.0
https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.2.0-1/rubyinstaller-3.2.0-1-x64.7z
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

* Run Project in Development Mode
```
rails s
```

