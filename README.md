# README

## users table
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| nickname           | string  | null: false               |
| birthday           | date    | null: false               |
### Association
- has_many :orders
- has_many :items


## items table
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| price            | integer    | null: false                    |
| item_category_id | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| fee_resp_id      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_term_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| content          | string     | null: false                    |

### Association
- has_one :order
- belongs_to :user


## orders table
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address


## delivery_addresses table
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| delivery_postalcode | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_city       | string     | null: false                    |
| delivery_block      | string     | null: false                    |
| delivery_building   | string     |                                |
| orderer_phone_num   | string     | null: false                    |
### Association
- belongs_to :order
