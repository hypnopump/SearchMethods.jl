""" Code written entirely by Eric Alcaide.
	
	An implementation of BFS (Breadth-First Search) algorithm
	in julia for a future package: Search.jl
"""

module SearchMethods

    export bfs, dfs

    function bfs(root, tree, goal, expand)
        explored = Set([])
        frontier = [root]
        # While frontier is active, pop from left (FIFO)
        while !isempty(frontier)
        	node = shift!(frontier)
        	push!(explored, node)
        	# Check if goal found. Else => continue.
        	if node==goal
        		return node
        	end
        	# Explore node
        	for neighbor in expand(node, tree)
        		if !in(neighbor, explored)
        			push!(frontier, neighbor)
        		end
        	end
        end
        # Return false if goal not found.
        return false
    end

    function dfs(root, tree, goal, expand)
        explored = Set([])
        frontier = [root]
        # While frontier is active, pop from right (LIFO)
        while !isempty(frontier)
        	node = pop!(frontier)
        	push!(explored, node)
        	# Check if goal found. Else => continue.
        	if node==goal
        		return node
        	end
        	# Explore node
        	for neighbor in expand(node, tree)
        		if !in(neighbor, explored)
        			push!(frontier, neighbor)
        		end
        	end
        end
        # Return false if goal not found.
        return false
    end

    function dls(root, tree, goal, expand, depth)
    	explored = Set([])
    	# Keep track of node, depth while node in frontier
        frontier = [[root, 0]
        # While frontier is active, pop from right (LIFO)
        while !isempty(frontier)
        	node = pop!(frontier)
        	push!(explored, node[1])
        	# Check if goal found. Else => continue.
        	if node[1]==goal
        		return node
        	end
        	# Explore node only if depth-admissible
        	if node[end] < depth
	        	for neighbor in expand(node[1], tree)
	        		if !in(neighbor, explored)
	        			push!(frontier, [neighbor, node[end]+1])
	        		end
	        	end
	        end
        end
        # Return false if goal not found.
        return false

end