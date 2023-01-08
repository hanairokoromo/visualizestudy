# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'admin@admin.com',
    password: 'adminadmin',
    )

User.create!(
  [
    {email: 'wani@example.com', first_name: '丹羽', last_name: '健二郎', first_name_kana: 'ニワ', last_name_kana: 'ケンジロウ', account_name: 'わに', password: 'wanikenziro', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ヘッドフォン.icon.png"), filename:"ヘッドフォン.icon.png")},
    {email: 'panda@example.com', first_name: '荒井', last_name: '正直', first_name_kana: 'アライ', last_name_kana: 'マサナオ', account_name: 'パンダ', password: 'pandamasanao', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/パンダ.icon.png"), filename:"パンダ.icon.png")},
    {email: 'funa@example.com', first_name: '船見', last_name: '真智子', first_name_kana: 'フナミ', last_name_kana: 'マチコ', account_name: 'ふな', password: 'funamachiko', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ふな.icon.png"), filename:"ふな.icon.png")}
  ]
)
