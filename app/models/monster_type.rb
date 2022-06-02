class MonsterType < ActiveRecord::Base
    has_many :monsters

    def self.list_monster_types
        self.all
    end

    def self.get_monster_type(id)
        self.find(id)
    end

    def self.create_monster_type(name, description)
        self.create(name: name, description: description)
    end

    def self.delete_monster_type(id)
        self.destroy(id)
    end

    def self.update_monster_type(name, description, id)
        self.get_monster_type(id).update(name: name, description: description)
        self.get_monster_type(id)
    end

    def self.patch_monster_type(name, description, id)
        monster_type = self.get_monster_type(id)
        if name != nil
            monster_type.name = name
        end
        if description != nil
            monster_type.description = description
        end
        monster_type.save
        monster_type
    end
end