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
    first_name: 'Harry',
    last_name: 'Potter',
    age: 17,
    bio: "I'm a wizard so, magick is a big part of me... but sometimes when I'm hidden under the Whomping Willow, I'm practicing dance and I love that !",
    url: 'http://media.topito.com/wp-content/uploads/2014/10/harry7.jpg',
    email: "harrypotter@mail.com"
  },
  {
    first_name: 'Adalberto',
    last_name: 'Gonzalez',
    age: 25,
    bio: "I like to persuade others I'm colombian.. hihi. In fact, I'm parisian",
    url: 'https://avatars1.githubusercontent.com/u/23275404?v=3&s=460',
    email: "adalg08@mail.com"
  },
  {
    first_name: 'Anonymous',
    last_name: 'Unknown Name',
    age: 0,
    bio: "I'm hacking you right now... lol",
    url: 'http://www.myshirt.fr/838/t-shirt-anonymous.jpg',
    email: "hack@mail.com"
  },
  {
    first_name: 'Mendy',
    last_name: 'Dihars',
    age: 22,
    bio: "I can do some things, I hope I'll can approve you",
    url: 'https://avatars3.githubusercontent.com/u/26514822?v=3&s=460',
    email: "mendy@mail.com"
  },
  {
    first_name: 'Arthur',
    last_name: 'Pendragon',
    age: 30,
    bio: "I practice Karate and sometimes, I'm King",
    url: 'https://kaamelott.hypnoseries.tv/photo/119/galerie/Personnages_Principaux/arthur/1arthur-television-magazine-237817-holly95_1_.jpg',
    email: "sanglier-de-cournouailles@mail.com"
  },
  {
    first_name: 'Lara',
    last_name: 'Croft',
    age: 28,
    bio: "I love archeology and kill each thing that I see.",
    url: 'https://img.generation-nt.com/lara-croft_01B0000001625626.jpg',
    email: "tomb-raider@mail.com"
  },
  {
    first_name: 'Marie',
    last_name: 'Curie',
    age: 150,
    bio: "I'm an expert in chemistry, I can teach you... wait.. Come back ! COME BACK !",
    url: 'http://lettre.ehess.fr/docannexe/file/4320/marie_curie.jpg',
    email: "mariecurie@mail.com"
  },
  {
    first_name: 'Gregory',
    last_name: 'Debargue',
    age: 33,
    bio: "I'm a funny guy with a funny face and a funny humor",
    url: 'https://avatars2.githubusercontent.com/u/25842275?v=3&s=460',
    email: "funny-boy@mail.com"
  },
  {
    first_name: 'Denis',
    last_name: 'Giraud',
    age: 28,
    bio: "I can do what you want, I just need to read the doc",
    url: 'https://avatars1.githubusercontent.com/u/26795584?v=3&s=460',
    email: "girauden@mail.com"
  },
  {
    first_name: 'Denis',
    last_name: 'Giraud',
    age: 28,
    bio: "I can do what you want, I just need to read the doc",
    url: 'https://avatars1.githubusercontent.com/u/26795584?v=3&s=460',
    email: "girauden@mail.com"
  },
  {
    first_name: 'Demo-Man',
    last_name: 'Demo-last_name',
    age: 35,
    bio: "I'm a demo !",
    url: "http://forex-ecole.com/wp-content/uploads/2015/07/requst-a-demo.jpg",
    email: 'demo@mail.com'
  }
]


puts ""


addresses = ["Cours Balguerie Stuttenberg, Bordeaux", "Rue Raze, Bordeaux", "Avenue Abadie, Bordeaux", "Rue du Palais Gallien, Bordeaux", "Saint Michel, Bordeaux"]

users.each do |item|
  user = User.new
  user.first_name = item[:first_name]
  user.last_name = item[:last_name]
  user.age = item[:age]
  user.bio = item[:bio]
  user.address = addresses.sample
  user.password = "123456"
  user.email = item[:email]
  user.photo_url = item[:url]
  print "😜 "
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
