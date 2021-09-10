# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| password           | string  | null: false |
| nickname           | string  | null: false |
| kanji_name_first   | string  | null: false |
| kanji_name_last    | string  | null: false |
| kana_name_first    | string  | null: false |
| kana_name_last     | string  | null: false |
| birth_year_id      | integer | null: false |
| birth_month _id    | integer | null: false |
| birthday_id        | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| image              |         ActiveStorage                          |
| title              | string        | null: false                    |
| item_description   | text          | null: false                    |
| category_id        | integer       | null: false                    |
| status_id          | integer       | null: false                    |
| load_id            | integer       | null: false                    |
| area_id            | integer       | null: false                    |
| delivery_id        | integer       | null: false                    |
| selling_price      | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |

### Association

- has_one :orders
- belongs_to :user

## comments テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| text               | text          | null: false                    |
| item               | references    | null: false, foreign_key: true |
| user               | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| address     | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| Postal_code  | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| city         | integer    | null: false                    |
| number       | integer    | null: false                    |
| building     | text       |                                |
| phone-num    | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :order