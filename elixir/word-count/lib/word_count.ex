defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
  	words = Regex.scan(~r/[[:alnum:]|\-|ö]+/,	String.downcase(sentence))
		Enum.into(words, %{}, fn word ->
			{Enum.at(word, 0), Enum.count(words, fn w -> w == word end)}
		end)
  end
end
