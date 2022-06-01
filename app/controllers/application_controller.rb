class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/monster-types" do
    MonsterType.all.to_json
  end

  get "/monster-types/:id" do
    MonsterType.find(params[:id]).to_json
  end

  post "/monsters-types" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    type = MonsterType.create(name: body["name"], description: body["description"])
    type.to_json
  end

  get "/monsters" do
    monster_type = params[:monster_type]
    #name = params[:name]
    if monster_type != nil
    Monster.where(monster_type_id: monster_type).to_json 
    else 
      Monster.all.to_json
    end
  end

  post "/monsters" do
    request.body.rewind
    body = JSON.parse(request.body.read)
    monster = Monster.create(name: body["name"], description: body["description"], monster_type_id: body["monsterType"])
    monster.to_json
  end
  
  get "/monsters/:id" do
    Monster.find(params[:id]).to_json(include: [:monster_type, :abilities] )
  end

  get "/abilities" do
    Ability.all.to_json
  end

  get "/abilities/:id" do
    Ability.find(params[:id]).to_json
  end

end
