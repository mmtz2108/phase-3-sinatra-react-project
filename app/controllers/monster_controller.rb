class MonsterController < ApplicationController
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
end