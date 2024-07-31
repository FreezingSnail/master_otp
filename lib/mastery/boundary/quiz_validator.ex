defmodule Mastery.Boundary.QuizValidator do
  import Mastery.Boundary.Validator

  def errors(fields) when is_map(fields) do
    res =
      []
      |> require(fields, :title, &validate_title/1)
      |> optional(fields, :mastery, &validate_mastery/1)

    IO.inspect(res)
    res
  end

  def errors(_fields), do: [{nil, "A map of fields is required"}]

  def validate_title(title) when is_binary(title) do
    IO.inspect(title)
    check(String.match?(title, ~r{\S}), {:error, "can't be blank"})
  end

  def validate_title(_title), do: {:error, "must be a string"}

  def validate_mastery(mastery) when is_integer(mastery) do
    check(mastery > 0, {:error, "must be greater than 0"})
  end

  def validate_mastery(_mastery), do: {:error, "must be a number"}
end
