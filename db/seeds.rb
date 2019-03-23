# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
polygons = [
    [[55.755861,37.600146], [55.761657,37.622109], [55.752577,37.639954], [55.742915,37.614216], [55.755861,37.600146]],
    [[55.751366,37.630491], [55.760495,37.647915], [55.751125,37.653794], [55.744072, 37.64928], [55.751366,37.630491]],
    [[55.736344,37.629316], [55.766679,37.599460], [55.766486,37.619020], [55.736344,37.629316]],
]

polygons.each do |p|
  p.map! { |e| e.join(' ')}
  Polygon.create({
                     area: "MULTIPOLYGON(((#{p.join(', ')})))",
                     color: "##{"%06x" % (rand * 0xffffff)}"
                 })
end

addresses = [
    [ 1, 55.756897, 37.619692 ],
    [ 1, 55.754808, 37.626108 ],
    [ 3, 55.757381, 37.621956 ],
    [ 2,  55.753588, 37.647142 ]
]


addresses.each do |a|
  Address.create({
                     point: "POINT(#{a[1]} #{a[2]})",
                     polygon_id: a[0]
                 })
end


100.times do
  Address.create({ point: "POINT(#{Random.rand(55700000...55790000).to_f / 1000000} #{Random.rand(37600000...37660000).to_f / 1000000})"})
end
