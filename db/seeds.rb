puts "Destroy all :o "

Meeting.destroy_all
UserSkill.destroy_all
RequestedSkill.destroy_all
Skill.destroy_all
User.destroy_all

puts "Creating skills"

skills = [
  { name: "Handyman" },
  { name: "Mechanics" },
  { name: "Dance" },
  { name: "Webdesign" },
  { name: "Karate" },
  { name: "Guitar" },
  { name: "Code" },
  { name: "Painting" }
]
Skill.create!(skills)

puts  "Skills created"

puts "Creating users"

users = [
  {
    first_name: 'Harry'
    last_name: 'Potter'
    age: 17
    bio: "I'm a wizard so, magick is a big part of me... but sometimes when I'm hidden under the Whomping Willow, I'm practicing dance and I love that !"
    url: 'http://media.topito.com/wp-content/uploads/2014/10/harry7.jpg'
    email: "harrypotter@mail.com"
  },
  {
    first_name: 'Adalberto'
    last_name: 'Potter'
    age: 17
    bio: "I'm a wizard so, magick is a big part of me... but sometimes when I'm hidden under the Whomping Willow, I'm practicing dance and I love that !"
    url: 'http://media.topito.com/wp-content/uploads/2014/10/harry7.jpg'
    email: "harrypotter@mail.com"
  },
]

n = 1
addresses = ["Cours Balguerie Stuttenberg, Bordeaux", "Rue Raze, Bordeaux", "Avenue Abadie, Bordeaux", "Rue du Palais Gallien, Bordeaux", "Saint Michel, Bordeaux"]
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..65),
    bio: Faker::Matz.quote,
    address: addresses.sample,
    password: "123456",
    email: "demo#{n}@mail.com")
  n += 1
end

print "... done"

puts "Creating user skills"
User.all.each do |user|
  user_skill = UserSkill.new
  user_skill.user_id = user.id
  user_skill.skill_id = Skill.all.sample.id
  user_skill.save!
end

print "... done"

puts "Creating requested skills"

UserSkill.all.each do |user_skill|
  requested_skill = RequestedSkill.new
  requested_skill.user_id = user_skill.user_id
  requested_skill.skill_id = Skill.all.sample.id
  until requested_skill.skill_id != user_skill.skill_id
    requested_skill.skill_id = Skill.all.sample.id
  end
  requested_skill.save!
end

print "... done"

puts "Putain, ca a marché 🎉 "
