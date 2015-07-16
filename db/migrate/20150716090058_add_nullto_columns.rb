class AddNulltoColumns < ActiveRecord::Migration
  def change
    change_column_null(:athletes, :altezza, false)
    change_column_null(:athletes, :peso, false)
  end
end
