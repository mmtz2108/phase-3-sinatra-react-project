class Monster < ActiveRecord::Base
    belongs_to :monster_type
    has_many :abilities

    def self.list_monsters
        self.all.map{|monster| {
            id: monster.id,
            name: monster.name,
            description: monster.description,
        monster_type: monster.monster_type}}
    end

    def self.search_monsters(name, type)
        query = self.where("name LIKE ?", "%#{name}%")
        if type != nil
            query = query.where(monster_type_id: type)
        end
        query
    end

    def self.get_monster(id)
        self.find(id)
    end

    def self.create_monster(name, description, monster_type_id)
        self.create(name: name, description: description, monster_type_id: monster_type_id)
    end

    def self.delete_monster(id)
        self.destroy(id)
    end

    def self.update_monster(name, description, id, monster_type_id)
        self.get_monster(id).update(name: name, description: description, monster_type_id: monster_type_id)
        self.get_monster(id)
    end

    def self.patch_monster(name, description, id, monster_type_id)
        monster = self.get_monster(id)
        if name != nil
            monster.name = name
        end
        if description != nil
            monster.description = description
        end
        if monster_type_id != nil
            monster.monster_type_id = monster_type_id
        end
        monster.save
        monster
    end
end