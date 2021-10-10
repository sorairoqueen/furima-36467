# README

## users table
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| nickname           | string  | null: false               |
| birthday           | date    | null: false               |
### Association
- has_many :orders
- has_many :items, through: :orders


## items table
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| price             | integer    | null: false                    |
| item_category     | integer    | null: false, foreign_key: true |
| item_status       | integer    | null: false, foreign_key: true |
| fee_resp          | integer    | null: false, foreign_key: true |
| source_prefecture | integer    | null: false, foreign_key: true |
| delivery_term     | integer    | null: false, foreign_key: true |
### Association
- has_one :order
- has_one :user, through: :user


## orders table
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :deliveryaddress


## deliveryaddress table
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| order                  | references | null: false, foreign_key: true |
| delivery_postalcode    | string     | null: false                    |
| delivery_prefecture_id | integer    | null: false                    |
| delivery_city          | string     | null: false                    |
| delivery_block         | string     | null: false                    |
| delivery_building      | string     |                                |
| orderer_phone_num      | string     | null: false                    |
### Association
- belongs_to : order
