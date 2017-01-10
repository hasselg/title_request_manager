# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! email: "test@example.com", password: 'password', password_confirmation: 'password', admin: true
User.create! email: "test2@example.com", password: 'password', password_confirmation: 'password', admin: false

Underwriter.create! name: "Fidelity National Title Insurance Company", abbreviation: "FN"
Underwriter.create! name: "Lawyer's Title Insurance Company", abbreviation: "LT"
Underwriter.create! name: "Ticor Title Insurance Company", abbreviation: "TT"
Underwriter.create! name: "Westcor Title Insurance Company", abbreviation: "W"
Underwriter.create! name: "Unknown", abbreviation: "Unknown"
Underwriter.create! name: "Not Applicable", abbreviation: "N/A"
