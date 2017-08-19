class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :website
      t.string :username
      t.string :password
      t.string :tag
      

      t.timestamps null: false
    end
  end
end
