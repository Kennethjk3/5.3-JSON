class Athlete < ActiveRecord::Base
  validates :nome, :nascita, :sport, :squadra, :altezza, :peso, :retired, presence: true
  # validates_date :nascita
end
