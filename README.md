# README

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_day       | date   | null: false |
### Association
- has_many :items
- has_many  :purchases


## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| image        | integer    | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| postage      | integer    | null: false                    |
| prefecture   | integer    | null: false                    |
| handing_time | integer    | null: false                    |
| price        | integer    | null: false                    |
### Association
- has_one    :purchase
- belongs_to :user

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
### Association
- has_one    :address
- belongs_to :user
- belongs_to :item

##  addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false, foreign_key: true |
| city           | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases