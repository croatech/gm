require 'pg'

Sequel.migration do
  change do
    create_table :games do
      primary_key :id
      column :user_id, :integer, null: false, foreign_key: true
      column :active, :boolean, null: false, default: true
      column :score, :integer, null: false, default: 0
    end
  end
end
