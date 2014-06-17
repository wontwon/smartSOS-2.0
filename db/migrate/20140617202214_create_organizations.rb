class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :phone, null: false
      t.text :description, null: false
      t.string :url

      t.timestamps
    end
  end
end
