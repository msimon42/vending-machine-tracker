require 'rails_helper'

RSpec.describe 'when I visit a machine show page', type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @machine_1 = @owner.machines.create(location: "Don's Mixed Drinks")
    @machine_2 = @owner.machines.create(location: "Turing Basement")

    @snack_1 = @machine_1.snacks.create(name: 'Chocolate Delight', price: 50.00)
    @snack_2 = @machine_1.snacks.create(name: 'Candy Surprise', price: 25.00)
    @snack_3 = @machine_2.snacks.create(name: 'Mr. Waffle', price: 28.00)
  end

  it 'can view all snacks belonging to machine' do
    visit "/machines/#{@machine_1.id}"

    expect(page).to have_content('Chocolate Delight')
    expect(page).to have_content('Candy Surprise')
    expect(page).to not_have_content('Mr. Waffle')

    expect(page).to have_content(@machine_1.avg_price)
  end
end
