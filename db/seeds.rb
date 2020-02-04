# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# AdminModel(1)
Admin.create!(
              email: "masaharu@mail",
              password: "masaharu",
              )


# CustomerModel(3)

Customer.create!(
                  is_enabled: "true",
                  last_name: "赤羽",
                  first_name: "諒",
                  last_name_kana: "アカハ",
                  first_name_kana: "リョウ",
                  phone_number: "00000000000",
                  email: "akaharyou@mail",
                  password: "akaharyou",

                  post_code: "0000000",

                  address: "東京都 新宿区 新宿3丁目",
                  )
Customer.create!(
                  is_enabled: "true",
                  last_name: "佐藤",
                  first_name: "魁登",
                  last_name_kana: "サトウ",
                  first_name_kana: "カイト",
                  phone_number: "11111111111",
                  email: "satoukaito@mail",
                  password: "satoukaito",

                  post_code: "1111111",

                  address: "東京都 新宿区 新宿2丁目",
                  )
Customer.create!(
                  is_enabled: "true",
                  last_name: "上野",
                  first_name: "栞音",
                  last_name_kana: "ウエノ",
                  first_name_kana: "カノン",
                  phone_number: "22222222222",
                  email: "uenokanon@mail",
                  password: "uenokanon",

                  post_code: "2222222",
                  address: "東京都 新宿区 新宿1丁目",
                  )

# GenreModel(4)
Genre.create!(
              name: "ケーキ",
              is_enabled: true
            )

Genre.create!(
              name: "プリン",
              is_enabled: true
            )
Genre.create!(
              name: "焼き菓子",
              is_enabled: true
            )
Genre.create!(
              name: "キャンディ",
              is_enabled: true
            )

# ItemModel
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "洋梨のチーズタルト",
              description: "北海道産の最高級カッテージチーズ＆最高級生クリームを贅沢に使用。",
              price: 1000,
              sale_status: "販売可"
              )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "いちごのショートケーキ",
              description: "あまおうを贅沢に使用。",
              price: 2000,
              sale_status: "販売可"
              )
Item.create!(
              genre_id: 4,
              image_id: nil,
              name: "漢方のどあめ",
              description: "のどの痛みを緩和。",
              price: 300,
              sale_status: "販売可"
              )
Item.create!(
              genre_id: 3,
              image_id: nil,
              name: "シェフの気まぐれマドレーヌ",
              description: "フランス産 最高級バターを贅沢に使用。",
              price: 500,
              sale_status: "販売可"
              )
Item.create!(
              genre_id: 2,
              image_id: nil,
              name: "焼きプリン",
              description: "卵の風味が強いプリンを香ばしく焼き上げました。",
              price: 1000,
              sale_status: "販売可"
              )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "クリスマスドームケーキ",
              description: "クリスマスに豪華な一品をどうぞ。",
              price: 2000,
              sale_status: "販売可"
              )

# OrderModel
# Order.create!(
#               customer_id: 3,
#               last_name: "上野",
#               first_name: "栞音",
#               post_code: "222-2222",
#               address: "東京都 新宿区 新宿1丁目",
#               payment: "クレジットカード",
#               carriage: 800,
#               total_price: 3400,
#               order_status: "入金待ち"
#               )


# OrderDetailModel
# OrderDetail.create!(
#                       order_id: 1,
#                       item_name: "シェフの気まぐれマドレーヌ",
#                       item_price: 500,
#                       quantity: 1,
#                       item_status: "着手不可",
#                       )
# OrderDetail.create!(
#                       order_id: 1,
#                       item_name: "洋梨のチーズタルト",
#                       item_price: 1000,
#                       quantity: 1,
#                       item_status: "着手不可",
#                       )
# OrderDetail.create!(
#                       order_id: 1,
#                       item_name: "焼きプリン",
#                       item_price: 1000,
#                       quantity: 1,
#                       item_status: "着手不可",
#                       )
# CartItem.create!(
#   customer_id: 1,
#   item_id: 1,
#   quantity: 2,
#
# )
# CartItem.create!(
#   customer_id: 1,
#   item_id: 2,
#   quantity: 1,
#
# )
# CartItem.create!(
#   customer_id: 1,
#   item_id: 3,
#   quantity: 4,
# )
# ShipAddress.create!(
#   customer_id: 1,
#   last_name: "赤羽の",
#   first_name: "諒さん",
#   post_code: "2222222",
#   address: "東京都 新宿区 新宿3丁目",
# )
# ShipAddress.create!(
#   customer_id: 1,
#   last_name: "羽の",
#   first_name: "諒",
#   post_code: "3333333",
#   address: "東京都 新宿区 新宿4丁目",
# )
# ShipAddress.create!(
#   customer_id: 3,
#   last_name: "赤羽の",
#   first_name: "諒さん",
#   post_code: "2222222",
#   address: "東京都 新宿区 新宿3丁目",
# )
