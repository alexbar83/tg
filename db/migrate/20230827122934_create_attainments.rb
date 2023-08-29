class CreateAttainments < ActiveRecord::Migration[6.1]
  def change
    create_table :attainments do |t|

      t.timestamps
    end
  end
end
