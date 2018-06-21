# README

test

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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|varchar|null: false|
|room_number|integer|null: false|
|e-mail|varchar|
|image|text|
add_index :users, [:name, :room_number], unique: true

### Association
- has_many :clips
- has_many :likes
- has_many :comments
- has_many :folder_clips, dependent: :destroy
- has_many :folders
- has_many :tag_clips
- has_one :profile
- has_one :count
- has_many :followers
- has_many :follows
- validates :name, length: {minimun: 3 maximum: 10}, presence: true
- validates :password, length {minimu: 3 maximum: 10}, presenve: true


## clipsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|image|text|null: false|
|likes_count|integer|
add_index :clips, [:user, :image]

### Association
- belongs_to :user, counter_cache: :clips_count
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :folder_clips, dependent: :destroy
- has_many :folders, through: :folder_clip
- has_many :main_tag, thorugh: :tag_clip
- has_many :sub_tag, thorugh: :tag_clip
- has_many :tag_clips, dependent: :destroy
- has_many :item_tag, thorugh: :itemtag_clip
- has_many :itemtag_clips, dependent: :destroy
- validates :image, presence: true


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|clip|references|null: false, foreign_key: true|
|text|text|
### Association
- belongs_to :user
- has_many :clips


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|clip|references|null: false, foreign_key: true|

### Association
- belongs_to :user, counter_cache: :likes_count
- belongs_to :clips, counter_cache: :likes_count


## foldersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|

### Association
- belongs_to :user, counter_cache: :folders_count
- has_many :clips, through: :folder_clip
- has_many :folder_clips


## folder_clipsテーブル

|Column|Type|Options|
|------|----|-------|
|folder|references|null: false, foreign_key: true|
|clip|references|null: false, foreign_key: true|

### Association
- belongs_to :folder
- belongs_to :clip


## tag_clipsテーブル

|Column|Type|Options|
|------|----|-------|
|clip|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true, unique: true|
|main_tag|references|null: false, foreign_key: true|
|sub_tag|references|null: false, foreign_key: true|
add_index :tag_clips [:user,:main_tag,:sub_tag]

### Association
- belongs_to :clip
_ belongs_to :user, counter_cache: :tags_count
- belongs_to :main_tag
- belongs_to :sub_tag


## main_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :tag_clips, dependent: :destroy
- has_many :clips, thorugh: :tag_clip


## sub_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :tag_clips, dependent: :destroy
- has_many :clips, thorugh: :tag_clip


## itemtag_clipsテーブル

|Column|Type|Options|
|------|----|-------|
|clip|references|null: false, foreign_key: true|
|item_tag|references|null: false, foreign_key: true|

### Association
- belongs_to :clip
- belongs_to :item_tag


## item_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :itemtag_clips, dependent: :destroy
- has_many :clips, thorugh: :itemtag_clip


## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true, unique: true|
|country|references|foreign_key: true|
|religion|references|foreign_key: true|
|style|references|foreign_key: true|
|job|references|foreign_key: true|
|gender|references|foreign_key: true|
|year|references|foreign_key: true|
|layout|references|foreign_key: true|
|area|string|
|website|varchar|
|introduction|text|

### Association
- belongs_to :user
<!-- country,religion,style,job,gender,year,layout,areaはenumを使用。日本語にする場合はenum_helpのjemを使用 -->
<!-- countryとreligionはgemを使う -->


## countsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|clips_count|integer|
|follows_count|integer|
|followers_count|integer|
|likes_count|integer|
|tags_count|integer|
|folders_count|integer|

### Association
- belongs_to :user


## followersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, counter_cache: :follows_count


## followsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, counter_cache: :follows_count
