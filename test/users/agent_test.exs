defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "Saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "When the user is found, returns the user" do
      :user
      |> build(cpf: "12345678901")
      |> UserAgent.save()

      response = UserAgent.get("12345678901")

      expected_response =
        {:ok,
         %User{
           address: "Rua do Teste, 123",
           age: "30",
           cpf: "12345678901",
           email: "deividi@banana.com",
           name: "Deividi"
         }}

      assert response == expected_response
    end

    test "When the user is found, returns an error" do
      response = UserAgent.get("000000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
