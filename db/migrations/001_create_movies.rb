Sequel.migration do
  change do
    create_table :movies do
      primary_key :id
      column :external_id, :integer, null: false, unique: true
      column :title, :string, null: false
      column :image, :string, null: false
      column :release_year, :string, null: false
    end
  end
end
