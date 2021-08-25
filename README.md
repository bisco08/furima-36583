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

| Column             | Type     | Options                  |
| ------------------ | ------   | -------------------------|
| nick_name          | string   | null: false              |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |  
| family_name        | string   | null: false              |
| first_name         | string   | null: false              |
| family_name_kana   | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |

## Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type      | Options          |
| ------------------ | ------    | -----------      |
| item_name          | string    | null: false      |
| content            | text      | null: false      |
| category_id        | integer   | null: false      | 
| condition_id       | integer   | null: false      |
| shipping_charge_id | integer   | null: false      |
| area_id            | integer   | null: false      |
| shipping_date_id   | integer   | null: false      |
| price              | integer   | null; false      |
| user               | references| foreign_key: true|

## Association

belongs_to :user
has_one    :purchase

## purchases テーブル

| Column             | Type      | Options          |
| ------------------ | ------    | -----------        
| user               | references| foreign_key: true|
| item               | references| foreign_key: true|

## Association

belongs_to :user
belongs_to :item
has_one    :address

## addresses テーブル

| Column             | Type      | Options          |
| ------------------ | ------    | -----------      |    
| postal_code        | string    | null: false      |
| area_id            | integer   | null: false      |
| municipality       | string    | null: false      |
| street_number      | string    | null: false      |
| building_name      | string    |                  |
| telephone_number   | string    | null: false      |
| purchase           | references| foreign_key: true|

## Association

belongs_to :purchase

