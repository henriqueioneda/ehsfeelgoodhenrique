# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
    id: 1, 
    bank_account: "1234-5", 
    bank_agency: "1234-5",
    email: "ehsfeelgood@ehsfeelgood.com",
    password: "123123123"
)
