# To run: `julia bfs_test.jl`
# Code written entirely by Eric Alcaide.
# An implementation of a Tree data structure for test purposes.

include("uninformed.jl")
include("informed.jl")

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

function expand_node(node, tree)
    return tree[node]
end

function goal_check(node)
    if node == 30 return true
    else return false
    end
end

function cost(node, neighbor)
    return abs(node-neighbor)
end

# Sample test for the BFS algorithm.
println("BFS Test: ", SearchMethods.bfs(1, tree, goal_check, expand_node))
# Sample test for the DFS algorithm.
println("DFS Test: ", SearchMethods.dfs(1, tree, goal_check, expand_node))
# Sample test for the DLS algorithm
println("DLS Test: ", SearchMethods.dls(1, tree, goal_check, expand_node, 9))
# Sample test for the IDS algorithm
println("IDS Test: ", SearchMethods.ids(1, tree, goal_check, expand_node, 2))
# Sample test for the UCS algorithm
println("UCS Test: ", SearchMethods.ucs(1, tree, goal_check, expand_node, cost))