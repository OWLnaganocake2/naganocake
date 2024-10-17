# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "admin@example.jp",
              password:  "123456",
              assword_confirmation: "123456",)
                
Item.create!(genre_id: "1",
            name: "ショートケーキ",
            item_details: "おいしいよ",
            price: "1000",
            s_active: "true")

Genre.create!(name:"ケーキ")

Customer.create!(family_name:"長澤",
                first_name:"まさみ",
                family_name_kana:"ナガサワ",
                first_name_kana:"マサミ",
                post_code:"1234567",
                address:"東京都新宿区",
                tell_number:"09012345678",
                email:"a@a",
                password:  "123456",
                password_confirmation: "123456",
                is_deleted:"false"
                )