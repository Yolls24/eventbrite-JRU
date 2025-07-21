# db/seeds.rb

# Suppression des données existantes pour éviter doublons à chaque seed
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Création des utilisateurs
user1 = User.create!(
  email: "test1@yopmail.com",
  encrypted_password: "fake_encrypted_password_1", # à remplacer par Devise demain
  first_name: "Test",
  last_name: "One",
  description: "Utilisateur test numéro 1"
)

user2 = User.create!(
  email: "test2@yopmail.com",
  encrypted_password: "fake_encrypted_password_2",
  first_name: "Test",
  last_name: "Two",
  description: "Utilisateur test numéro 2"
)

puts "Utilisateurs créés : #{User.count}"

# Création d’un événement administré par user1
event = Event.create!(
  title: "Soirée Ruby",
  description: "Apéro dev Ruby convivial à 18h ! Venez coder et échanger.",
  start_date: 2.days.from_now,
  duration: 120,
  price: 10,
  location: "Ma ville",
  admin: user1
)

puts "Événement créé : #{event.title}"

# Création d’une participation de user2 à l’événement
Attendance.create!(
  stripe_customer_id: "cus_123test",
  user: user2,
  event: event
)

puts "Participation créée pour #{user2.first_name} à l'événement #{event.title}"

