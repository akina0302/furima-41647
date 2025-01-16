## usersテーブル

|Column         |Type      |Options     |
|---------------|----------|------------|
|nickname       |string    |null: false |
|email          |string    |null: false,unique: true |
|encrypted_password |string    |null: false |
|first_name     |string    |null: false |
|last_name      |string    |null: false |
|first_name_furigana |string   |null:false |
|last_name_furigana |string    |null:false |
|birth_ date    |date    |null: false |

### Association
- has_many: items
- has_many: purchases

## itemsテーブル

|Column         |Type      |Options     |
|---------------|----------|------------|
|item_name      |string    |null: false |
|description    |text      |null: false |
|category_id    |integer   |null: false |
|condition_id   |integer   |null: false |
|payment_id     |integer   |null:false  |
|prace_id       |integer   |null:false  |
|derivery_day_id|integer   |null: false |
|price          |integer   |null: false |
|user_id        |reference |foreign_key: true|

### Association
- has_one: purchase
- belongs_to:user

## addressesテーブル

|Column         |Type      |Options     |
|---------------|----------|------------|
|post_code      |string    |null: false |
|prefecture_id  |integer   |null: false |
|cities         |string    |null: false |
|housenumber    |string    |null: false |
|build          |string    |
|tel            |string    |null: false |
|purchase_id    |reference |foreign_key: true|

### Association
- belongs_to: purchase

## purchasesテーブル

|Column         |Type      |Options          |
|---------------|----------|------------|
|user_id        |reference |foreign_key: true|
|item_id        |reference |foreign_key: true|

### Association
- belongs_to:user
- has_one:address
- belongs_to:item

