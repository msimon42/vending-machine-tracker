RSpec.describe 'when I visit a snack show page', type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @machine_1 = @owner.machines.create(location: "Don's Mixed Drinks")
    @machine_2 = @owner.machines.create(location: "Turing Basement")

    @snack_1 = @machine_1.snacks.create(name: 'Chocolate Delight', price: 50.00)
    @snack_2 = @machine_1.snacks.create(name: 'Candy Surprise', price: 25.00)
    @snack_3 = @machine_2.snacks.create(name: 'Mr. Waffle', price: 28.00)
    @machine_2.snacks << @snack_1

    visit "/snacks/#{@snack_1.id}"
  end

  it 'can see snack info' do
    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@snack_1.price)
  end

  it 'can see machine info' do
    expect(page).to have_content("#{@machine_1.location} (#{@machine_1.snack_count} kinds of snacks, avg price: #{@machine_1.avg_price})")
    expect(page).to have_content("#{@machine_2.location} (#{@machine_2.snack_count} kinds of snacks, avg price: #{@machine_2.avg_price})")
  end
end
