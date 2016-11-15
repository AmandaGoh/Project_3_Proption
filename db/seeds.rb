# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
#
# 10.times do |n|
#      Property.create! (
#         :name => Faker::Address.street_name
#         :prop_type => [:Condominium,:Landed]
#         :address => Faker::Address.street_address
#         :postal_code => Faker::Number.number(6)
#         :reserve_price => Faker::Number.number(7)
#         :tenure => [:Freehold,:999,:99].sample
#         :size => Faker::Number.number(4)
#         :description => Faker::Hipster.sentence(3, false, 4)
#         :picture => Faker::Internet.domain_name
#         :seller_id => Faker::Number.number(1)
#       )
# end

# seed users
User.create! name: 'user1', username: 'username1', contact_number: 91234567, email: 'user1@email.com', password: 'password1', password_confirmation: 'password1'

User.create! name: 'user2', username: 'username2', contact_number: 92345678, email: 'user2@email.com', password: 'password2', password_confirmation: 'password2'

User.create! name: 'user3', username: 'username3', contact_number: 93456789, email: 'user3@email.com', password: 'password3', password_confirmation: 'password3'

User.create! name: 'user4', username: 'username4', contact_number: 94567890, email: 'user4@email.com', password: 'password4', password_confirmation: 'password4'

User.create! name: 'user5', username: 'username5', contact_number: 95678901, email: 'user5@email.com', password: 'password5', password_confirmation: 'password5'

User.create! name: 'user6', username: 'username6', contact_number: 96789012, email: 'user6@email.com', password: 'password6', password_confirmation: 'password6'

User.create! name: 'user7', username: 'username7', contact_number: 97890123, email: 'user7@email.com', password: 'password7', password_confirmation: 'password7'

User.create! name: 'user8', username: 'username8', contact_number: 98901234, email: 'user8@email.com', password: 'password8', password_confirmation: 'password8'

User.create! name: 'user9', username: 'username9', contact_number: 99012345, email: 'user9@email.com', password: 'password9', password_confirmation: 'password9'

# seed properties
Property.create! name: "Espada", prop_type: 'Condominium', address: '48 Saint Thomas Walk', postal_code: 238126, reserve_price: "1150000", tenure: "Freehold", size: 400, description: "Fully furnished", picture: "", seller_id: 1, listed: 1

Property.create! name: "Park Residences", prop_type: 'Condominium', address: '831 Upper Serangoon Rd', postal_code: 534679, reserve_price: "578000", tenure: "999", size: 800, description: "Available immediately, fully furnished!", picture: "", seller_id: 1, listed: 0

Property.create! name: "Meyerise", prop_type: 'Condominium', address: '93 Meyer Rd', postal_code: 916000, reserve_price: "680000", tenure: "Freehold", size: 750, description: "Quick sale!", picture: "", seller_id: 2, listed: 1

Property.create! name: "Jalan Eunos", prop_type: 'Condominium', address: '31 Jalan Eunos', postal_code: 450890, reserve_price: "3500000", tenure: "Freehold", size: 2819, description: "Rare property!", picture: "", seller_id: 4, listed: 1

Property.create! name: "Farrer Park Terrace House", prop_type: 'Landed', address: '1 Sturdee Rd', postal_code: 289789, reserve_price: "7200000", tenure: "Freehold", size: 1765, description: "Charming freehold Colonial-designed 2.5 torey house", picture: "", seller_id: 4, listed: 1

Property.create! name: "Detached House", prop_type: 'Landed', address: '2 Garlick Avenue', postal_code: 160987, reserve_price: "14880000", tenure: "Freehold", size: 2404, description: "Detached house for sale", picture: "", seller_id: 6, listed: 0

# seed listings
Listing.create! property_id:1
Listing.create! property_id:3
Listing.create! property_id:4
Listing.create! property_id:5

# seed listings
Bid.create! bid_amount:100, bidder_id:3, listing_id:1
Bid.create! bid_amount:1002, bidder_id:5, listing_id:2
Bid.create! bid_amount:100004, bidder_id:6, listing_id:3
Bid.create! bid_amount:1000000, bidder_id:6, listing_id:4
Bid.create! bid_amount:1000001, bidder_id:8, listing_id:3
Bid.create! bid_amount:1000002, bidder_id:9, listing_id:4

Bid.create! bid_amount:999999, bidder_id:6, listing_id:3
Bid.create! bid_amount:8888888, bidder_id:6, listing_id:4
