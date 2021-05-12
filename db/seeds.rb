Comic.destroy_all
Group.destroy_all
Post.destroy_all
Review.destroy_all
User.destroy_all

puts "Creating comics..."
Comic.create(title: "Swamp Thing",
            issue_title: "The Garden of Early Delights",
            issue_number: 53,
            author: "Alan Moore", 
            publisher: "DC Comics",
            summary: "Upon return from the afterlife, Swamp Thing finds out Abby, his wife, has been arrested in Gotham. When pleas to have her let go are not followed, Swamp Thing unleashes a rampage on all of Gotham, forcing Batman to intervene.",
            image_url: "https://d1466nnw0ex81e.cloudfront.net/n_iv/600/607671.jpg")
Comic.create(title: "The Incredible Hulk",
             issue_title: "And Now... the Wolverine!",
             issue_number: 181,
             author: "Len Wein", 
             publisher: "Marvel",
             summary: "Known for the first appearance of Wolverine, this issue finds The Hulk battling alongside the X-Man against Wendigo.",
             image_url: "https://d1466nnw0ex81e.cloudfront.net/n_iv/600/4806154.jpg")
Comic.create(title: "The Uncanny X-Men",
             issue_title: "X-Men #1",
             issue_number: 1,
             author: "Stan Lee", 
             publisher: "Marvel",
             summary: "The debut of the X-Men as they battle Magneto in their premiere issue. Classic cover by Jack Kirby.",
             image_url: "https://i.annihil.us/u/prod/marvel/i/mg/c/f0/589ddfc222e9c/clean.jpg")
Comic.create(title: "The Sandman",
             issue_title: "A Midsummer Night's Dream",
             issue_number: 19,
             author: "Neil Gaiman", 
             publisher: "DC Comics",
             summary: "Morpheus, the king of dreams, helps William Shakespeare in crafting his famous play. Regarded as a fan-favorite to this day.",
             image_url: "https://i1.wp.com/cokeandcomics.com/wp-content/uploads/2020/07/cover-1-scaled.jpeg?fit=648%2C1024&ssl=1")
Comic.create(title: "Detective Comics",
             issue_title: "The Case of the Chemical Syndicate",
             issue_number: 27,
             author: "Bob Kane", 
             publisher: "DC Comics",
             summary: "After a murder, Commissioner Gordon is helped by young playboy Bruce Wayne in his investigation. Shortly after Gordon receives a tip, Wayne excuses himself and later that night, Gotham, and the world, meet The Batman for the very first time.",
             image_url: "https://blog.gocollect.com/wp-content/uploads/2020/04/Detective-Comics-27-1984.jpg")
Comic.create(title: "Saga",
             issue_title: "Volume 12",
             issue_number: 12,
             author: "Brian K. Vaughan", 
             publisher: "Image Comics",
             summary: "Prince Robot IV's backstory is explored, as he continues his pursuit of Alana and Marko in the home of famous author D. Oswalt Heist.",
             image_url: "https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/38345/FEB130461_1._SX1600_QL80_TTD_.jpg")
Comic.create(title: "All-Star Superman",
             issue_title: "Being Bizarro",
             issue_number: 7,
             author: "Grant Morrison and Frank Quietly", 
             publisher: "DC Comics",
             summary: "Superman is stranded on the cubed world of Bizarro and must find a way home before being stuck there forever.",
             image_url: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1385211232l/18903873.jpg")
Comic.create(title: "Miracleman",
             issue_title: "Nemesis",
             issue_number: 15,
             author: "Alan Moore", 
             publisher: "Marvel",
             summary: "Former Miracleman sidekick Kid Marvelman has lost his mind and unleashes destruction upon London. Miracleman is forced to take the highest measure to end Kid Miracleman's terror.",
             image_url: "https://marswillsendnomore.files.wordpress.com/2011/12/miracleman15-00.jpg")
Comic.create(title: "The Walking Dead",
             issue_title: "",
             issue_number: 19,
             author: "Robert Kirkman", 
             publisher: "Image Comics",
             summary: "A new hero, Michonne Hawthorne, joins Rick and the gang holding up at the prison. The first appearance of this iconic character.",
             image_url: "https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/523/FEB051603_1._SX1600_QL80_TTD_.jpg")
Comic.create(title: "The Amazing Spider-Man",
             issue_title: "The Chameleon Strikes",
             issue_number: 1,
             author: "Stan Lee", 
             publisher: "Marvel",
             summary: "Strapped for cash, Peter Parker breaks into the Fantastic Four headquarters and the quartet quickly entrap him. After a draw between Spidey and the Four, the Chameleon frames Spider-Man for breaking into a military base.",
             image_url: "https://images-na.ssl-images-amazon.com/images/I/91ksTdt00TL.jpg")


puts "Creating Users..."
25.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.safe_email)
end

puts "Creating Reviews..."
15.times do
  Review.create(comic_id: Comic.all.sample.id,
                user_id: User.all.sample.id,
                content: Faker::Lorem.paragraph(sentence_count: 2),
                rating: rand(1..5))
end

puts "Creating Groups..."
8.times do
  Group.create(user_id: User.all.sample.id,
               title: Faker::Lorem.sentence(word_count: 3))
end

puts "Creating Posts..."
20.times do
  Post.create(group_id: Group.all.sample.id,
              user_id: User.all.sample.id,
              content: Faker::Lorem.paragraph(sentence_count: 4))
end

puts "...Done!"