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
    it "has no order recorded in the future" do
      titlerequest = build(:title_request, ORDER_RECD: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no file opened date in the future" do
      titlerequest = build(:title_request, FILEOPENED: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no title review in the future" do
      titlerequest = build(:title_request, TIT_REVIEW: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no commit out in the future" do
      titlerequest = build(:title_request, COMMIT_OUT: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no commit back in the future" do
      titlerequest = build(:title_request, COMMIT_BCK: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no commit ISS in the future" do
      titlerequest = build(:title_request, COMMIT_ISS: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "file closed not in the future" do
      titlerequest = build(:title_request, CLOSE_DATE: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no markup recorded in the future" do
      titlerequest = build(:title_request, MARKUP_RCD: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no rec pay fn in the future" do
      titlerequest = build(:title_request, REC_PAY_FN: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no rec pay w in the future" do
      titlerequest = build(:title_request, REC_PAY_W: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no rec pay tt in the future" do
      titlerequest = build(:title_request, REC_PAY_TT: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no rec doc rd in the future" do
      titlerequest = build(:title_request, REC_DOC_RD: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no abstract redated in the future" do
      titlerequest = build(:title_request, REDATE_ABS: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no policy out in the future" do
      titlerequest = build(:title_request, POLICY_OUT: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no policy bck in the future" do
      titlerequest = build(:title_request, POLICY_BCK: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end

    it "has no policy iss in the future" do
      titlerequest = build(:title_request, POLICY_ISS: Time.zone.today + 4)
      expect(titlerequest).to_not be_valid
    end
  end
end

