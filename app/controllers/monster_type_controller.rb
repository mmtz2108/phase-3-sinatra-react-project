class MonsterTypeController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    get "/monster-types" do
        MonsterType.list_monster_types.to_json
      end

      get "/monster-types/:id" do
        MonsterType.get_monster_type(params[:id]).to_json
      end

      post "/monsters-types" do
        request.body.rewind
        body = JSON.parse(request.body.read)
        MonsterType.create_monster_type(body["name"], body["description"]).to_json
      end
end