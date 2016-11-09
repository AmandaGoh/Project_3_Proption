# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

end
10.times do |n|
     Property.create(
        prop_type: [:Condominium,:Landed]
        address: Faker::Address.street_address
        postal_code: Faker::Number.number(6)
        reserve_price: Faker::Number.number(7)
        tenure: [:Freehold,:999,:99].sample
        size: Faker::Number.number(4)
        description: Faker::Hipster.sentence(3, false, 4)
        picture: Faker::Internet.domain_name
      )
end

# create_table "properties", force: :cascade do |t|
#   t.string   "prop_type"
#   t.string   "address"
#   t.integer  "postal_code"
#   t.integer  "reserve_price"
#   t.string   "tenure"
#   t.integer  "size"
#   t.text     "description"
#   t.string   "picture"
#   t.integer  "seller_id"
#   t.datetime "created_at",    null: false
#   t.datetime "updated_at",    null: false
# end
