# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| first_name  | string  | null: false |
| last_name   | string  | null: false |
| birthday_id | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| description | string  | null: false |
| categroy_id | integer | null: false |
| status_id   | integer | null: false |
| burden_id   | integer | null: false |
| area_id     | integer | null: false |
| days_id     | integer | null: false |
| price       | integer | null: false |

### Association

- belongs_to: users
- has_one: purchases
- has_one: delivery_addreses

## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association

- belongs_to: users
- belongs_to: items
- has_one: delivery_addreses

## delivery_addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| zip_cpde      | integer | null: false |
| perfecture    | string  | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

- belongs_to: purchases
- belongs_to: items