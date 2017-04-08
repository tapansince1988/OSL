class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users do |t|
        t.string :name
        t.string :email
        t.string :password_digest
        t.timestamps
    end
    AdminUser.create :name => "Test User", :email => "test@test.com", :password => "123456"
  end
end
