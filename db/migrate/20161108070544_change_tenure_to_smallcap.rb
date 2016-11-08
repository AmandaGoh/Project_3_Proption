class ChangeTenureToSmallcap < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :Tenure, :tenure
  end
end
