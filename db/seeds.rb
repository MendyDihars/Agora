puts "Destroy all :o "

Review.destroy_all
Chat.destroy_all
Mendie.destroy_all
UserSkill.destroy_all
RequestedSkill.destroy_all
Meeting.destroy_all
User.destroy_all
Skill.destroy_all

puts "Creating skills"

skills = [
  { name: "Climbing" },
  { name: "Mechanics" },
  { name: "Dance" },
  { name: "Webdesign" },
  { name: "Karate" },
  { name: "Guitar" },
  { name: "Code" },
  { name: "Painting" }
]
skills.each do |item|
  skill = Skill.new
  skill.name = item[:name]
  skill.save!
  print "🏩 "
end

puts  "Skills created"

puts "Creating users"

users = [
  {
    first_name: 'Harry',
    last_name: 'Potter',
    age: 17,
    bio: "I'm a wizard so, magic is a big part of me... but sometimes when I'm hidden under the Whomping Willow, I dance and I love it !",
    url: 'http://media.topito.com/wp-content/uploads/2014/10/harry7.jpg',
    email: "harrypotter@mail.com",
    skill: "Dance",
    wanted_skill: "Guitar"
  },
  {
    first_name: 'Adalberto',
    last_name: 'Gonzalez',
    age: 25,
    bio: "I like to persuade others I'm a colombian.. hihi. In fact, I'm a Parisian",
    url: 'https://avatars1.githubusercontent.com/u/23275404?v=3&s=460',
    email: "adalg08@mail.com",
    skill: "Code",
    wanted_skill: "Mechanics"
  },
  {
    first_name: 'Anonymous',
    last_name: 'Unknown Name',
    age: 0,
    bio: "I'm hacking you right now... lol",
    url: 'http://www.myshirt.fr/838/t-shirt-anonymous.jpg',
    email: "hack@mail.com",
    skill: "Code",
    wanted_skill: "Climbing"
  },
  {
    first_name: 'Mendy',
    last_name: 'Dihars',
    age: 22,
    bio: "Web Developpeur FullStack Junior Ruby on Rails. I can teach you my knowledge's code.. lucky boy/girl.",
    url: 'https://avatars3.githubusercontent.com/u/26514822?v=3&s=460',
    email: "mendy@mail.com",
    skill: "Code",
    wanted_skill: "Guitar"
  },
  {
    first_name: 'Arthur',
    last_name: 'Pendragon',
    age: 30,
    bio: "I practice Karate and sometimes, I'm the King",
    url: 'http://www.info-mag-annonce.com/journal/upload/2015/08/CULT_ALEXANDRE_ASTIER.jpg',
    email: "sanglier-de-cournouailles@mail.com",
    skill: "Karate",
    wanted_skill: "Code"
  },
  {
    first_name: 'Lara',
    last_name: 'Croft',
    age: 28,
    bio: "I love archeology and kill each thing I see.",
    url: 'http://img04.deviantart.net/d5cb/i/2013/060/f/0/lara_croft_portrait__3d__by_sterrennacht-d5wj4yo.png',
    email: "tomb-raider@mail.com",
    skill: "Karate",
    wanted_skill: "Webdesign"
  },
  {
    first_name: 'Marie',
    last_name: 'Curie',
    age: 150,
    bio: "I'm an expert in chemistry, I can teach you... wait.. Come back ! COME BACK !",
    url: 'http://lettre.ehess.fr/docannexe/file/4320/marie_curie.jpg',
    email: "mariecurie@mail.com",
    skill: "Mechanics",
    wanted_skill: "Code"
  },
  {
    first_name: 'Gregory',
    last_name: 'Debargue',
    age: 33,
    bio: "I'm a funny guy with a funny face and a funny humor",
    url: 'https://avatars2.githubusercontent.com/u/25842275?v=3&s=460',
    email: "funny-boy@mail.com",
    skill: "Webdesign",
    wanted_skill: "Guitar"
  },
  {
    first_name: 'Denis',
    last_name: 'Giraud',
    age: 28,
    bio: "I can do what you want, I just need to read the doc",
    url: 'https://avatars1.githubusercontent.com/u/26795584?v=3&s=460',
    email: "giraud.de@gmail.com",
    skill: "Webdesign",
    wanted_skill: "Code"
  },
  {
    first_name: 'Sauron',
    last_name: 'Mordor',
    age: 600,
    bio: "I like jewels ! I've a great ring ! Do you want to see it ? Wait.. Where is it??",
    url: 'https://pbs.twimg.com/profile_images/658256779189616640/NPCn-Muj.jpg',
    email: "sauron@mail.com",
    skill: "Climbing",
    wanted_skill: "Webdesign"
  },
  {
    first_name: 'Demo-Man',
    last_name: 'Demo-last_name',
    age: 35,
    bio: "I'm a demo !",
    url: "http://www.ninjatown.com/wp-content/uploads/2011/06/WeeNinja-patch.jpg",
    email: 'demo@mail.com',
    skill: 'Guitar',
    wanted_skill: "Code"
  },
  {
    first_name: "Sylvain",
    last_name: 'Peigney',
    age: 30,
    bio: "You were good kid, real good. But as long as I'm around, you'll always be second best, see",
    url: "https://avatars2.githubusercontent.com/u/466015?v=3&s=460",
    email: "sylvain@mail.com",
    skill: 'Code',
    wanted_skill: "Dance"
  },
  {
    first_name: "Gilles",
    last_name: 'Aroutzet',
    age: 21,
    bio: "I’m a cool guy living in Bordeaux. I used to be karate kid in the famous movie, then I spent 15 years in Japan. I love animals, because every creature matters. I’m here to teach karate but also to learn a lot of new things",
    url: "https://avatars2.githubusercontent.com/u/26441375?v=3&s=400",
    email: "garoutzet@mail.com",
    skill: 'Karate',
    wanted_skill: "Painting"
  },
  {
    first_name: "Tiphaine",
    last_name: 'Dosta',
    age: 22,
    bio: "Hey ! I'm the better designer you've ever seen. I can teach you if you have the potential",
    url: "https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/16265296_1305374079523193_5837690447164327154_n.jpg?oh=3316c56dc7ae8662ff52ddcbf78b0841&oe=59B78A2A",
    email: "tiphaine@mail.com",
    skill: 'Painting',
    wanted_skill: "Karate"
  },
  {
    first_name: "Edward",
    last_name: 'Dupont',
    age: 8,
    bio: "Wouf ! Wouhouuuu Wouf ! ... sorry ... Bark !",
    url: "http://www.ushot.pl/wp-content/uploads/2014/03/William-Wegman-dog-ushot-2.jpg",
    email: "edwardn@mail.com",
    skill: 'Painting',
    wanted_skill: "Guitar"
  },
  {
    first_name: "Albert",
    last_name: 'Einstein',
    age: 78,
    bio: "E = Mc.. Solar. Yeah I'm scientist but I'm a man after all.. And mens like humor.",
    url: "https://i2.wp.com/memolition.com/wp-content/uploads/2014/01/albert-einstein-04.jpg?fit=600\%2C600",
    email: "bebert@mail.com",
    skill: 'Mechanics',
    wanted_skill: "Climbing"
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
  balance = Mendie.new(balance: 3)
  user.mendie = balance
  print "😜 "
  user.save!
end
puts ""
puts "Users created"
puts "Creating user skills"

user_length = User.all.length
num = 0

users.each do |item|
  user_skill = UserSkill.new
  user = User.all
  user_skill.user = user[num]
  skill = Skill.find_by_name(item[:skill])
  user_skill.skill =  skill
  user_skill.save!
  num += 1
  print "💛 "
end

puts ""
puts "User Skills created"

puts "Creating requested skills"

user_length = User.all.length
num = 0

users.each do |item|
  requested_skill = RequestedSkill.new
  user = User.all
  requested_skill.user = user[num]
  skill = Skill.find_by_name(item[:wanted_skill])
  requested_skill.skill =  skill
  requested_skill.save!
  num += 1
  print "🐹 "
end
puts ""
puts "Requested skills created"

puts 'Setup Demo Day'

ada = User.find_by_first_name("Adalberto")
harry = User.find_by_first_name("Harry")
edward = User.find_by_first_name("Edward")
gilles = User.find_by_first_name("Gilles")
mendy = User.find_by_first_name("Mendy")

puts 'add 8 mendies to Gilles'
gilles.mendie.balance = 8
puts "Done"

Review.create!(teacher: gilles, student: ada, content: "C'est un super prof ! Je conseille", rating: 5 )
puts "💌 "
Review.create!(teacher: gilles, student: harry, content: "Ce mec est magique !", rating: 5 )
puts "💌 "
Review.create!(teacher: gilles, student: edward, content: "J'ai pu passer ma ceinture verte grâce à ses conseils", rating: 4 )
puts "💌 "

date = Date.today - 3
Meeting.create!(teacher: edward, student: mendy, happen_at: date, approved_at: date, message: "Peut-on se voir pour un cours de Webdesign?", approved_message: "Ouais pas de soucis ! Viens au café La Niche", skill: edward.own_skills.first)
puts "💌 "

puts "Putain, ca a marché 🎉 "
