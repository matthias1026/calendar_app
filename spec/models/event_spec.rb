require 'spec_helper'

describe Event do
	
	before do
		@event = Event.new(name: "Example Event", start_time: DateTime.current(), 
			description: "Ex Desc")
	end

	subject { @event }

	it { should respond_to(:name) }
	it { should respond_to(:start_time) }
	it { should respond_to(:description) }

	it { should be_valid }

	describe "when name is not present" do
		before { @event.name = " " }
		it { should_not be_valid }
	end

	describe "when description is not present" do
		before { @event.description = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @event.name = "a"*51 }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			event_with_same_name = @event.dup
			event_with_same_name.name = @event.name.upcase
			event_with_same_name.save
		end

		it { should_not be_valid }
	end
end
