require 'rails_helper'

RSpec.describe Design, type: :model do
 
	before(:each) do
		@design = Design.create!(name: "Brillaint Scuba Bear Design", thumbnail_url: "https://s3.amazonaws.com/spoonflower/public/design_thumbnails/0209/4495/rrrrrrrgeo_bear_cream_shop_thumb.png")
	end

	describe "create design" do
		it "should have one design created after creation" do
			expect(Design.all.count).to eq(1)
		end
	end

	describe "validations" do
		it "should not let a design be created with a name" do
			@design.name = nil
			expect(@design).to_not be_valid
		end
	end
end

