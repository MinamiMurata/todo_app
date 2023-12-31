require "rails_helper"
RSpec.describe "タスク管理機能", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user: user) }
  let!(:second_task) { FactoryBot.create(:second_task, user: user) }
  let!(:third_task) { FactoryBot.create(:third_task, user: user) }
  let!(:label) { FactoryBot.create(:label) }
  describe "新規作成機能" do
    before do
      visit new_session_path
      fill_in "session[email]", with: "generaltest@test.com"
      fill_in "session[password]", with: "123456"
      click_on "Log in"
    end
    context "タスクを新規作成した場合" do
      it "作成したタスクが表示される" do
        visit new_task_path
        fill_in "task[title]", with: "タスク1"
        fill_in "task[content]", with: "タスクの詳細1"
        find("#task_deadline_1i").find("option[value='2023']").select_option
        find("#task_deadline_2i").find("option[value='6']").select_option
        find("#task_deadline_3i").find("option[value='20']").select_option
        find("#task_status").find("option[value='started']").select_option
        find("#task_priority").find("option[value='middle']").select_option
        check "first"
        click_on "登録する"
        expect(page).to have_content "タスク1"
      end
    end
  end
  describe "一覧表示機能" do
    before do
      visit new_session_path
      fill_in "session[email]", with: "generaltest@test.com"
      fill_in "session[password]", with: "123456"
      click_on "Log in"
    end
    context "一覧画面に遷移した場合" do
      it "作成済みのタスク一覧が表示される" do
        expect(page).to have_content "Factory"
      end
    end
    context "タスクが作成日時の降順に並んでいる場合" do
      it "新しいタスクが一番上に表示される" do
        task_list = all(".task_row")
        expect(task_list.first.text).to start_with "3:"
      end
    end
    context "タスクが終了期限の降順に並んでいる場合" do
      it "終了期限が新しいタスクが一番上に表示される" do
        click_on "終了期限▼"
        sleep 0.5
        task_list = all(".task_row")
        expect(task_list.first.text).to start_with "1:"
      end
    end
    context "タスクの優先順位が高い順に並んでいる場合" do
      it "優先順位が高いタスクが一番上に表示される" do
        click_on "優先度▼"
        sleep 0.5
        task_list = all(".task_row")
        expect(task_list.first.text).to start_with "2:"
      end
    end
  end
  describe "詳細表示機能" do
    before do
      visit new_session_path
      fill_in "session[email]", with: "generaltest@test.com"
      fill_in "session[password]", with: "123456"
      click_on "Log in"
    end
    context "任意のタスク詳細画面に遷移した場合" do
      it "該当タスクの内容が表示される" do
        visit task_path(task.id)
        expect(page).to have_content "1:F"
      end
    end
  end
  describe "検索機能" do
    before do
      visit new_session_path
      fill_in "session[email]", with: "generaltest@test.com"
      fill_in "session[password]", with: "123456"
      click_on "Log in"
    end
    context "タイトルであいまい検索をした場合" do
      it "検索キーワードを含むタスクで絞り込まれる" do
        fill_in "search", with: "1:F"
        click_on "検索"
        expect(page).to have_content "1:F"
      end
    end
    context "ステータス検索をした場合" do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        find("#status").find("option[value='started']").select_option
        click_on "検索"
        expect(page).to have_content "2:F"
      end
    end
    context "タイトルのあいまい検索とステータス検索をした場合" do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        fill_in "search", with: "3:F"
        find("#status").find("option[value='completed']").select_option
        click_on "検索"
        expect(page).to have_content "3:F"
      end
    end
    context "ラベルで検索した場合" do
      it "一致するラベルがついたタスクが絞り込まれる" do
        task = FactoryBot.create(:fourth_task, user: user)
        visit edit_task_path(task.id)
        check "first"
        click_on "更新する"
        select "first", from: "label_id"
        click_on "検索"
        sleep 0.5
        task_list = all(".task_row")
        expect(task_list.count).to eq 1
      end
    end
    context "タイトルのあいまい検索とラベルで検索した場合" do
      it "検索キーワードをタイトルに含み、かつ一致するラベルがついたタスクが絞り込まれる" do
        task = FactoryBot.create(:fourth_task, user: user)
        visit edit_task_path(task.id)
        check "first"
        click_on "更新する"
        fill_in "search", with: "Factory"
        select "first", from: "label_id"
        click_on "検索"
        sleep 0.5
        task_list = all(".task_row")
        expect(task_list.count).to eq 1
      end
    end
    context "タイトルのあいまい検索とステータス検索とラベルで検索した場合" do
      it "検索キーワードをタイトルに含み、かつ一致するステータス・ラベルがついたタスクが絞り込まれる" do
        task = FactoryBot.create(:fourth_task, user: user)
        visit edit_task_path(task.id)
        check "first"
        click_on "更新する"
        fill_in "search", with: "Factory"
        find("#status").find("option[value='started']").select_option
        select "first", from: "label_id"
        click_on "検索"
        sleep 0.5
        task_list = all(".task_row")
        expect(task_list.count).to eq 0
      end
    end
  end
end
