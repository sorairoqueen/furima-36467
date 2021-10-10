# README

## Users table
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| nickname           | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |
### Association
- has_many :orders

## Items table
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| itemName          | string     | null: false                    |
| price             | integer    | null: false                    |
| itemCategory      | references | null: false, foreign_key: true |
| itemStatus        | references | null: false, foreign_key: true |
| feeResp           | references | null: false, foreign_key: true |
| source_prefecture | references | null: false, foreign_key: true |
| deliveryTerm      | references | null: false, foreign_key: true |
### Association
- has_one :order
- belongs_to :itemCategory
- belongs_to :itemStatus
- belongs_to :feeResp
- belongs_to :prefecture
- belongs_to :deliveryTerm

## ItemCategory table
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| itemCategoryName   | string  | null: false |
### Association
- has_many :items

## ItemStatus table
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| itemStatusName     | string  | null: false |
### Association
- has_many :items

## FeeResp table
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| feeRespName        | string  | null: false |
### Association
- has_many :items

## Prefecture table
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| prefectureName     | string  | null: false |
### Association
- has_many :items

## DeliveryTerm table
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| deliveryTermName   | string  | null: false |
### Association
- has_many :items

## Orders table
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |
| order_status        | string     | null: false                    |
| card_number         | integer    | null: false                    |
| card_expirymonth    | integer    | null: false                    |
| card_expiryyear     | integer    | null: false                    |
| card_cvc            | string     | null: false                    |
### Association
- belongs_to :User
- belongs_to :Item
- has_one :DeliveryAddress

## DeliveryAddress table
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| delivery_postalcode | string     | null: false                    |
| delivery_prefecture | string     | null: false                    |
| delivery_city       | string     | null: false                    |
| delivery_block      | string     | null: false                    |
| delivery_building   | string     | null: true                     |
| orderer_phone_num   | string     | null: false                    |
### Association
- belongs_to :Order
