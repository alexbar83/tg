class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|

      t.timestamps
    end
  end
end
