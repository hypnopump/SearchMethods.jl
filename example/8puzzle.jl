# Code written entirely by Eric Alcaide
# 8-puzzle example for SearchMethods.jl

using SearchMethods

# The goal is to order the 8-puzzle from an unordered state.
# 0 represents a blank space.
#  |-----------------|
#  |  0  |  1  |  2  |
#  |-----------------|
#  |  3  |  4  |  5  |
#  |-----------------|
#  |  6  |  7  |  8  |
#  |-----------------|

# Formalize the initial game state as an array
state = [3,1,2,4,0,5,6,7,8]

# Generate new nodes from a parent node.
function expand_node(node, tree)
	neighbors = []
	# Locate 0 -> determine moves
	loc = findin(node, 0)[1]
	# Check if moves are possible (up, down, left, right) + expand
	# expand up node
	if loc > 3
		up = copy(node)
		up[loc], up[loc-3] = up[loc-3], up[loc]
		push!(neighbors, up)
	end
	# expand down node
	if loc < 7 
		down = copy(node)
		down[loc], down[loc+3] = down[loc+3], down[loc]
		push!(neighbors, down)
	end
	# expand left node
	if loc % 3 != 1
		left = copy(node)
		left[loc], left[loc-1] = left[loc-1], left[loc]
		push!(neighbors, left)
	end
	# expand right node
	if loc % 3 != 0 
		right = copy(node)
		right[loc], right[loc+1] = right[loc+1], right[loc]
		push!(neighbors, right)
	end

	return neighbors
end


# Check if the puzzle is ordered
function goal_check(node)
	if node == [0,1,2,3,4,5,6,7,8] return true
	else return false
	end
end


# TESTS FOR UNINFORMED SEARCH ALGORITHMS
println("UNINFORMED METHODS")
# Sample test for the Iterative Deepening Search algorithm.
println("IDS Example")
@time println(SearchMethods.ids(state, false, goal_check, expand_node, 2))
# Sample test for the Breadth Frirst Search algorithm.
println("BFS Example")
@time println(SearchMethods.bfs(state, false, goal_check, expand_node))
# Sample test for the Depth Limited Search algorithm.
println("DLS Example")
@time println(SearchMethods.dls(state, false, goal_check, expand_node, 3))