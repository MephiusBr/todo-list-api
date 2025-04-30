require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    context "when it's valid" do
      let(:task) { build(:task) }

      it "has a unique name" do
        expect(task).to be_valid
      end
    end

    context "when it's invalid" do
      let!(:persisted_task) { create(:task, name: "new task") }
      let(:task) { build(:task, name: "new task") }

      it "doesn't have a unique name" do
        expect(task).to be_invalid
      end
    end
  end
end
