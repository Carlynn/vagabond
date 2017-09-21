# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
User.delete_all
Location.delete_all

  create_user = [{
    first_name: "Chanel",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    image: "http://www.thecartoonist.me/files/img/square-profile.jpg",
    email: "csparks@unkown.com",
    password: "pizza",
  },
  {
    first_name: "Ashley",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    image: "https://st2.depositphotos.com/1448232/8007/v/950/depositphotos_80074992-stock-illustration-blonde-profile-two.jpg",
    email: "asparks@unkown.com",
    password: "pizza",
  },
  {
    first_name: "Janet",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    image: "https://i.pinimg.com/236x/10/09/0e/10090ecda6b6729044f1541cb17cb741--pretty-drawings-girl-drawings.jpg",
    email: "jsparks@unkown.com",
    password: "pizza",
  }]
  User.create(create_user)

  create_location = [{
    address: "225 Bush Street",
    city: "San Francisco",
    state: "CA",
    postal_code: "94102",
    country: "USA"
  },
  {
    address: "Westminster",
    city: "London",
    state: "UK",
    postal_code: "SW1A 0AA",
    country: "UK"
  },
  {
    address: "5 Moorish Castle Estate",
    city: "Gibraltar",
    state: "Gibraltar",
    postal_code: " GX11 1AA",
    country: "Spain"
    }
  ]
  Location.create(create_location)

  # create_post = [{
  #   title: "San Fran is fun",
  #   description: "They have the best bacon pizza"
  # },{
  #   title: "San Fran is cool",
  #   description: "It is cold"
  # },{
  #   title: "San Fran is expensive",
  #   description: "The bacon pizza is over priced"
  # }]
  # Post.create(create_post)




# Push the post into the first user
# User.first.posts<<Post.first

# Push the post into the location to sure both parts are filled in
# Location.first.posts <<Post.first

# Ability to get the location for a user but not sure if its applicable
# User.first.locations<<Location.first
