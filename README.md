# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| kanji_name_first   | string  | null: false |
| kanji_name_last    | string  | null: false |
| kana_name_first    | string  | null: false |
| kana_name_last     | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
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

- has_one :order
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
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| area_id      | integer    | null: false                    |
| city         | string     | null: false                    |
| number       | string     | null: false                    |
| building     | text       |                                |
| phone-num    | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order