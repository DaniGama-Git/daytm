# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
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
UserSuggestion.destroy_all
Suggestion.destroy_all
User.destroy_all

# CREATING USER SEED - LILA, MOTHER OF THREE
p "CREATING USER SEED - LILA, MOTHER OF THREE"
user_1 = User.create(email: 'lila@legend.com', password: 'password', first_name: 'Lila', last_name: 'Legend')

# CREATING MEMBER'S SEED - LILA'S THREE KIDS, KIKI, LIS, LIAM
p "CREATING MEMBER'S SEED - LILA'S THREE KIDS, KIKI, LIS, LIAM"

member_1 = Member.create(first_name: 'Kiki', last_name: 'Legend', user: user_1)
member_2 = Member.create(first_name: 'Lis', last_name: 'Legend', user: user_1)
member_3 = Member.create(first_name: 'Liam', last_name: 'Legend', user: user_1)
member_4 = Member.create(first_name: 'Lila', last_name: 'Legend', user: user_1)

avatar_1 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686672432/Screenshot_2023-06-13_at_18.05.58_m97mx4.png")
member_1.photos.attach(io: avatar_1, filename: "avatar_1.jpg", content_type: "image/jpg")

avatar_2 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686670592/IMG_8639_ugdpkk.jpg")
member_2.photos.attach(io: avatar_2, filename: "avatar_2.jpg", content_type: "image/jpg")

avatar_3 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686672432/Screenshot_2023-06-13_at_18.05.58_m97mx4.png")
member_3.photos.attach(io: avatar_3, filename: "avatar_3.jpg", content_type: "image/jpg")

avatar_4 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686672432/Screenshot_2023-06-13_at_18.05.58_m97mx4.png")
member_4.photos.attach(io: avatar_4, filename: "avatar_4.jpg", content_type: "image/jpg")

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

collection_11 = Collection.create(label: "Dad's family photos", description: "All the photos Dad has gotten from his extended family")

user_1.collections << collection_11
user_1.save

collection_12 = Collection.create(label: "Resume's & CV info", description: "Records of all information for job seeking")

user_1.collections << collection_12
user_1.save

collection_13 = Collection.create(label: "Pet's", description: "All records relating to the pet's health as well as photos of our pets thorughout the years")

user_1.collections << collection_13
user_1.save

collection_14 = Collection.create(label: "Home", description: "All records relating to 31 Jolene Street")

user_1.collections << collection_14
user_1.save

collection_15 = Collection.create(label: "Tax's", description: "Information ready for 2024 tax season")

user_1.collections << collection_15
user_1.save

# CREATING ITEMS & TAGS SEED COLLECTION 1:
p "CREATING ITEMS & TAGS SEED COLLECTION 1"

item_1_1 = Item.create(title: "Kiki's Leg X-Ray", description: "The X-Rays received from the doctor when Kiki broke her leg", format: "JPEG", date: Date.parse("2022/05/03"), user: user_1)
item_1_2 = Item.create(title: "Lila's Hospital Visit", description: "Details of Lila's hospital visit", format: "PDF", date: Date.parse("2023-06-07"), user: user_1)
item_1_3 = Item.create(title: "Liam's dentist appointment", description: "Visit to the dentist 2023", format: "PDF", date: Date.parse("2023-02-02"), user: user_1)
item_1_4 = Item.create(title: "Lis's dentist appointment", description: "Visit to the dentist 2023", format: "PDF", date: Date.parse("2023-02-02"), user: user_1)
item_1_5 = Item.create(title: "Kiki's annual checkup", description: "The family did checkups with Dr Joe at the City of Cape Town hospital", format: "JPEG", date: Date.parse("2022/05/03"), user: user_1)
item_1_6 = Item.create(title: "Lis's annual checkup", description: "The family did checkups with Dr Joe at the City of Cape Town hospital", format: "JPEG", date: Date.parse("2023-06-07"), user: user_1)
item_1_7 = Item.create(title: "Lila's annual checkup", description: "The family did checkups with Dr Joe at the City of Cape Town hospital", format: "JPEG", date: Date.parse("2023-02-02"), user: user_1)
item_1_8 = Item.create(title: "Lila's annual checkup", description: "The family did checkups with Dr Joe at the City of Cape Town hospital", format: "JPEG", date: Date.parse("2023-02-02"), user: user_1)


collection_1.items << item_1_1
collection_1.items << item_1_2
collection_1.items << item_1_3
collection_1.items << item_1_4
collection_1.items << item_1_5
collection_1.items << item_1_6
collection_1.items << item_1_7
collection_1.items << item_1_8
collection_1.save

member_1.items << item_1_1
member_1.items << item_1_5
member_1.save

member_4.items << item_1_2
member_4.items << item_1_7
member_4.save

member_3.items << item_1_3
member_3.items << item_1_8
member_3.save

