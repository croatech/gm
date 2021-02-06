Sequel.migration do
  change do
    create_table :movies do
      primary_key :id
      column :external_id, Integer, null: false, unique: true
      column :title, String, null: false
      column :image, String, null: false
    end
  end
end
