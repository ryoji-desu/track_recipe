module V1
    class Recipes < Grape::API
      resources :recipes do
        desc '全てのレシピを返す'
        get '' do
          @recipes = Recipe.all # 最後に評価された値がレスポンスとして返される
        end
  
        desc '特定のレシピを返す'
        params do
          requires :id, type: Integer
        end
        get '/:id' do
          @recipe = Recipe.find(params[:id])
        end
  
        desc 'レシピの作成'
        params do
          requires :title, type: String
          requires :making_time, type: String
          requires :serves, type: String
          requires :ingredients, type: String
          requires :cost, type: String
        end
        post '' do
          @recipe = Recipe.create(title: params[:title],making_time: params[:making_time],serves: params[:ingredients],ingredients: params[:ingredients],cost: params[:cost])
        end
        desc 'レシピの更新'
        params do
          requires :title, type: String
          requires :making_time, type: String
          requires :serves, type: String
          requires :ingredients, type: String
          requires :cost, type: String
          requires :id, type: Integer
        end
        patch '/:id' do
            @recipe = Recipe.find(params[:id])
            result = @recipe.update(title: params[:title],making_time: params[:making_time],serves: params[:ingredients],ingredients: params[:ingredients],cost: params[:cost])
        end
  
        desc 'Delete an author'
        params do
          requires :id, type: Integer
        end
        delete '/:id' do
          @recipe = Recipe.find(params[:id])
          @recipe.destroy
        end
      end
    end
  end