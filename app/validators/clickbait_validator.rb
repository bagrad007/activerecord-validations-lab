class ClickbaitValidator < ActiveModel::Validator
  WORDS = ["Won't Believe", "Secret", "Top", "Guess"]

  def validate(record)
    if !!record.title
      unless ["Won't Believe", "Secret", "Top", "Guess"].any? { |i| record.title.downcase.include?(i.downcase) }
        record.errors[:title].push("is not sufficiently clickbait-y")
      end
    end
  end
end
