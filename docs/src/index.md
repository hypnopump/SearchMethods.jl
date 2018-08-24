# SearchMethods.jl Documentation
 
The Julia package for Search Methods algorithms.
 
## Methods included

As for now, only **Uninformed Search** and **Informed Search** methods are supported.
We plan to support search methods applied to games such as Minimax, Alpha/Beta prunning and Montecarlo Tree Search.
The list below states the methods supported:

* **Uninformed Search**

  * **Breadth First Search (BFS)**: Expands always the shallowest node.
  * **Depth First Search (DFS)**: Expands always the deepest node.
  * **Depth Limited Search (DLS)**: Expands always the deepest node until maximum depth is reached. 
  * **Iterative Deepening Search (IDS)**: Expands always the deepest node until maximum depth is reached. Repeat the process iteratively increasing maximum depth.
  * **Uniform Cost Search (UCS)**: Expands always the least cost node.

* **Informed Search** 

  * **Greedy Best-First Search**: Expands node that appears to be closest to goal. 
  * **A Star Search**: Expands node that appears to be the closest path through to goal.
 

## Examples - 8 puzzle
The 8-puzzle consists of 9 spaces to fill with numbers from 1 to 9. The resulting blank space is used to move the pieces of the puzzle.
From a given initial state, the goal of the puzzle is to reach the goal state, in which the numbers are ordered.

<center><img src="https://github.com/EricAlcaide/SearchMethods.jl/blob/master/example/8puzzle_example.png"/></center>

* `function expand_node(node, tree)`: Expands a node by generating new child nodes. Creates a tree-like search space. Returns a 1d-Array of new nodes.
* `function goal_check(node)`: Checks if a goal state is found. Returns true or false.

The code can be found [here](https://github.com/EricAlcaide/SearchMethods.jl/blob/master/example/8puzzle.jl). The example contains the BFS, DLS and IDS search methods.

Another minimal working example with a tree-like structure can be found at the [/test](https://github.com/EricAlcaide/SearchMethods.jl/tree/master/test/) folder.

 
## Meta
 
* **Author**: Eric Alcaide
* **Author's GitHub Profile**: [Eric Alcaide](https://github.com/EricAlcaide/)
* **Twitter**: [@eric_alcaide](https://twitter.com/eric_alcaide)
* **Email**: ericalcaide1@gmail.com