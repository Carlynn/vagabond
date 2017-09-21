# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
User.delete_all

  create_user = [{
    first_name: "Chanel",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    email: "csparks@unkown.com",
    password: "pizza",
  },
  {
    first_name: "Ashley",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    email: "asparks@unkown.com",
    password: "pizza",
  },
  {
    first_name: "Janet",
    last_name: "Sparks",
    city: "San Francisco",
    state: "CA",
    country: "USA",
    email: "jsparks@unkown.com",
    password: "pizza",
  }]
  User.create(create_user)

  create_post = [{
    title: "San Fran is fun",
    description: "They have the best bacon pizza"
  },{
    title: "San Fran is cool",
    description: "It is cold"
  },{
    title: "San Fran is expensive",
    description: "The bacon pizza is over priced"
  }]
  Post.create(create_post)
