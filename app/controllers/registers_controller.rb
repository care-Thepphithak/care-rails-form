class RegistersController < ApplicationController
  def index
    @registers = Register.all
  end

  def new
    @register = Register.new
  end

  def edit
  end

  def update
  end

  def destory
  end
end
