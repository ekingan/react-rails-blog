# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scenery = Category.create(name: "scenery")
cooking = Category.create(name: "cooking")
structures = Category.create(name: "structures")
weather = Category.create(name: "weather")
queer = Category.create(name: "queer")
swimming = Category.create(name: "swimming")
boating = Category.create(name: "boating")
hiking = Category.create(name: "hiking")
backpacing = Category.create(name: "backpacing")
sunsets = Category.create(name: "sunsets")
sunrise = Category.create(name: "sunrise")
beach = Category.create(name: "beach")
forest = Category.create(name: "forest")
desert = Category.create(name: "desert")
mountains = Category.create(name: "mountains")
foraging = Category.create(name: "foraging")
fire = Category.create(name: "fire")

user = User.create(email: "test@test.com", password: "password", name: "Yolo")

30.times do
	Post.create(body: "Sed ut perspiciatis unde omnis iste natus error sit 
		voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque
		 ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae
		  dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit 
		  aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos 
		  qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui 
		  dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed 
		  quia non numquam eius modi tempora incidunt ut labore et dolore magnam 
		  aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum 
		  exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea 
		  commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea
		   voluptate velit esse quam nihil molestiae consequatur, vel illum qui 
		   dolorem eum fugiat quo voluptas nulla pariatur?", user_id: 1, location: "New York",
		   category_id: rand(1..17))	
end



