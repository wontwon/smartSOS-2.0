class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.belongs_to :organization
      t.string :name, null: false
      t.text :description, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
