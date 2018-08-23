__precompile__()

module SearchMethods
	# package code goes here
	export bfs, dfs, dls, ids, ucs
	export greedy, a_star

	include("uninformed.jl")
	include("informed.jl")

end # module