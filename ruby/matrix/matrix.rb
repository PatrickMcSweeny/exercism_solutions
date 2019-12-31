class Matrix
  attr_reader :rows, :columns

  private

  def initialize(string_matrix)
    @string_matrix = string_matrix
    @rows = split_rows
    @columns = split_columns
  end

  def split_rows
    @string_matrix.split("\n")
                  .collect! { |row| row.split(' ')
                                       .collect! { |cell| cell.to_i } }
  end

  def split_columns
    rows.transpose
  end
end