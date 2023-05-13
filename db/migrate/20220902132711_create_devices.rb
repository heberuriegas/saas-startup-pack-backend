class CreateDevices < ActiveRecord::Migration[6.1]
  def up
    create_table :devices do |t|
      t.string :brand
      t.string :manufacturer
      t.string :device_model_name
      t.string :device_model_id
      t.integer :device_year_class
      t.decimal :total_memory
      t.string :os_name
      t.string :os_version
      t.integer :platform_api_level
      t.string :device_name
      t.string :exponent_push_token
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :devices, [:user_id, :exponent_push_token], unique: true
    add_index :devices, :deleted_at

    execute <<-SQL
      alter table devices
        add constraint devices_user_exponent_push_token_constraint unique (user_id, exponent_push_token);
    SQL
  end

  def down
    drop_table :devices 
  end
end
