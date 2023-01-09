# usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| nickname        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |

# Association

- has_one  :member
- has_many :payments
- has_many :emails
- has_many :storages
- has_many :chat_rooms, through: :room_users
- has_many :chat_messages

# membersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| part_id       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# paymentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# emailsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| subject | string     | null: false                    |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# storagesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# roomsテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| room_name | string | null: false | 

# Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

# room_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| room   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :room

# messagesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| message_content | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| room            | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :room