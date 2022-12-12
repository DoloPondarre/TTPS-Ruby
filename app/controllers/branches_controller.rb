class BranchesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /branches or /branches.json
  def index
    @branches = Branch.all
  end

  # GET /branches/1 or /branches/1.json
  def show
  end

  # GET /branches/new
  def new
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches or /branches.json
  def create

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branch_url(@branch), notice: "Branch was successfully created." }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1 or /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branch_url(@branch), notice: "Branch was successfully updated." }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1 or /branches/1.json
  def destroy
    if Shift.find_by(branch_id: @branch.id).nil?
      @branch.destroy

      respond_to do |format|
        format.html { redirect_to branches_url, notice: "Branch was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to branch_url(@branch), notice:  "Esta sucursal no puede ser eliminada, tiene turnos asociados."}
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def branch_params
      params.require(:branch).permit(:name, :direction, :telephone)
    end
end
