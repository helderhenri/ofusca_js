defmodule OfuscaJs do

	def parser(text) do
		no_spaces = text |> String.split("\n") |> analise_split |> Enum.join("")
		no_spaces

	end

	def analise_split(split) do
		lista = for n <- split do
					    case n do
							"" -> ""
							n -> 
								count_line = n |> String.length
								
								a = n |> String.replace("  ","")
								a = case Regex.run(~r/\/\//, a, return: :index) do
										nil -> a
										encontrado -> 
											[e] = encontrado
											enc = elem(e,0) 
											res = String.slice(a, 0,enc)
											res
									end
								a 
						end
					
				end
		lista
	end
end
