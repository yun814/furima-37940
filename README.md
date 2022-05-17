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
- has_many :items, foreign_key: :seller_id
- has_many :oders, foreign_key: :buyer_id

## itemsテーブル

| Colum           | Type       | Option                         |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | text       | null: false                    |
| condition       | text       | null: false                    |
| delivery_charge | text       | null: false                    |
| ship_from       | string     | null: false                    |
| shipping_day    | text       | null: false                    |
| price           | integer    | null: false                    |
| seller          | references | null: false, foreign_key: true |

### Association
- has_one :oder
- belongs_to :seller, class_name: 'User', foreign_key: :seller_id

## odersテーブル

| Colum  | Type       | Option                         |
|--------|------------|--------------------------------|
| item   | references | null: false, foreign_key: true |
| buyer  | references | null: false, foreign_key: true |

### Association
- has_one :shipping_information
- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id

## shipping_informationsテーブル

| Colum            | Type       | Option                         |
|------------------|------------|--------------------------------|
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |

### Association
- belongs_to :oder