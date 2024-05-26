# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ------     | ----------- |
| name                   | string     | null: false |
| description            | text       | null: false |
| price                  | integer    | null: false |
| category_id            | integer    | null: false |
| condition_id           | integer    | null: false |
| sender_address_id      | integer    | null: false |
| shipping_fee_burden_id | integer    | null: false |
| shipping_days_id       | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| prefecture_id   | integer    | null: false |
| postal_code     | string     | null: false |
| city            | string     | null: false |
| address_line1   | string     | null: false |
| address_line2   | string     |             |
| phone_number    | string     | null: false |
| purchase_record | references | null: false, foreign_key: true |



### Association

- belongs_to :purchase_record