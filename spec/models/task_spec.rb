require "rails_helper"

RSpec.describe Task, type: :model do
  it "is invalid without a title" do
    task = Task.new(title: nil)
    task.valid?
    expect(task.errors[:title]).to include("を入力してください")
  end
  it "is invalid with title is 256 or more characters" do
    task = Task.new(title: "a" * 256)
    task.valid?
    expect(task.errors[:title]).to include("は255文字以内で入力してください")
  end
  context "タスクの詳細が空の場合" do
    it "バリデーションにひっかかる" do
      task = Task.new(title: "詳細空のテスト", content: nil)
      expect(task).not_to be_valid
    end
  end
  context "タスクのタイトルと詳細に内容が記載されている場合" do
    it "バリデーションが通る" do
      task = Task.new(title: "タイトル合格", content: "詳細合格")
      expect(task).to be_valid
    end
  end
end
