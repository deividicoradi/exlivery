defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "When all params are valid, returns the user" do
      response =
        User.build(
          "Rua do Teste, 123",
          "Deividi",
          "deividi@banana.com",
          "12345678",
          "30"
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "When there are invalid params, returns an error" do
      response =
        User.build(
          "Visconde de barbacena",
          "Deividi Coradi",
          "deividi@banana.com",
          "12345678",
          15
        )

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
