defmodule MasteryTest do
  use ExUnit.Case
  doctest Mastery
  alias Mastery.Examples.Math
  alias Mastery.Boundary.QuizSession

  test "test quiz api" do
    now = DateTime.utc_now()
    five_seconds_from_now = DateTime.add(now, 5, :second)
    one_minute_from_now = DateTime.add(now, 1, :minute)

    res =Mastery.schedule_quiz(Math.quiz_fields, [Math.template_fields()], now, one_minute_from_now)
    assert res == :ok
    Mastery.take_quiz(Math.quiz_fields().title, "test@email.com")

  end
end
