class DropTitleFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column(:questions, :title)
  end
end
