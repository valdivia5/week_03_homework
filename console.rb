require_relative('models/customer')
require_relative('models/films')
require_relative('models/ticket')

require('pry-byebug')


Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

film1 = Film.new({
    'title' => 'Chinatown',
    'price' => 15
  })
film1.save()


film2 = Film.new({
    'title' => 'Raging Bull',
    'price' => 15
  })
film2.save()


film3 = Film.new({
    'title' => 'Taxi Driver',
    'price' => 15
  })
film3.save()
#---------------------CUSTOMER-------------------------
customer1 = Customer.new ({
    'name'  => 'Chucho El Chulo',
    'funds' => 20
  })
customer1.save()

customer2 = Customer.new ({
    'name'  => 'Chacho Chachenez',
    'funds' => 40
  })
customer2.save()

customer3 = Customer.new ({
    'name'  => 'Chechu Jimenez',
    'funds' => 30
  })
customer3.save()
  #----------------------TICKET------------------------

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
ticket6 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()
ticket6.save()


binding.pry
 nil
