# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'mgiacomi@gltech.com', password: 'changeme', admin: true)

Level.create(id: 0, name: 'Getting Ready', description: "Let's get reading!" , minutes: 0)
Level.create(id: 1, name: 'Begining Reader', description: 'You gotta start somewhere.', minutes: 15)
Level.create(id: 2, name: 'Novice Reader', description: 'That first hour is behind you.', minutes: 30)
Level.create(id: 3, name: 'Short Story Rader', description: 'Enough to complete your first short story.', minutes: 60)
Level.create(id: 4, name: 'Intermediate Reader', description: 'You gotta start somewhere.', minutes: 90)
Level.create(id: 5, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 120)
Level.create(id: 6, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 150)
Level.create(id: 7, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 180)
Level.create(id: 8, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 240)
Level.create(id: 9, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 270)
Level.create(id: 10, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 330)
Level.create(id: 11, name: 'Black Belt Reader', description: 'You gotta start somewhere.', minutes: 390)
