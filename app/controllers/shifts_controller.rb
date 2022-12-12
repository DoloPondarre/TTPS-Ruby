class ShiftsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /shifts or /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts or /shifts.json
  def create
    @shift.client_id = @current_user.id
    respond_to do |format|
      if @shift.save
        format.html { redirect_to shift_url(@shift), notice: "Shift was successfully created." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    if @current_user&.staff?
      @shift.state = 'Atendido'
      @shift.staff_id = @current_user.id
      @shift.comment = 'Fixed' if @shift.comment.blank?
    end
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to shift_url(@shift), notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy

    respond_to do |format|
      format.html { redirect_to shifts_url, notice: "Shift was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:date, :time, :reason, :state, :comment, :client_id, :staff_id, :branch_id)
    end
end
