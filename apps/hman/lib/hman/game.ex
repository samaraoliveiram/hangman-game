defmodule Hman.Game do
  alias Hman.Game
  defstruct word: [], errors: [], max_errors: 8, letters: [], status: :progress

  def new(word) do
    %Game{word: String.graphemes(String.downcase(word))}
  end

  def play(%Game{} = game, letter) do
    game
    |> guess(letter)
    |> update_status()
  end

  def guess(%Game{word: word} = game, letter) do
    if letter in word do
      correct_guess(game, letter)
    else
      wrong_guess(game, letter)
    end
  end

  def correct_guess(%Game{word: word} = game, letter) do
    %Game{game | letters: Enum.concat(get_letters(word, letter), game.letters)}
  end

  def get_letters(a, b, c \\ 0)

  def get_letters([], _, _), do: []

  def get_letters([h | tail], letter, index) do
    IO.puts("#{h} , #{index}")

    if(h == letter) do
      [%{letter: letter, position: index} | get_letters(tail, letter, index + 1)]
    else
      get_letters(tail, letter, index + 1)
    end
  end

  def wrong_guess(game, letter) do
    %Game{game | errors: [letter | game.errors]}
  end

  def update_status(%Game{errors: errors, max_errors: limit} = game)
      when length(errors) == limit do
    %Game{game | status: :lose}
  end

  def update_status(%Game{letters: letters, word: word} = game)
      when length(word) == length(letters) do
    %Game{game | status: :win}
  end

  def update_status(%Game{} = game), do: game
end
