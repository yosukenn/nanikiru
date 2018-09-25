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
