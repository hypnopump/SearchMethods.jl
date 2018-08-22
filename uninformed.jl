""" Code written entirely by Eric Alcaide.
	
	An implementation of Uninformed search methods algorithms
	in julia for a future package: SearchMethods.jl
"""

module SearchMethods
	using DataStructures

    export bfs, dfs

    function bfs(root, tree, goal_check, expand)
        explored = Set([])
        frontier = [root]
        # While frontier is active, pop from left (FIFO)
        while !isempty(frontier)
        	node = shift!(frontier)
        	push!(explored, node)
        	# Check if goal found. Else => continue.
        	if goal_check(node) return node end
        	# Explore node
        	for neighbor in expand(node, tree)
        		if !in(neighbor, union(explored, frontier))
        			push!(frontier, neighbor)
        		end
        	end
        end
        # Return false if goal not found.
        return false
    end

    function dfs(root, tree, goal_check, expand)
        explored = Set([])
        frontier = [root]
        # While frontier is active, pop from right (LIFO)
        while !isempty(frontier)
        	node = pop!(frontier)
        	push!(explored, node)
        	# Check if goal found. Else => continue.
        	if goal_check(node) return node end
        	# Explore node
        	for neighbor in expand(node, tree)
        		if !in(neighbor, union(explored, frontier))
        			push!(frontier, neighbor)
        		end
        	end
        end
        # Return false if goal not found.
        return false
    end

    function dls(root, tree, goal_check, expand, depth)
    	explored = Set([])
    	# Keep track of node, depth while node in frontier
        frontier = [[root, 0]]
        # While frontier is active, pop from right (LIFO)
        while !isempty(frontier)
        	node = pop!(frontier)
        	push!(explored, node[1])
        	# Check if goal found. Else => continue.
        	if goal_check(node[1]) return node[1] end
        	# Explore node only if depth-admissible
        	if node[end] < depth
	        	for neighbor in expand(node[1], tree)
	        		if !in(neighbor, union(explored, [f[1] for f in frontier]))
	        			push!(frontier, [neighbor, node[end]+1])
	        		end
	        	end
	        end
        end
        # Return false if goal not found.
        return false
    end

    function ids(root, tree, goal_check, expand, depth; it = 1)
    	final = false
    	# Normal dfs but check if bottom of tree. If not, increase depth by it.
    	while final == false
    		final = true
    		explored = Set([])
	    	# Keep track of node, depth while node in frontier
	        frontier = [[root, 0]]
	        # While frontier is active, pop from right (LIFO)
	        while !isempty(frontier)
	        	node = pop!(frontier)
	        	push!(explored, node[1])
	        	# Check if goal found. Else => continue.
	        	if goal_check(node[1]) return node[1] end
	        	# Explore node only if depth-admissible
	        	if node[end] < depth
		        	for neighbor in expand(node[1], tree)
		        		if !in(neighbor, union(explored, [f[1] for f in frontier]))
		        			push!(frontier, [neighbor, node[end]+1])
		        		end
		        	end
		        # Check for tree end. Continue if not end yet.
		        elseif node[end] == depth && final == true
		        	if !isempty(expand(node[1], tree))
		        		final = false
		        	end
		        end
	        end
	        # Update depth parameter
	        depth += it
    	end
    	# if not goal found
    	return false
    end

    function ucs(root, tree, goal_check, expand, cost)
    	explored = Set([])
    	# Keep track of node, depth while node in frontier
        frontier = PriorityQueue()
        enqueue!(frontier, root, 0)
        # While frontier is active, pop least cost node.
        while !isempty(frontier)
        	# Peek least cost value and cost. Eliminate from frontier.
        	node, prev_cost = map(Any, peek(frontier))
        	dequeue!(frontier)
        	# Check if goal found. Else => continue.
        	if goal_check(node) return node end
        	# Explore node
        	for neighbor in expand(node, tree)
        		if !in(neighbor, union(explored, keys(frontier)))
        			enqueue!(frontier, neighbor, cost(node,neighbor) + prev_cost)
        		end
        	end
        end
        # Return false if goal not found.
        return false
    end


end