member_2.items << item_1_4
member_2.items << item_1_6
member_2.save

# CREATING TAGS FOR ITEMS 1.1 & 1.2:
tag_1 = Tag.create(name: "X-Ray", user: user_1)
tag_2 = Tag.create(name: "doctor", user: user_1)
tag_3 = Tag.create(name: "medical", user: user_1)
tag_4 = Tag.create(name: "leg", user: user_1)

# ATTACHING TAGS TO ITEMS 1.1 & 1.2

item_1_1.tags << [tag_1, tag_3, tag_4]
item_1_1.save
item_1_2.tags << [tag_2, tag_3]
item_1_2.save

# ATTACHING IMAGES/PDF'S TO ITEMS 1.1 , 1.2 , 1.3 , 1,4
file_1_1 = URI.open("https://www.cedars-sinai.org/content/dam/cedars-sinai/programs-and-services/imaging-center/for-patients/exams-by-procedure/lower-extremity-xray-2.jpg")
item_1_1.photos.attach(io: file_1_1, filename: "image_1_1.jpg", content_type: "image/jpg")
item_1_1.save

file_1_2 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686153397/Lila_Hospital_Visit_eiyh7j.pdf")
item_1_2.photos.attach(io: file_1_2, filename: "img.pdf", content_type: "application/pdf")
item_1_2.save

file_1_3 = URI.open("https://images.sampleforms.com/wp-content/uploads/2019/01/Dental-Examination-Form-Sample.jpg")
item_1_3.photos.attach(io: file_1_3, filename: "img.pdf", content_type: "application/pdf")
item_1_3.save

file_1_4 = URI.open("https://images.sampleforms.com/wp-content/uploads/2019/01/Dental-Examination-Form-Sample.jpg")
item_1_4.photos.attach(io: file_1_4, filename: "img.pdf", content_type: "application/pdf")
item_1_4.save

file_1_5 = URI.open("https://images.sampleforms.com/wp-content/uploads/2019/01/Dental-Examination-Form-Sample.jpg")
item_1_5.photos.attach(io: file_1_5, filename: "img.pdf", content_type: "application/pdf")
item_1_5.save

file_1_6 = URI.open("https://images.sampleforms.com/wp-content/uploads/2019/01/Dental-Examination-Form-Sample.jpg")
item_1_6.photos.attach(io: file_1_6, filename: "img.pdf", content_type: "application/pdf")
item_1_6.save

file_1_7 = URI.open("https://images.sampleforms.com/wp-content/uploads/2019/01/Dental-Examination-Form-Sample.jpg")
item_1_7.photos.attach(io: file_1_7, filename: "img.pdf", content_type: "application/pdf")
item_1_7.save

file_1_8 = URI.open("https://images.sampleforms.com/wp-content/uploads/2019/01/Dental-Examination-Form-Sample.jpg")
item_1_8.photos.attach(io: file_1_8, filename: "img.pdf", content_type: "application/pdf")
item_1_8.save

# CREATING ITEMS & TAGS SEED COLLECTION 2
p "CREATING ITEMS & TAGSNEED COLLECTION 2"

item_2_1 = Item.create(title: "Liam's drawing of a bug", description: "Liam's drawing done with granny on school holidays", format: "JPEG", date: Date.parse("2021/06/02"), user: user_1)
item_2_2 = Item.create(title: "Lis's pottery", description: "Lis's pottery done at clay cafe for her cousin's birthday", format: "JPEG", date: Date.parse("2023/08/14"), user: user_1)

collection_2.items << item_2_1
collection_2.items << item_2_2
collection_2.save

member_2.items << item_2_1
member_2.save

member_3.items << item_2_2
member_3.save

tag_5 = Tag.create(name: "art", user: user_1)
tag_6 = Tag.create(name: "pictures", user: user_1)
tag_7 = Tag.create(name: "potery", user: user_1)
tag_8 = Tag.create(name: "drawing", user: user_1)

item_2_1.tags << [tag_5, tag_6, tag_8]
item_2_1.save
item_2_2.tags << [tag_5, tag_7]
item_2_2.save

# ATTACHING IMAGE TO COLLECTIONS

