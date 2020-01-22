class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string   :name, null: false
      t.text     :summary
      t.datetime :limit
      t.timestamps
    end
  end
end
