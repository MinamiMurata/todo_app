require "rails_helper"
RSpec.describe Label, type: :system do
  let!(:second_user) { FactoryBot.create(:second_user) }
  describe "ラベル新規作成機能" do
    before do
      visit new_session_path
      fill_in "session[email]", with: "admintest@test.com"
      fill_in "session[password]", with: "123456"
      click_on "Log in"
    end
    context "ラベルを新規作成した場合" do
      it "ラベルを作成できる" do
        visit new_admin_label_path
        fill_in "label[name]", with: "ラベル1"
        click_on "登録する"
        expect(page).to have_content "ラベル1"
      end
    end
  end
  describe "一覧表示機能" do
    before do
      visit new_session_path
      fill_in "session[email]", with: "admintest@test.com"
      fill_in "session[password]", with: "123456"
      click_on "Log in"
    end
    context "一覧画面に遷移した場合" do
      it "作成済みのラベル一覧が表示される" do
        FactoryBot.create(:label)
        visit admin_labels_path
        expect(page).to have_content "first"
      end
    end
  end
end
