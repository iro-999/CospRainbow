# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!(
  [
    {email: 'a@test.com', name: 'わに', password: '123456', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'b@test.com', name: 'ワニ山ワニ男', password: '123456', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'c@test.com', name: 'ワニのすけ', password: '123456', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

CosplayImage.create!(
  [
    {title: 'A3', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cosplayimage1.jpg"), filename:"sample-cosplayimage1.jpg"), character: "七尾太一", body: '通常衣装', user_id: users[0].id },
    {title: 'オリジナル', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cosplayimage2.jpg"), filename:"sample-cosplayimage2.jpg"), character: "赤鬼", body: '創作', user_id: users[1].id },
    {title: 'オリジナル', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-cosplayimage3.jpg"), filename:"sample-cosplayimage3.jpg"), character: "男子高校生", body: '創作', user_id: users[2].id }
  ]
)