# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'wmccollister@pps.net', password: password)
Teacher.create(first: 'Wakana', last: 'McCollister', grade: 'K', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'jiverson@pps.net', password: password)
Teacher.create(first: 'Jill', last: 'Iverson', grade: 'K', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'marsh@pps.net', password: password)
Teacher.create(first: 'Kelly', last: 'Marsh', grade: 'K', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'ryoshida@pps.net', password: password)
Teacher.create(first: 'Reiko', last: 'Yoshida', grade: 'K', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'suchida@pps.net', password: password)
Teacher.create(first: 'Sumiko', last: 'Uchida', grade: '1', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'apineo@pps.net', password: password)
Teacher.create(first: 'Angie', last: 'Pineo', grade: '1', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'trivera@pps.net', password: password)
Teacher.create(first: 'Toshiko', last: 'Rivera', grade: '1', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'sgaynor@pps.net', password: password)
Teacher.create(first: 'Sarah', last: 'Gaynor', grade: '1', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'emogi@pps.net', password: password)
Teacher.create(first: 'Eriko', last: 'Mogi', grade: '2', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'mtaya@pps.net', password: password)
Teacher.create(first: 'Minori', last: 'Taya', grade: '2', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'ascheima@pps.net', password: password)
Teacher.create(first: 'Anne', last: 'Scheiman', grade: '2', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'akaprano@pps.net', password: password)
Teacher.create(first: 'Anna', last: 'Kapranos', grade: '2', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'mparshal@pps.net', password: password)
Teacher.create(first: 'Michiko', last: 'Hirahara', grade: '3', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'mwenger@pps.net', password: password)
Teacher.create(first: 'Melissa', last: 'Wenger', grade: '3', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'rfujiwar@pps.net', password: password)
Teacher.create(first: 'Ritsuko', last: 'Fujiwara', grade: '3', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'mgross@pps.net', password: password)
Teacher.create(first: 'Martha', last: 'Gross', grade: '3', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'okawasaki@pps.net', password: password)
Teacher.create(first: 'Gori', last: 'Kawasaki', grade: '4', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'emartin@pps.net', password: password)
Teacher.create(first: 'Beth', last: 'Martin', grade: '4', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'kbiornst@pps.net', password: password)
Teacher.create(first: 'Kaoru', last: 'Biornstad', grade: '4', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'jainak@pps.net', password: password)
Teacher.create(first: 'Jaina', last: 'Kapranos', grade: '4', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'ando@pps.net', password: password)
Teacher.create(first: 'Atsuko', last: 'Ando', grade: '5', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'baubrech@pps.net', password: password)
Teacher.create(first: 'Bill', last: 'Aubrecht', grade: '5', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'mfarrell@pps.net', password: password)
Teacher.create(first: 'Miki', last: 'Farrell', grade: '5', user_id: user.id)
puts "#{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'jlovela1@pps.net', password: password)
Teacher.create(first: 'Jen', last: 'Loveland', grade: '5', user_id: user.id)
puts "#{user.email} #{password}"

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

Avatar.create(id: 0, level_id: 0, category: 'leaf')
Avatar.create(id: 1, level_id: 1, category: 'dragon')
Avatar.create(id: 2, level_id: 1, category: 'princess')
Avatar.create(id: 3, level_id: 1, category: 'animal')
Avatar.create(id: 4, level_id: 1, category: 'sport')
Avatar.create(id: 5, level_id: 2, category: 'dragon')
Avatar.create(id: 6, level_id: 2, category: 'princess')
Avatar.create(id: 7, level_id: 2, category: 'animal')
Avatar.create(id: 8, level_id: 2, category: 'sport')
Avatar.create(id: 9, level_id: 3, category: 'dragon')
Avatar.create(id: 10, level_id: 3, category: 'princess')
Avatar.create(id: 11, level_id: 3, category: 'animal')
Avatar.create(id: 12, level_id: 3, category: 'sport')
Avatar.create(id: 13, level_id: 4, category: 'dragon')
Avatar.create(id: 14, level_id: 4, category: 'princess')
Avatar.create(id: 15, level_id: 4, category: 'animal')
Avatar.create(id: 16, level_id: 4, category: 'sport')
Avatar.create(id: 17, level_id: 5, category: 'dragon')
Avatar.create(id: 18, level_id: 5, category: 'princess')
Avatar.create(id: 19, level_id: 5, category: 'animal')
Avatar.create(id: 20, level_id: 5, category: 'sport')
Avatar.create(id: 21, level_id: 6, category: 'dragon')
Avatar.create(id: 22, level_id: 6, category: 'princess')
Avatar.create(id: 23, level_id: 6, category: 'animal')
Avatar.create(id: 24, level_id: 6, category: 'sport')
Avatar.create(id: 25, level_id: 7, category: 'dragon')
Avatar.create(id: 26, level_id: 7, category: 'princess')
Avatar.create(id: 27, level_id: 7, category: 'animal')
Avatar.create(id: 28, level_id: 7, category: 'sport')
Avatar.create(id: 29, level_id: 8, category: 'dragon')
Avatar.create(id: 30, level_id: 8, category: 'princess')
Avatar.create(id: 31, level_id: 8, category: 'animal')
Avatar.create(id: 32, level_id: 8, category: 'sport')
Avatar.create(id: 33, level_id: 9, category: 'dragon')
Avatar.create(id: 34, level_id: 9, category: 'princess')
Avatar.create(id: 35, level_id: 9, category: 'animal')
Avatar.create(id: 36, level_id: 9, category: 'sport')

Challange.create(id: 0, description: 'Read to your pet.')
Challange.create(id: 1, description: 'Read outside.')
Challange.create(id: 2, description: 'Read to your brother or sister.')
Challange.create(id: 3, description: 'Read under the covers with a flashlight.')
Challange.create(id: 4, description: 'Read a news paper.')
Challange.create(id: 5, description: 'Read a poem.')
Challange.create(id: 6, description: 'Read in Japanese.')
Challange.create(id: 7, description: 'Read a book about a dead president.')
Challange.create(id: 8, description: 'Read a poem.')
Challange.create(id: 9, description: 'Read in Japanese.')
Challange.create(id: 10, description: 'Read a book about a dead president.')
Challange.create(id: 11, description: 'Read some of your parents books.')
Challange.create(id: 12, description: 'Read a book at the dinner table')
Challange.create(id: 13, description: 'Read 15 minutes more than you intended.')
Challange.create(id: 14, description: 'Read the ingredents of food in your fridge.')
Challange.create(id: 15, description: 'Read a privacy policy.')
