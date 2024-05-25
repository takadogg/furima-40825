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

| Column            | Type       | Options     |
| ----------------- | ------     | ----------- |
| name              | string     | null: false |
| description       | text       | null: false |
| price             | integer    | null: false |
| image             | string     | null: false |
| category          | string     | null: false |
| condition         | string     | null: false |
| sender_address    | string     | null: false |
| seller            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| transaction_date    | datetime   | null: false |
| item                | references | null: false, foreign_key: true |
| buyer               | references | null: false, foreign_key: true |
| sipping_address     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :addresses

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| city          | string     | null: false |
| address_line1 | string     | null: false |
| address_line2 | string     |             |
| phone_number  | string     | null: false |


### Association

- belongs_to :purchase_record