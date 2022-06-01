puts "🌱 Seeding spices..."

puts "Creating Monster Types..."
dragon = MonsterType.create(name: "Dragon", description: "A dragon is a reptilian creature, usually winged, often having supernatural abilities")
undead = MonsterType.create(name: "Undead", description: "An undead is a once-living creature animated by spiritual or supernatural forces")
giant = MonsterType.create(name: "Giant", description: "A giant is a humanoid-shaped creature of great strength and size")

puts "Creating Ablities..."

lb = Ability.new(name: "Lightning Breath", description: "A burst of lightning", attack_power: 100)
fb = Ability.new(name: "Fire Breath", description: "A stream of hellfire", attack_power: 95)
bite = Ability.new(name: "Bite", description: "A painful bite", attack_power: 30)
dl = Ability.new(name: "Disrupt Life", description: "A burst of unholy energy", attack_power: 70)
ga = Ability.new(name: "Greataxe", description: "A swing from a giant's axe", attack_power: 50)

puts "Creating Monsters..."
Monster.create(name: "Adult Blue Dragon", description: "Huge dragon, lawful evil", monster_type: dragon, abilities: [lb])
Monster.create(name: "Adult Gold Dragon", description: "Huge dragon, lawful good", monster_type: dragon, abilities: [fb])
Monster.create(name: "Ghoul", description: "Medium undead, chaotic evil", monster_type: undead, abilities: [bite])
Monster.create(name: "Lich", description: "Medium undead, any evil alignment", monster_type: undead, abilities: [dl])
Monster.create(name: "Frost Giant", description: "Huge giant, neutral evil", monster_type: giant, abilities: [ga])



puts "✅ Done seeding!"
