# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

{
  'Ruby' => [
    { title: 'パーフェクトRuby on Rails', price: 3828 },
    { title: 'プロを目指す人のためのRuby入門', price: 3278 },
    { title: 'たのしいRuby 第6版', price: 2860 }
  ],
  'プログラミング' => [
    { title: '独学プログラマー', price: 2420 },
    { title: 'プログラムはなぜ動くのか', price: 2640 }
  ],
  'アジャイル開発' => [
    { title: 'アジャイル開発とスクラム', price: 2200 },
    { title: 'SCRUM BOOT CAMP THE BOOK', price: 2640 },
    { title: 'アジャイルな見積もりと計画づくり', price: 3520 },
    { title: 'エッセンシャルスクラム', price: 3762 }
  ]
}.each do |genre_name, books|
  genre = Genre.create(name: genre_name)
  genre.books.create(books)
end
