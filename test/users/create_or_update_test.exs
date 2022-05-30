defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "When all params are valid, saves the user" do
      params = %{
        name: "Deividi",
        address: "Visconde de Barbacena",
        email: "deividi@banana.com",
        cpf: "12345678900",
        age: 30
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "When there are invalid params, returns an error" do
      params = %{
        name: "Deividi",
        address: "Visconde de Barbacena",
        email: "deividi@banana.com",
        cpf: "12345678900",
        age: 10
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters!"}

      assert response == expected_response
    end
  end
end
