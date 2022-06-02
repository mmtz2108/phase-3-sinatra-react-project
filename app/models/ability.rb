class Ability < ActiveRecord::Base
belongs_to :monster

def self.list_abilities
    self.all
end

def self.get_ability(id)
    self.find(id)
end
end