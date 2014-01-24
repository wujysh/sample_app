namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Jiaye Wu",
                 email: "wujysh@gmail.com",
                 password: "127dgw",
                 password_confirmation: "127dgw",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@dhu.edu.cn"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end