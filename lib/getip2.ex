defmodule Getip2 do
  @api_url "ipinfo.io"

  @moduledoc """
  Documentation for Getip2.
  """

  @doc """
  Main hook for cli
  """
  def main([]) do
    IO.puts("Please specify an IP address to lookup")
  end

  def main(argv) do
    List.first(argv)
      |> retrieve_ip_info
      |> get_body
      |> IO.puts
  end

  def get_body(response) do
    response.body
  end

  def retrieve_ip_info(ip) do
    HTTPotion.get("http://#{@api_url}/#{ip}")
  end
end
