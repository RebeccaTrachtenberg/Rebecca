User.delete_all
Post.delete_all


users = 100.times.map do |n|
  username = "#{Faker::HarryPotter.character}#{n}"
  User.create!(
    :username => username,
    :email=> Faker::Internet.email,
    :password=>'password' )
end


100.times {Post.create!(
    :title=> Faker::HarryPotter.book,
    :body=> Faker::HarryPotter.quote,
    :poster=> User.all[rand(0..100)])
  }

  10.times {Comments.create!(
      :title=> Faker::HarryPotter.book,
      :body=> Faker::HarryPotter.quote,
      :poster=> User.all[rand(0..100)])
    }
