class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    
    # only include certain keys
    # render json: cheeses, only: [:id, :name, :price, :is_best_seller]

    # alternatively use except: to exclude certain fields
    render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  # def show
  #   cheese = Cheese.find_by(id: params[:id])
  #   render json: {
  #     id: cheese.id,
  #     name: cheese.name,
  #     price: cheese.price,
  #     is_best_seller: cheese.is_best_seller
  #   }
  # end
  

  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese,  methods: [:summary], except: [:created_at, :updated_at]
    else
      # status: :not_found will produce a 404 status code
      render json: {error: 'Cheese not found'}, status: :not_found
    end
  end
  
end
