module QuestionsHelper
  def title(question)
    question.title || first_sentence(question)
  end

  def first_sentence(question)
    question
      .content
      .to_plain_text
      .truncate(40, omission: '', separator: "\n")
  end

  def content_without_first_sentence(question)
    question
      .content
      .to_plain_text
      .tr(first_sentence(question), '')
      .truncate(100)
  end
end
