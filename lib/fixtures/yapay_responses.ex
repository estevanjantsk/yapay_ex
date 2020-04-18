defmodule Fixtures.YapayResponses do
  @moduledoc """
  Retrieve Yapay responses in json
  """
  def load(name) do
    dir = File.cwd!() <> "/test/fixtures/yapay_responses"

    File.read!("#{dir}/#{name}.json")
  end
end
