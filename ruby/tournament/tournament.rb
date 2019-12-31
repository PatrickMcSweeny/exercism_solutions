class Tournament
  def self.tally(input)
    new(input).tally
  end

  def initialize(input)
    @teams = []
    @matches = input.split "\n"
    process_results
  end

  def tally
    header + standings
  end

  def header
    "#{name_column('Team')}| MP |  W |  D |  L |  P\n"
  end

  def standings
    sort_teams
      .map do |team|
        "#{name_column(team.name)}|  #{team.matches_played} |  "\
        "#{team.wins} |  #{team.draws} |  #{team.losses} |  "\
        "#{team.points}\n"
      end
      .join
  end

  def name_column(text)
    text.ljust(31)
  end

  private

  attr_reader :matches, :teams

  def process_results
    matches.each do |football_match|
      team_name1, team_name2, result = football_match.split ";"
      team1 = find_team(team_name1)
      team2 = find_team(team_name2)
      case result
      when 'win'
        team1.win
        team2.lose
      when 'loss'
        team2.win
        team1.lose
      when 'draw'
        [team1, team2].map(&:draw)
      end
    end
  end

  def find_team(name)
    team = teams.find { |t| t.name == name } || Team.new(name)
    @teams << team unless teams.include? team
    team
  end

  def sort_teams
    teams.sort_by do |team|
      [-team.points, team.name]
    end
  end
end

class Team
  attr_reader :name, :wins, :losses, :draws

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def points
    wins * 3 + draws * 1
  end

  def matches_played
    wins + losses + draws
  end

  def win
    @wins += 1
  end

  def lose
    @losses += 1
  end

  def draw
    @draws += 1
  end
end
