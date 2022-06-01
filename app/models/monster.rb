class Monster < ActiveRecord::Base
    belongs_to :monster_type
    has_many :abilities
end