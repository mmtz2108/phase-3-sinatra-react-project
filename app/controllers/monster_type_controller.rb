class MonsterTypeController < ApplicationController
  
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
end