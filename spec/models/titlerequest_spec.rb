require 'rails_helper'

describe TitleRequest, type: :model do
  it "has a valid factory" do
    titlerequest = build(:title_request)
    expect(titlerequest).to be_valid
  end

  it "validates the presence of a last name" do
    is_expected.to validate_presence_of(:LAST_NAME)
  end

  context "has no dates in the future" do
    it "has no file opened date in the future" do
      titlerequest = build(:title_request, FILEOPENED: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "file closed not in the future" do
      titlerequest = build(:title_request, CLOSE_DATE: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end
  end
end

