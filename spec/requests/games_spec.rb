require 'rails_helper'

describe "Games API", type: :request do
  describe "GET /games" do
    it 'return all Games' do
      game1 = FactoryBot.create(:game, result: "Ben win")
      FactoryBot.create(:move, name: "ben", move: "paper", game_id: game1.id )
      FactoryBot.create(:move, name: "bot", move: "rock", game_id: game1.id )
  
      game2 = FactoryBot.create(:game, result: "Ben lose")
      FactoryBot.create(:move, name: "ben", move: "paper", game_id: game2.id )
      FactoryBot.create(:move, name: "bot", move: "scissor", game_id: game2.id )
  
      get '/api/v1/games'
  
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "POST /games" do
    it 'create a new games' do
      expect{
        post '/api/v1/games', params: {name: "ben", move: "paper"}
    }.to change { Game.count}.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end
  
  
end
