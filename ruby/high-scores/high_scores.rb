class HighScores
  attr_reader :scores

  def initialize(score_list)
    @scores = score_list
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top_three
    scores.sort.last(3).reverse
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
