# Structure of DataBase

## user
### table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true, unique: true|
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
|image|string|null: false, index: true|
|gender_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :gender
- has_many :category-tags, through: coordinate_category-tags

## genders
### table
|Column|Type|Options|
|------|----|-------|
|gender|boolean||

### association
- has_many :coordinates


## category-tags
### table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|color|string|null: false, index: true|

[:name, :color], unique: true

### association
- has_many :coordinates, through: coordinate_category-tags

## coordinate_category-tags
### table
|Column|Type|Options|
|------|----|-------|
|coordinate_id|references|null: false, foreign_key: true|
|category-tag_id|references|null: false, foreign_key: true|

### association
- belongs_to :coordinate
- belongs_to :category-tag
