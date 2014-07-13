# http://localhost:3000/posts.json
# exposes api ( for url only in this case )
json.array! @posts do |post|
  json.url post.url
end