class SpicesController < ApplicationController


    # GET /spices: return an array of all spices
    def index
        spices = Spice.all
        render json: spices
    end


    # POST /spices: create a new spice
    def create
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end

    # PATCH /spices/:id: update an existing spice
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted
        else
            render json: { error: "no spice for YOU"}, status: :not_found
        end
    end



    # DELETE /spices/:id: delete an existing spice

    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        end
    end


    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find_by(id: params[:id])
    end

end