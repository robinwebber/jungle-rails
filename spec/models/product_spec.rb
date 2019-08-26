require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    cat = Category.new(name: "fun")
    subject{described_class.new(name: "testName", price_cents: 1105, quantity: 10, category: cat)}
    it "is not valid if fields are blank" do
      expect(subject).to be_valid
    end

    it "validates name as being present" do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].first).to eq"can't be blank"
    end

    it "validates price as being present" do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors[:price_cents].first).to eq"is not a number"
    end

    it "validates quantity as being present" do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors[:quantity].first).to eq"can't be blank"
    end

    it "validates a category has been assigned" do
      subject.category = nil
      subject.valid?
      expect(subject.errors[:category].first).to eq"can't be blank"
    end
      
  end
end
