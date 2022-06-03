class MonsterAbilityController < ApplicationController
   
    get "/abilities" do
        Ability.list_abilities.to_json
    end
    
    get "/abilities/:id" do
      Ability.get_ability(params[:id]).to_json
    end
end