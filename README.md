# README

* Name
  TI-ME

* Ruby version
  2.5.1

* Database creation
  ## Usersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |nickname|string|null: false|
  |password|string|null: false|
  |avatar|text||
  |profile|text||
  |email|string|null: false, unique:true|
  ### Association
  - has_many :team_members
  - has_many :teams, through: :team_members
  - has_many :task_members
  - has_many :tasks, through: :task_members
  ## Teamsテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |summary|text||
  |limit|datetime||
  ### Association
  - has_many :team_members
  - has_many :users, through : :team_members
  - has_many :tasks
  ## Team_membersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |user_id|references|foreign_key: true|
  |team_id|references|foreign_key: true|
  ### Association
  - belongs_to :user
  - belongs_to :team
  ## Tasksテーブル
  |Column|Type|Options|
  |------|----|-------|
  |name|string|null: false|
  |summary|text||
  |limit|datetime||
  |team_id|references|null: false, foreign_key: true|
  ### Association
  - belongs_to :team
  - has_many :task_members
  - has_many :users, through: :task_members
  - has_many :time_tracks
  - has_many :categories
  ## Task_membersテーブル
  |Column|Type|Options|
  |------|----|-------|
  |comment|text||
  |user_id|references|null: false, foreign_key: true|
  |task_id|references|null: false, foreign_key: true|
  ### Association
  - belongs_to :user
  - belongs_to :task
  ## Categoriesテーブル
  |Column|Type|Options|
  |------|----|-------|
  |janre|string|null: false|
  |task_id|references|foreign_key: true|
  ### Association
  - belongs_to :task
  ## Time_tracksテーブル
  |Column|Type|Options|
  |------|----|-------|
  |start_time|datetime||
  |stop_time|datetime||
  |task_done_time|datetime||
  |task_id|references|null: false, foreign_key: true|
  ### Association
  - belongs_to :task