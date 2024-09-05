class RegistersController < ApplicationController
  def index
    @registers = Register.all
  end

  def new
    @register = Register.new
  end

  def edit
    set_register
  end

  def show
    set_register
  end

  def create
    @register = Register.new(register_params)
    respond_to do |format|
      if @register.save
        format.html { redirect_to registers_url, notice: "Registration complete! Your details are now saved." }
        format.json { render :index, status: :created, location: @register }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @register = Register.find(params[:id])
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to registers_url, notice: "#{@register.first_name} #{@register.last_name}'s Registration details is updated." }
        format.json { render :index, status: :ok, location: @register }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_register
    @register.destroy!

    respond_to do |format|
      format.html { redirect_to registers_url, notice: "#{@register.first_name} #{@register.last_name}'s Registration deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_register
    @register = Register.find(params[:id])
  end

  def register_params
    params.require(:register).permit(:first_name, :last_name, :b_date, :gender, :email, :phone_num, :subject)
  end
end
