# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Event.destroy_all

tom = User.create!(first_name: 'tom', 
	last_name: 'nullet',
	phone: 2131231239, 
	karma_count: 0, 
	home_base: "351 w hubbard", 
	hb_latitude: 41.889616, 
	hb_longitude: -87.637211, 
	hb_radius: 5000, 
	email: "tom@dbc.com", 
	password: "password")
paige = User.create!(first_name: 'paige',
	last_name: 'crum',
	phone: 2131231237, 
	karma_count: 0, 
	home_base: "351 w hubbard", 
	hb_latitude: 41.889616, 
	hb_longitude: -87.637211, 
	hb_radius: 5000, 
	email: "paige@dbc.com", 
	password: "password")
robb = User.create!(first_name: 'robb',
	last_name: 'tvorik',
	phone: 2131231231, 
	karma_count: 0, 
	home_base: "351 w hubbard", 
	hb_latitude: 41.889616, 
	hb_longitude: -87.637211, 
	hb_radius: 5000, 
	email: "rob@dbc.com", 
	password: "password")
nate = User.create!(first_name: 'nate',
	last_name: 'kandler',
	phone: 2131231233, 
	karma_count: 0, 
	home_base: "351 w hubbard", 
	hb_latitude: 41.889616, 
	hb_longitude: -87.637211, 
	hb_radius: 5000, 
	email: "nate@dbc.com", 
	password: "password")
jared = User.create!(first_name: 'jared',
	last_name: 'daugherty',
	phone: 2131231234, 
	karma_count: 0, 
	home_base: "1829 n orchard", 
	hb_latitude: 41.889616, 
	hb_longitude: -87.637211, 
	hb_radius: 5000, 
	email: "jaredmdaugherty@gmail.com", 
	password: "password")

users = [tom, paige, robb, nate, jared]

5.times do
	users = [tom, paige, robb, nate, jared].shuffle

	requester = users.pop.id
	responder = users.pop.id
	lat = 41.889 + rand.round(6) / 5
	long = -87.637 - rand.round(6) / 5

	Event.create!(requester_id: requester, 
		#responder_id: responder,
		latitude: lat,
		longitude: long,
		active: true,
		request_text: rand(100).to_s
	)

end