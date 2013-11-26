Role.create(name: 'admin')
Role.create(name: 'basic')

User.destroy_all
u = User.create(email: "foo@bar.com", password: 'asd12345', password_confirmation: 'asd12345')
u.roles << Role.find_by_name('basic')
admin = User.create(email: 'admin@example.com', password: 'asd12345', password_confirmation: 'asd12345')
admin.roles << Role.find_by_name('admin')

Product.destroy_all
Product.create(name: 'OC', price: 100)
Product.create(name: 'AC', price: 200)
Product.create(name: 'NNW', price: 50)
Product.create(name: 'Mienie', price: 400)
Product.create(name: 'Dom', price: 500)

