""" Code written entirely by Eric Alcaide.
	
	An implementation of Informed search methods algorithms
	in julia for a future package: SearchMethods.jl
"""

function greedy(root, tree, goal_check, expand, heuristic)
	explored = Set([])
	# Keep track of node, depth while node in frontier
    frontier = PriorityQueue()
    enqueue!(frontier, root, 0)
    # While frontier is active, pop least cost node.
    while !isempty(frontier)
    	# Peek least cost value and cost. Eliminate from frontier.
    	node, cost_to_goal = map(Any, peek(frontier))
    	dequeue!(frontier)
    	# Check if goal found. Else => continue.
    	if goal_check(node) return node end
    	# Explore node
    	for neighbor in expand(node, tree)
    		if !in(neighbor, union(explored, keys(frontier)))
    			enqueue!(frontier, neighbor, heuristic(node,neighbor))
    		end
    	end
    end
    # Return false if goal not found.
    return false
end

function a_star(root, tree, goal_check, expand, cost, heuristic)
	explored = Set([])
	# Keep track of node, depth while node in frontier
    frontier = PriorityQueue()
    enqueue!(frontier, root, 0)
    # While frontier is active, pop least cost node.
    while !isempty(frontier)
    	# Peek least cost value and cost. Eliminate from frontier.
    	node, cost_to_goal = map(Any, peek(frontier))
    	dequeue!(frontier)
    	# Check if goal found. Else => continue.
    	if goal_check(node) return node end
    	# Explore node
    	for neighbor in expand(node, tree)
    		if !in(neighbor, union(explored, keys(frontier)))
    			enqueue!(frontier, neighbor, cost(node, neighbor)+heuristic(node,neighbor))
    		end
    	end
    end
    # Return false if goal not found.
    return false
end