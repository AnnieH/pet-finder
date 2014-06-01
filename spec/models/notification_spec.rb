require 'spec_helper'

describe Notification do

	describe '::maybe' do 
	
		before do
			@notification = Notification.create(species: 'dog')
		end

		it "will return matching conditions" do
			Notification.maybe(:species, 'dog').should include @notification
		end

		it "will return nil conditions" do
			Notification.maybe(:color, 'brown').should include @notification
		end

		it "will not return non-matching conditions" do
			Notification.maybe(:species, 'cat').should_not include @notification
		end
	
	end

	describe '#contact' do 
	
		it "will be populated with the notification email and phone" do
			notification = described_class.new(email: 'test@email.com', phone: '123-456-7890')
			notification.contact.email.should eq 'test@email.com'
			notification.contact.phone.should eq '123-456-7890'
		end
	
	end
end