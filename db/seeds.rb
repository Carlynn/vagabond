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

# creation of users
  user_1 = User.create({first_name: "Chanel",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    image: "http://www.thecartoonist.me/files/img/square-profile.jpg",
    email: "csparks@unkown.com",
    password: "pizza",
  })
  user_2 = User.create({
    first_name: "Ashley",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    image: "https://st2.depositphotos.com/1448232/8007/v/950/depositphotos_80074992-stock-illustration-blonde-profile-two.jpg",
    email: "asparks@unkown.com",
    password: "pizza",
  })
  user_3 = User.create({
    first_name: "Janet",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    image: "https://i.pinimg.com/236x/10/09/0e/10090ecda6b6729044f1541cb17cb741--pretty-drawings-girl-drawings.jpg",
    email: "jsparks@unkown.com",
    password: "pizza",
  })

# create locations
  location1 = Location.create({
    address: "Carrer de Mallorca",
    city: "Barcelona",
    state: "Catalonia",
    postal_code: "08013",
    country: "Spain",
    image: " ",
    background_image: " ",
    description: " ",
    })

  location2 = Location.create({
    address: "Westminster",
    city: "London",
    state: "UK",
    postal_code: "SW1A 0AA",
    country: "UK",
    image: " ",
    background_image: " ",
    description: " ",
    })

  location3 = Location.create({
    address: "154 Engelsa Prospekt",
    city: "St. Petersburg",
    state: " St. Petersburg ",
    postal_code: " 194358",
    country: "Russia",
    image: " ",
    background_image: " ",
    description: " ",
    })

  # Creation Posts
  posts = [
    {
      user_id: user_1,
      location_id: location1,
      title: "",
      description: "",
      image: ""
    },
  ]

Post.create(posts)
