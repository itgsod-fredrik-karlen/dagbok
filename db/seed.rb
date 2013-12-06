posts = [
    {title: 'initial', text: 'I will never figure out something to write here', user_id: 1},
    {title: 'second', text: 'I still have not figured out something to write here', user_id: 2},
    {title: 'u2', text: "And i stiiiiiil haven't fouuuuuund what i'm looookiiing foooooor.", user_id: 1}
]

users = [
    {username: "peter_33", password: "hajar"},
    {username: "nisse99", password: "tomte"}
]

users.each do |user|
  User.create(username: user[:username], password: user[:password])
end

posts.each do |post|
  user = User.get(post[:user_id])
  Post.create(title: post[:title],
                   text: post[:text],
                   user: user)


end

