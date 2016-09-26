defmodule OfuscaJs do

	def parser(text) do
		no_spaces = text |> String.split("\n") |> analise_split |> Enum.join("")

		IO.puts("Inspecionando #{inspect no_spaces}")
		no_spaces

	end

	def analise_split(split) do
		lista = for n <- split do
					    case n do
							"" -> ""
							n -> 
								count_line = n |> String.length
								IO.puts("#{inspect count_line}")
								
								a = n |> String.replace("  ","")
								a = case Regex.run(~r/\/\//, a, return: :index) do
										nil -> a
										encontrado -> 
											IO.puts("Encontrado: #{inspect encontrado} | #{count_line}")
											[e] = encontrado
											enc = elem(e,0) 
											res = String.slice(a, 0,enc)
											IO.puts("Encontrado: #{inspect enc} #{inspect res}")
											res
									end
								a 
						end
					
				end
		lista
	end
end
