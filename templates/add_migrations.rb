def add_migrations

  Dir.glob('db/migrate/*_create_users.rb').each do |file_name|
    gsub_file file_name, "# t.integer  :sign_in_count", "t.integer  :sign_in_count"
    gsub_file file_name, "# t.datetime :current_sign_in_at", "t.datetime :current_sign_in_at"
    gsub_file file_name, "# t.datetime :last_sign_in_at", "t.datetime :last_sign_in_at"
    gsub_file file_name, "# t.inet     :current_sign_in_ip", "t.inet     :current_sign_in_ip"
    gsub_file file_name, "# t.inet     :last_sign_in_ip", "t.inet     :last_sign_in_ip"
    gsub_file file_name, "# t.string   :confirmation_token", "t.string   :confirmation_token"
    gsub_file file_name, "# t.datetime :confirmed_at", "t.datetime :confirmed_at"
    gsub_file file_name, "# t.datetime :confirmation_sent_at", "t.datetime :confirmation_sent_at"
    gsub_file file_name, "# t.string   :unconfirmed_email", "t.string   :unconfirmed_email"
    gsub_file file_name, "# add_index :users, :confirmation_token", "add_index :users, :confirmation_token"
  end

  # class AddManyFieldsToUsers < ActiveRecord::Migration[5.2]
  #   def change
  #     add_column :users, :first_name, :string
  #     add_index :users, :first_name
  #     add_column :users, :last_name, :string
  #     add_index :users, :last_name
  #     add_column :users, :phone_number, :string
  #     add_column :users, :admin, :boolean
  #     add_index :users, :admin
  #     add_column :users, :test, :boolean
  #     add_index :users, :test
  #     add_column :users, :company_name, :string
  #     add_index :users, :company_name
  #     add_column :users, :company_title, :string
  #     add_column :users, :profile_pic, :string
  #     add_column :users, :location, :string
  #     add_column :users, :last_active_at, :datetime
  #     add_column :users, :last_activity, :string
  #     add_column :users, :enabled, :boolean, default: true
  #     add_index :users, :enabled
  #   end
  # end

end
