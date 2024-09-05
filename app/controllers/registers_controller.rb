class RegistersController < ApplicationController
  def index
    @registers = Register.all
  end

  def new
    @register = Register.new
  end

  def edit
  end

  def show
    @register = Register.find(params[:id])
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
  end

  def destory
  end
end

def register_params
  params.require(:register).permit(:first_name, :last_name, :b_date, :gender, :email, :phone_num, :subject)
end