collection_image_1 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Brazuca_-_Planning_1_axhaln.png")
collection_1.photos.attach(io: collection_image_1, filename: "collection_image_1", content_type: "png")
collection_1.save
collection_image_2 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Humaaans_-_1_Character_ysea51.png")
collection_2.photos.attach(io: collection_image_2, filename: "collection_image_2", content_type: "png")
collection_2.save
collection_image_3 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Brazuca_-_Planning_zgipgr.png")
collection_3.photos.attach(io: collection_image_3, filename: "collection_image_3", content_type: "png")
collection_3.save
collection_image_5 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575989/collection_images/Tutto_Ricco_-_Red_Torso_kyvgtb.png")
collection_4.photos.attach(io: collection_image_5, filename: "collection_image_5", content_type: "png")
collection_4.save
collection_image_4 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575989/collection_images/Tutto_Ricco_-_Red_Sitting_On_Chair_astucs.png")
collection_5.photos.attach(io: collection_image_4, filename: "collection_image_4", content_type: "png")
collection_5.save
collection_image_6 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575989/collection_images/Tutto_Ricco_-_Walking_In_the_Park_brvkyb.png")
collection_6.photos.attach(io: collection_image_6, filename: "collection_image_6", content_type: "png")
collection_6.save
collection_image_1 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Brazuca_-_Planning_zgipgr.png")
collection_7.photos.attach(io: collection_image_1, filename: "collection_image_1", content_type: "png")
collection_7.save
collection_image_3 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Brazuca_-_Planning_1_axhaln.png")
collection_8.photos.attach(io: collection_image_3, filename: "collection_image_3", content_type: "png")
collection_8.save
collection_image_6 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575989/collection_images/Tutto_Ricco_-_Walking_In_the_Park_brvkyb.png")
collection_9.photos.attach(io: collection_image_6, filename: "collection_image_6", content_type: "png")
collection_9.save
collection_image_2 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Humaaans_-_1_Character_ysea51.png")
collection_10.photos.attach(io: collection_image_2, filename: "collection_image_2", content_type: "png")
collection_10.save
collection_image_4 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575989/collection_images/Tutto_Ricco_-_Red_Sitting_On_Chair_astucs.png")
collection_11.photos.attach(io: collection_image_4, filename: "collection_image_4", content_type: "png")
collection_11.save
collection_image_5 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575989/collection_images/Tutto_Ricco_-_Red_Torso_kyvgtb.png")
collection_12.photos.attach(io: collection_image_5, filename: "collection_image_5", content_type: "png")
collection_12.save
collection_image_1 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Brazuca_-_Planning_zgipgr.png")
collection_13.photos.attach(io: collection_image_1, filename: "collection_image_1", content_type: "png")
collection_13.save
collection_image_3 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Brazuca_-_Planning_1_axhaln.png")
collection_14.photos.attach(io: collection_image_3, filename: "collection_image_3", content_type: "png")
collection_14.save
collection_image_2 = URI.open("https://res.cloudinary.com/dp3xfbod8/image/upload/v1686575988/collection_images/Humaaans_-_1_Character_ysea51.png")
collection_15.photos.attach(io: collection_image_2, filename: "collection_image_2", content_type: "png")
collection_15.save

# ATTACHING IMAGES/PDF'S TO ITEMS 2.1 , 2.2
file_2_1 = URI.open("https://beafunmum.com/wp-content/uploads/2011/01/bugs.jpg")
item_2_1.photos.attach(io: file_2_1, filename: "image_1_1.jpg", content_type: "image/jpg")
item_2_1.save

file_2_2 = URI.open("https://artsymomma.com/wp-content/uploads/2016/09/DIY-Clay-Pottery-Dish-Shaped-Like-a-Turtle.png")
item_2_2.photos.attach(io: file_2_2, filename: "image_1_1.jpg", content_type: "image/jpg")
item_2_2.save

# CREATING SUGGESTIONS SEED
p "CREATING SUGGESTIONS SEED"
Suggestion.create(content: "Lila - Passport: Proof of identity and international travel document.")
Suggestion.create(content: "Kiki - Childcare enrollment documents: Required forms for enrolling the baby in daycare or preschool.")
Suggestion.create(content: "Lis - Babysitter authorization form: Permission for someone to care for the baby in your absence.")
Suggestion.create(content: "Liam - Emergency contact list: Important contacts in case of emergencies.")
Suggestion.create(content: "Lila - Social Security card: Government-issued identification for social security benefits.")
Suggestion.create(content: "Kiki - Guardian designation: Legal document specifying a guardian for the baby if needed.")
Suggestion.create(content: "Lis - Pediatrician contact information: Details of the baby's primary healthcare provider.")
Suggestion.create(content: "Liam - Health insurance card: Proof of the baby's coverage for medical care.")
Suggestion.create(content: "Lila - Birth certificate: Proof of birth and citizenship.")
Suggestion.create(content: "Kiki - Immunization records: Documentation of the baby's vaccinations and health history.")
Suggestion.create(content: "Lis - Passport: Document for international travel with the baby.")
Suggestion.create(content: "Liam - Social Security card: Government-issued identification for the baby.")
Suggestion.create(content: "Kiki - Birth certificate: Proof of the baby's birth and identity.")
Suggestion.create(content: "Lila - Health insurance card: Proof of coverage for medical expenses.")
Suggestion.create(content: "Lila - Driver's license: Official identification and permit for operating vehicles.")
p "FINISHED SEEDING THE DATABASE"
