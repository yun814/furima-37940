# テーブル設計

## usersテーブル

| Colum              | Type   | Option                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Colum              | Type       | Option                         |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| ship_from_id       | integer    | null: false                    |
| shipping_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user

## ordersテーブル

| Colum | Type       | Option                         |
|-------|------------|--------------------------------|
| item  | references | null: false, foreign_key: true |
| user  | references | null: false, foreign_key: true |

### Association
- has_one :shipping_information
- belongs_to :item
- belongs_to :user

## addressesテーブル

| Colum            | Type       | Option                         |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order