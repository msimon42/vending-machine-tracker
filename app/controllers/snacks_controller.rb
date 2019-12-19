class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
    machines(@snack)
  end

  private

  def machines(snack)
    @machines = snack.machines
  end
end
