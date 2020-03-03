class CreateContent < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.text :body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
