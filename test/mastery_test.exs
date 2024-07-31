defmodule MasteryTest do
  use ExUnit.Case
  doctest Mastery
  alias Mastery.Examples.Math

  test "test quiz api" do
    {status, _} = Mastery.start_quiz_manager()
    assert status == :ok
    res = Mastery.build_quiz(Math.quiz_fields())
    assert res == :ok
    res = Mastery.add_template(Math.quiz().title, Math.template_fields())
    assert res == :ok
  end
end
