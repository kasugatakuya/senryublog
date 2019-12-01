class CreateIines < ActiveRecord::Migration[5.0]
  def change
    create_table :iines do |t|
      t.references :text, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
