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

# テーブル設計

## users テーブル

| Column             | Type     | Options          |
| ------------------ | ------   | -----------      |
| nick_name          | string   | null: false      |
| email              | string   | null: false      |
| encrypted_password | string   | null: false      |   
| family_name        | string   | null: false      |
| first_name         | string   | null: false      |
| family_name_kana   | string   | null: false      |
| first_name_kana    | string   | null: false      |
| birthday           | string   | null: false      |

## Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type      | Options          |
| ------------------ | ------    | -----------      |    
| item_name          | string    | null: false      |
| content            | text      | null: false      |
| category           | string    | null: false      |
| condition          | string    | null: false      |   
| shipping_charges   | string    | null: false      |
| area               | string    | null: false      |
| shipping_date      | string    | null: false      |
| price              | string    | null: false      |
| user_id            | references| foreign_key: true|

## Association

belongs_to :user
has_one    :purchases

## purchases テーブル

| Column             | Type      | Options          |
| ------------------ | ------    | -----------      |    
| user_id            | references| foreign_key: true|
| item_id            | references| foreign_key: true|

## Association

belongs_to :user
belongs_to :item
has_one    :address

## addresses テーブル

| Column             | Type      | Options          |
| ------------------ | ------    | -----------      |    
| postal_cord        | string    | null: false      |
| prefectures        | string    | null: false      |
| municipality       | string    | null: false      |
| street_number      | string    | null: false      |   
| building_name      | string    | null: false      |
| telephone_number   | string    | null: false      |
| purchase_id        | references| foreign_key: true|

## Association

belongs_to :purchase

