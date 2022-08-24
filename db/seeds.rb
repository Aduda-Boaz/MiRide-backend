# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all
# Mentor.destroy_all
# Reservation.destroy_all

users = User.create!([
    {full_name: "Alasca Desmond", username: 'alascadesmond', email_address: 'alascadesmond@gmail.com'},
    {full_name: "Noel Apia", username: 'noelapia', email_address: 'noelapia@gmail.com'},
    {full_name: "John Server", username: 'johnserver', email_address: 'johnsaver@gmail.com'}
])

mentors = Mentor.create!([
    {full_name: "John Great", bio: 'Hi, reserve me, I will be excited to share my knowledge with you and be willing to explore the possibility that you may have answers to your challenges.', specialisation: 'Data Analyst', image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png", user_id: User.first.id},
    {full_name: "Philips Desmond", bio: 'Hi, reserve me, I will be excited to share my knowledge with you and be willing to explore the possibility that you may have answers to your challenges.', specialisation: 'Software Engineer', image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png", user_id: User.last.id},
    {full_name: "Peter Doe", bio: 'Hi, reserve me, I will be excited to share my knowledge with you and be willing to explore the possibility that you may have answers to your challenges.', specialisation: 'UI/UX Designer', image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png", user_id: User.first.id}
    ])

reservations = Reservation.create!([
    {user_id: User.last.id, mentor_id: Mentor.first.id, duration: '2 Months'},
    {user_id: User.first.id, mentor_id: Mentor.last.id, duration: '3 Months'},
    {user_id: User.first.id, mentor_id: Mentor.first.id, duration: '1 Months'}
])