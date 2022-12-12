# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

r1 = Role.create({ name: 'Admin'})
r2 = Role.create({ name: 'Staff'})
r3 = Role.create({ name: 'Client'})

b1 = Branch.create({ name: 'Sucursal 1', direction: 'Calle 1 123', telephone: '2211231234'})
b2 = Branch.create({ name: 'Sucursal 2', direction: 'Calle 2 123', telephone: '2211231234'})

sc = Schedule.create({ day: 'Monday', hourI: '8:00', hourF: '15:00', branch_id: b2.id })

u1 = User.create({ email: 'admin@example.com', password: 'admin123', password_confirmation: 'admin123', name: 'Juan Gonzales', role_id: r1.id })
u2 = User.create({ email: 'staff1@example.com', password: 'staff123', password_confirmation: 'staff123', name: 'Pepe Gomez', branch_id: b1.id, role_id: r2.id })
u3 = User.create({ email: 'staff2@example.com', password: 'staff123', password_confirmation: 'staff123', name: 'Juana Rodriguez', branch_id: b2.id, role_id: r2.id })
u4 = User.create({ email: 'user1@example.com', password: 'user123', password_confirmation: 'user123', name: 'Camila Perez', role_id: r3.id })
u5 = User.create({ email: 'user2@example.com', password: 'user123', password_confirmation: 'user123', name: 'Lucas Lopez', role_id: r3.id })

s1 = Shift.create({ date: '2022/12/22', time: '14:45', reason: 'Apertura de cuenta', state: 'Pendiente', branch_id: b1.id, client_id: u4.id})
s2 = Shift.create({ date: '2022/12/22', time: '14:45', reason: 'Consulta', state: 'Pendiente', branch_id: b2.id, client_id: u5.id})
