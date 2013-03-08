# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = Location.create([
  { 
    name: 'The mill race'
  }
])

terminals = Terminal.create([
  { 
    name: 'Bar 1'
  }
])

categories = Category.create([
  { 
    name: 'Draught'
  },
  { 
    name: 'Bottled Beer',
  }
])

products = Product.create([
  { 
    name: 'Guiness',
    code: 'guiness',
    price: 3.10,
    category_id: 1,
  },
  { 
    name: 'Budweiser',
    code: 'budweiser',
    price: 2.50,
    category_id: 2
  }
])

orders = Order.create([
  { 
    product_id: 1,
    location_id: 1,
    terminal_id: 1,
    quantity: 5,
    date: '2013-03-08'
  },
  { 
    product_id: 2,
    location_id: 1,
    terminal_id: 1,
    quantity: 5,
    date: '2013-03-08'
  }
])
