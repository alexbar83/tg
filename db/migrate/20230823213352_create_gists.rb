class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|

      t.timestamps
    end
  end
end
