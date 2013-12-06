posts = [
    {title: 'initial', date: Time.now, text: 'I will never figure out something to write here'},
    {title: 'second', date: Time.now, text: 'I will still have not figured out something to write here'}
]

users = [
    {username: "peter_33", password: "hajar"},
    {username: "nisse99", password: "tomte"}
]


posts.each do |post|
  Post.create(title: post[:title],
              date: post[:date],
              text: post[:text])
end

users.each do |user|
  User.create(username: user[:username], password: user[:password])
end