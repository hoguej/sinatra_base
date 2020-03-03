
contents = [
  {name: 'front_page', body: 'Hello World2'},
]

contents.each do |content|
  Content.create(content)
end