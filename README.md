# Trabajo Final Integrador TTPS - Ruby

Proyecto en desarrolo para una entidad bancaria, destinado a modernizar la forma en que gestiona los turnos para atención presencial en sus sucursales.
El banco quiere poder ofrecer un sistema de turnos online, para que cualquier persona pueda solicitar un turno para ser atendido en una sucursal sin necesidad de acercarse a ésta y tener que esperar a ser atendida.

## Ruby version
ruby-3.0.0

# Requirements
* Ruby (~> 2.7)
* La versión estable más reciente del framework Ruby on Rails (7.0.4 en este momento)
* Base de datos SQL 

(Other gem dependencies will be installed automatically by Bundler.)

# Installation Steps
1. Clone repo: git clone https://github.com/DoloPondarre/TTPS-Ruby.git
2. Change into directory: cd TTPS-Ruby
3. Install gems: bundle install
4. Create database: rake db:create
5. Create tables: rake db:migrate
6. Seed database: rake db:seed
7. Start the server: rails s
8. Visit http://localhost:3000/ and log in with any of the users defined in the seeds file.

# Design Decisions

* Asumo que los usuarios que serán registrados con el rol 'Staff' tienen un mail de trabajo para este fin, y utilizan su mail personal para registrarse como usuario con rol 'Client'.

* Al cancelar un turno se realiza un borrado físico del mismo ya que veo innecesario seguir almacenando los datos del turno cancelado, el haber cancelado algún turno no condiciona para realizar otras acciones.

* Al crear una sucursal no se le asignan horarios, estos son asignados luego en el momento en el que se crean. Esto se debe a que una sucursal es creada antes de su apertura, por lo que no tendría sentido que tenga horarios asignados hasta ese momento.

* Cuando un usuario es dado de baja se eliminan todos los turnos, tanto pendientes como atendidos, de dicho usuario.

* Un usuario con rol 'Staff' no puede ser eliminado si han atendido algún turno, ya que tiene una asociación con dicho turno.

* Una sucursales no puede ser eliminada si se ha asignado algún turno a ella, ya que tiene una asociación con dicho turno.

# Creator
* María Dolores Pondarré
