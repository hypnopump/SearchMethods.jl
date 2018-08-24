#!/usr/bin/env julia

# Code written entirely by Eric Alcaide.ç
# Testing the SearchMethods.jl package

# Start Test Script
using SearchMethods
using Base.Test
 
# Run tests
# An implementation of a Tree data structure for test purposes.
tree = Dict(
    1 => [2, 3, 4, 5],
	2 => [6, 7, 8],
	3 => [9, 6],
	4 => [11],
	5 => [12, 13],
	6 => [],
	7 => [14],
	8 => [],
	9 => [],
	10 => [],
	11 => [15],
	12 => [],
	13 => [16, 17, 18],
	14 => [19, 20],
	15 => [21, 22],
	16 => [23],
	17 => [],
	18 => [24, 25],
	19 => [],
	20 => [],
	21 => [],
	22 => [],
	23 => [26],
	24 => [],
	25 => [],
	26 => [27, 28, 29],
	27 => [],
	28 => [],
	29 => [],
 )

# Sample expand function
function expand_node(node, tree)
	return tree[node]
end

# Sample goal_check function - will return true
function goal_check_true(node)
	if node == 28 return true
	else return false
	end
end

# Sample goal_check function - will return false
function goal_check_false(node)
	if node == 30 return true
	else return false
	end
end

# Sample cost function
function cost(node, neighbor)
	return abs(node-neighbor)
end

# Sample heuristic function.
function heuristic(node, goal)
    return (abs(node-goal)/2)^2
end


tic()
# TESTS FOR UNINFORMED SEARCH ALGORITHMS
println("UNINFORMED METHODS")
# Sample test for the Breadth Frirst Search algorithm.
println("BFS Test")
@time @test if SearchMethods.bfs(1, tree, goal_check_true, expand_node) != false return true else false end
@time @test if SearchMethods.bfs(1, tree, goal_check_false, expand_node) == false return true else false end
# Sample test for the Depth First Search algorithm.
println("DFS Test")
@time @test if SearchMethods.dfs(1, tree, goal_check_true, expand_node) != false return true else false end
@time @test if SearchMethods.dfs(1, tree, goal_check_false, expand_node) == false return true else false end
# Sample test for the Depth Limited Search algorithm
println("DLS Test")
@time @test if SearchMethods.dls(1, tree, goal_check_true, expand_node, 9) != false return true else false end
@time @test if SearchMethods.dls(1, tree, goal_check_false, expand_node, 9) == false return true else false end
# Sample test for the IDS algorithm
# Sample test for the Iterative Deepening Search algorithm
println("IDS Test")
@time @test if SearchMethods.ids(1, tree, goal_check_true, expand_node, 2) != false return true else false end
@time @test if SearchMethods.ids(1, tree, goal_check_false, expand_node, 2) == false return true else false end
# Sample test for the Uniform Cost Search algorithm
println("UCS Test")
@time @test if SearchMethods.ucs(1, tree, goal_check_true, expand_node, cost) != false return true else false end
@time @test if SearchMethods.ucs(1, tree, goal_check_false, expand_node, cost) == false return true else false end
 # TESTS FOR INFORMED SEARCH ALGORITHMS
println("\nINFORMED METHODS")
# Sample test for the Greedy Best-First Search algorithm.
println("GBS Test")
@time @test if SearchMethods.greedy(1, tree, goal_check_true, expand_node, heuristic) != false return true else false end
@time @test if SearchMethods.greedy(1, tree, goal_check_false, expand_node, heuristic) == false return true else false end
# Sample test for the A* Search algorithm.
println("A*S Test")
@time @test if SearchMethods.a_star(1, tree, goal_check_true, expand_node, cost, heuristic) != false return true else false end
@time @test if SearchMethods.a_star(1, tree, goal_check_false, expand_node, cost, heuristic) == false return true else false end

toc()