# db/seeds.rb

require "ffaker"

users_seeds = [
                [ "Mike", "Tan",
                  "mike@ta.n", "password" ],
                [ "Celeste", "Layne",
                  "celeste@layn.e", "password" ],
                [ "Wyatt", "Sweet",
                  "wyatt@swee.t", "password" ],
                [ "Francisco", "Echeverri",
                  "francisco@echeverr.i", "password" ],
                [ "Ugo", "Ani",
                  "ugo@an.i", "password" ]
              ]
              
users_seeds.each do |fname, lname, email, pass|
  User.create( first_name: fname, last_name: lname, email: email, password: pass )
end

95.times do ||
  User.create( first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name, email: FFaker::Internet::email, password: "password" )
end

roasts_seeds =  [
                  [ "medium", "single origin",
                    "Rwanda Nyanza Kirezi", "Blue Bottle Coffee" ],
                  [ "light", "single origin",
                    "Burundi Kayanza Ninga", "Blue Bottle Coffee" ],
                  [ "dark", "blend",
                    "Wolf Moon Seasonal Espresso", "Ritual Coffee Roasters" ],
                  [ "dark", "single origin",
                    "Reserve 100% Panama Geisha", "San Francisco Bay Coffee" ],
                  [ "dark", "single origin",
                    "Colombia Luminosa", "Peet's Coffee & Tea" ],
                  [ "medium", "single origin",
                    "Ethiopia Homacho Waeno", "Blue Bottle Coffee" ],
                  [ "light", "single origin",
                    "Colombia Granja Esperanza Gesha AAA", "Blue Bottle Coffee" ],
                  [ "light", "single origin",
                    "Rwanda Kirezi", "Blue Bottle Coffee" ],
                  [ "medium", "single origin",
                    "Rwanda Cotecaga Bourbon", "Four Barrel Coffee" ],
                  [ "medium", "single origin",
                    "Colombia Finca Monte Verde, Gildardo", "Sightglass Coffee" ],
                  [ "light", "single origin",
                    "Colombia El Bado", "Mr. Espresso" ],
                  [ "medium", "single origin",
                    "Brazil Yellow Catuai Esperança Joao", "Ritual Coffee Roasters" ],
                  [ "light", "single origin",
                    "Brazil Fazenda Sertaozinho", "Linea Caffe S.F." ],
                  [ "medium", "single origin",
                    "Brazil Bela Vista Micro-Lot", "Equator Coffees & Teas" ],
                  [ "medium", "blend",
                    "Three Africans", "Blue Bottle Coffee" ],
                  [ "medium", "single origin",
                    "Panama Finca La Mula Geisha Natural", "Equator Coffees & Teas" ],
                  [ "medium", "single origin",
                    "Ethiopia Yirgacheffe Kochere Aricha", " Mr. Espresso" ],
                  [ "light", "single origin",
                    "Honduras Cerro Gacho", "Blue Bottle Coffee" ],
                  [ "medium", "single origin",
                    "Sumatra Lintong Tano Batak", "Equator Coffees & Teas" ],
                  [ "light", "single origin",
                    "Ecuador El Batan Fiar Trade Organic", "Equator Coffees & Teas" ]
                ]
 
roasts_seeds.each do |roast_level, roast_type, name, roaster|
  Roast.create( roast_level: roast_level, roast_type: roast_type, coffee_name: name, roaster: roaster )
end

cafes_seeds = [
                [ "Coffee Cultures",
                  "225 Bush St, San Francisco, CA",
                  "Counter Culture Coffee Roasters" ],
                [ "Modern Coffee",
                  "411 13th St, Oakland, CA 94612",
                  "Multi Roaster Cafe" ],
                [ "Ritual Coffee Roasters",
                  "1026 Valencia St, San Francisco, CA",
                  "Ritual Coffee Roasters" ],
                [ "Ritual Coffee Roasters",
                  "1634 Jerrold Ave, San Francisco, CA",
                  "Ritual Coffee Roasters" ],
                [ "Ritual Coffee Roasters",
                  "432b Octavia St, San Francisco, CA",
                  "Ritual Coffee Roasters" ],
                [ "Ritual Coffee Roasters",
                  "610 First St, Napa, CA",
                  "Ritual Coffee Roasters" ],
                [ "Four Barrel Coffee",
                  "375 Valencia St, San Francisco, CA",
                  "Four Barrel Coffee" ],
                [ "Sightglass Coffee",
                  "270 Seventh St, San Francisco, CA",
                  "Sightglass Coffee" ],
                [ "Blue Bottle Coffee",
                  "300 Webster St, Oakland, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "66 Mint Plaza, San Francisco, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "4270 Broadway, Oakland, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "115 Sansome, San Francisco, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "456 University Ave, Palo Alto, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "315 Linden St, San Francisco, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "1 Ferry Building, #7, San Francisco, CA",
                  "Blue Bottle Coffee" ],
                [ "Blue Bottle Coffee",
                  "1355 Market St, San Francisco, CA",
                  "Blue Bottle Coffee" ],
              ]

cafes_seeds.each do |name, address, roaster|
  Cafe.create( name: name, address: address, roaster: roaster )
end

1000.times do ||
  Review.create( user_id: rand(1 .. 100), roast_id: rand(1 .. 20), rating: rand(1 .. 5), body:FFaker::HipsterIpsum::paragraph )
end
