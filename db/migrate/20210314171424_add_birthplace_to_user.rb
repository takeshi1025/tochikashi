class AddBirthplaceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthplace, :integer
  end
end
