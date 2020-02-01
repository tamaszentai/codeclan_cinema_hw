require("pry")
require_relative("models/customer")
require_relative("models/film")
require_relative("models/ticket")

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


#######################CUSTOMERS######################
customer1 = Customer.new({
  'name' => 'Michael English',
  'funds' => 100
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Danny Igoe',
  'funds' => 20
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Andrew McConell',
  'funds' => 500
  })
customer3.save()

customer4 = Customer.new({
  'name' => 'Laura Alexander',
  'funds' => 200
  })
customer4.save()

#######################FILMS######################
film1 = Film.new({
  'title' => '1917',
  'price' => 10
  })
film1.save()

film2 = Film.new({
  'title' => 'Avatar',
  'price' => 8
  })
film2.save()

film3 = Film.new({
  'title' => 'Venom',
  'price' => 7
  })
film3.save()

film4 = Film.new({
  'title' => 'Crimson Peak',
  'price' => 12
  })
film4.save()

#######################TICKETS######################
ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film3.id})
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film1.id})
ticket3.save()
ticket4 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4.save()
ticket5 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film4.id})
ticket5.save()
ticket6 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film2.id})
ticket6.save()









binding.pry
nil
