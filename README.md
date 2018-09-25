# Structure of DataBase

## user
### table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|profile|text||

### association
- has_many :coordinates
### plan
- use instagram API

## coordinates
### table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|gender_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :gender
- has_many :color-tags, through: coordinate_color-tags
- has_many :category-tags, through: coordinate_category-tags
