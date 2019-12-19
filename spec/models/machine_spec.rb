require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'methods' do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @machine_1 = @owner.machines.create(location: "Don's Mixed Drinks")
      @machine_2 = @owner.machines.create(location: "Turing Basement")

      @snack_1 = @machine_1.snacks.create(name: 'Chocolate Delight', price: 50.00)
      @snack_2 = @machine_1.snacks.create(name: 'Candy Surprise', price: 25.00)
      @snack_3 = @machine_2.snacks.create(name: 'Mr. Waffle', price: 28.00)
    end

    it 'can get avg price' do
      expect(@machine_1.avg_price).to eq(37.50)
    end


  end
end
