# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

la = Gym.create(name: "L.A. Fitness", address: "Suite 981 1795 Leida Fords, Nataliemouth, TN 14377-4979")
planet = Gym.create(name: "Planet Fitness", address: "7768 David Avenue, Greenside, PA 67475-3655")

cassie = Client.create(name: "Casie Effertz", age: 18)
dorris = Client.create(name: "Dorris Bogan", age: 52)
bernie = Client.create(name: "Bernie Schiller", age: 44)
manie = Client.create(name: "Manie Dare", age: 29)

Membership.create(gym_id: la.id, client_id: cassie.id, charge: 40)
Membership.create(gym_id: la.id, client_id: dorris.id, charge: 40)
Membership.create(gym_id: la.id, client_id: bernie.id, charge: 40)
Membership.create(gym_id: planet.id, client_id: cassie.id, charge: 50)
Membership.create(gym_id: planet.id, client_id: manie.id, charge: 60)