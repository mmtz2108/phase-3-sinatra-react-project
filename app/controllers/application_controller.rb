class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/monster-types" do
    MonsterType.list_monster_types.to_json
  end

  get "/monster-types/:id" do
    MonsterType.get_monster_type(params[:id]).to_json
  end

  post "/monster-types" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    MonsterType.create_monster_type(body["name"], body["description"]).to_json
  end

  delete "/monster-types/:id" do
    MonsterType.delete_monster_type(params[:id])
    204
  end

  put "/monster-types/:id" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    MonsterType.update_monster_type(body["name"], body["description"], params[:id]).to_json
  end

  patch "/monster-types/:id" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    MonsterType.patch_monster_type(body["name"], body["description"], params[:id]).to_json
  end

  get "/monsters" do
    monster_type = params[:monster_type]
    name = params[:name]
    if name != nil
    Monster.search_monsters(name, monster_type).to_json 
    else 
      Monster.list_monsters.to_json
    end
  end

  post "/monsters" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    Monster.create_monster(body["name"], body["description"], body["monsterType"]).to_json
    
  end
  
  get "/monsters/:id" do
    Monster.get_monster(params[:id]).to_json(include: [:monster_type, :abilities] )
  end

  delete "/monsters/:id" do
    Monster.delete_monster(params[:id])
    204
  end

  put "/monsters/:id" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    Monster.update_monster(body["name"], body["description"], params[:id], body["monsterType"]).to_json
  end

  patch "/monsters/:id" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    Monster.patch_monster(body["name"], body["description"], params[:id], body["monsterType"]).to_json
  end

  get "/abilities" do
    Ability.list_abilities.to_json
  end

  get "/abilities/:id" do
    Ability.get_ability(params[:id]).to_json
  end

end
