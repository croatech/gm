Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      column :mac_address, :string, null: false, unique: true
    end
  end
end
