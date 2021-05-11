Comic.destroy_all
Group.destroy_all
Post.destroy_all
Review.destroy_all
User.destroy_all

10.times do
Comic.create(title: Faker::DcComics.title,
             author:Faker::Name.name, 
             publisher: "DC",
             summary: Faker::Lorem.paragraph(sentence_count: 2),
             image_url:Faker::Internet.url)
end

10.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.safe_email)
end

15.times do
  Review.create(comic_id: Comic.all.sample.id,
                user_id: User.all.sample.id,
                content: Faker::Lorem.paragraph(sentence_count: 2),
                rating: rand(1..5))
end

5.times do
  Group.create(user_id: User.all.sample.id,
               comic_id: Comic.all.sample.id)
end

10.times do
  Post.create(group_id: Group.all.sample.id,
              title: Faker::Lorem.sentence(word_count: 3),
              content: Faker::Lorem.paragraph(sentence_count: 4))
end