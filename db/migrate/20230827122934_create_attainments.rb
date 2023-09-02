class CreateAttainments < ActiveRecord::Migration[6.1]
  def change
     create_table :attainments do |t|
      t.references :badge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
