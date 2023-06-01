# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Borrower.create(name: 'St.')
Invoice.create(number: 'asdfghj1234', amount: 123, due_date: "12/12/12", status: 'created', borrower_id: 1)