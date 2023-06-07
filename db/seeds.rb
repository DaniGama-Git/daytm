# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# DESTROYING ALL DATA
p "CLEANING THE DATABASE"

ItemTag.destroy_all
Tag.destroy_all
ItemCollection.destroy_all
ItemMember.destroy_all
Comment.destroy_all
Item.destroy_all
Collection.destroy_all
Member.destroy_all
User.destroy_all

# CREATING USER SEED - LILA, MOTHER OF THREE
p "CREATING USER SEED - LILA, MOTHER OF THREE"
user_1 = User.create(email: 'lila@legend.com', password: 'password', first_name: 'Lila', last_name: 'Legend')

# CREATING MEMBER'S SEED - LILA'S THREE KIDS, KIKI, LIS, LIAM
p"CREATING MEMBER'S SEED - LILA'S THREE KIDS, KIKI, LIS, LIAM"

Member.create(first_name: 'Kiki', last_name: 'Legend', user: user_1)
Member.create(first_name: 'Lis', last_name: 'Legend', user: user_1)
Member.create(first_name: 'Liam', last_name: 'Legend', user: user_1)


# CREATING COLLECTIONS SEED
p "CREATING COLLECTIONS SEED"

collection_1 = Collection.create(label: 'Medical', description: 'This collection is for all the medical records of the family')
user_1.collections << collection_1
user_1.save


collection_2 = Collection.create(label: "Kid's artworks", description: "A collection of Kiki, Liam and Lis's school art")
user_1.collections << collection_2
user_1.save

collection_3 = Collection.create(label: "Home finances", description: "All finances for the home, including insurance, our bond etc")

user_1.collections << collection_3
user_1.save

collection_4 = Collection.create(label: "Kid's academics", description: "All reports and results received for the kids schooling")

user_1.collections << collection_4
user_1.save

collection_5 = Collection.create(label: "Family trip to Cape Town", description: "For Ben's parents anniversary - includes pictures as well as all videos")

user_1.collections << collection_5
user_1.save

collection_6 = Collection.create(label: "Family's SA ID Doc's", description: "Home affairs etc")

user_1.collections << collection_6
user_1.save

collection_7 = Collection.create(label: "Travel documents", description: "All documents needed for our trip to America")

user_1.collections << collection_7
user_1.save

collection_8 = Collection.create(label: "Mom's knee opp", description: "Documents ready for Mom's knee op September")

user_1.collections << collection_8
user_1.save

collection_9 = Collection.create(label: "Lis's Gymnastic's info", description: "Information ready for world tour")

user_1.collections << collection_9
user_1.save

collection_10 = Collection.create(label: "Liam's surfing comp", description: "Including photos and his stats")

user_1.collections << collection_10
user_1.save


# CREATING ITEMS & TAGS SEED COLLECTION 1
p "CREATING ITEMS & TAGS SEED COLLECTION 1"

item_1_1 = Item.create(title: "Kiki's Leg X-Ray", description: "The X-Rays received from the doctor when Kiki broke her leg", format: "JPEG", date: Date.parse("2022/05/03"), user_id: user_1)
item_1_2 = Item.create(title: "Lila's Hospital Visit", description: "Details of Lila's hospital visit", format: "PDF", date: Date.parse("2023-06-07"), user_id: user_1.id)

collection_1.items << item_1_1
collection_1.items << item_1_2
collection_1.save

tag_1 = Tag.create(name: "X-Ray", user: user_1)
tag_2 = Tag.create(name: "doctor", user: user_1)
tag_3 = Tag.create(name: "medical", user: user_1)
tag_4 = Tag.create(name: "leg", user: user_1)

item_1_1.tags << [tag_1, tag_3, tag_4]
item_1_1.save
item_1_2.tags << [tag_2, tag_3]
item_1_2.save


# CREATING ITEMS & TAGS SEED COLLECTION 2
p "CREATING ITEMS & TAGSNEED COLLECTION 2"

item_2_1 = Item.create(title: "Liam's drawing of a bug", description: "Liam's drawing done with granny on school holidays", format: "JPEG", date: Date.parse("2021/06/02"), user: user_1)
item_2_2 = Item.create(title: "Lis's pottery", description: "Lis's pottery done at clay cafe for her cousin's birthday", format: "JPEG", date: Date.parse("2023/08/14"), user: user_1)

collection_2.items << item_2_1
collection_2.items << item_2_2
collection_2.save

tag_5 = Tag.create(name: "art", user: user_1)
tag_6 = Tag.create(name: "pictures", user: user_1)
tag_7 = Tag.create(name: "potery", user: user_1)
tag_8 = Tag.create(name: "drawing", user: user_1)

item_2_1.tags << [tag_5, tag_6, tag_8]
item_2_1.save
item_2_2.tags << [tag_5, tag_7]
item_2_2.save

p "FINISHED SEEDING THE DATABASE"
