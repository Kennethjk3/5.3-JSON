class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :nome, null: false
      t.date :nascita, null: false
      t.string :sport, null: false
      t.string :squadra, null: false, default: "Free Agent"
      t.string :altezza
      t.string :peso
      t.boolean :retired, default: false


      t.timestamps null: false
    end
  end
end
