20.times do |d|
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraphs(number: 15).join(' '), user_id: 2)

  puts "Fake [Post] [#{post.title}]"
end
