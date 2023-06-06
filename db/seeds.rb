# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Member.destroy_all
Collection.destroy_all

# CREATING USER SEED - LILA, MOTHER OF THREE
user_1 = User.create(email: 'lila@legend.com', password: 'password', first_name: 'Lila', last_name: 'Legend')

# CREATING MEMBER'S SEED - LILA'S THREE KIDS, KIKI, LIS, LIAM
member_1 = Member.create(first_name: 'Kiki', last_name: 'Legend')
member_2 = Member.create(first_name: 'Lis', last_name: 'Legend')
member_3 = Member.create(first_name: 'Liam', last_name: 'Legend')


# CREATING COLLECTIONS SEED
collection_1 = Collection.create(label: 'Medical', description: 'This collection is for all the medical records of the family', collection_type: 'Medical')

user_1.collections << collection_1
user_1.save

collection_2 = Collection.create(label: "Kid's artworks", description: "A collection of Kiki, Liam and Lis's school art", collection_type: 'Other')

user_1.collections << collection_2
user_1.save



# create_table "collections", force: :cascade do |t|
#   t.string "label"
#   t.string "description"
#   t.string "type"
#   t.bigint "user_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_collections_on_user_id"
# end
