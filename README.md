# usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| nickname        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |

# Association

- has_one  :member
- has_many :payments
- has_many :mails
- has_many :storages
- has_many :chat_rooms, through: :room_users
- has_many :chat_messages

# membersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | text       | null: false                    |
| part_id | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# paymentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# mailsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# storagesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

# Association

- belongs_to :user

# chat_roomsテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| room_name | string | null: false | 

# Association

- has_many :users, through: :room_users

# room_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| room   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :chat_room

# chat_messagesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| message_content | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| room            | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :chat_room