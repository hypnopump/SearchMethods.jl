# SearchMethods

The Julia package for Search Methods algorithms.

## Proto-docs
* **Expand node**: Node expansion function must be provided with the format `expand(node)` returning a 1d-Array of child nodes.
* **Goal check**: Goal checking function must be provided with the format `goalCheck(node)` returning a boolean value.
* **Expansion cost**: For cost-related methods such as **UCS**, an expansion-cost function must be provided with the format `cost(node, neighbor)` returning a real number (the greater the number the costly the expansion).

## Contribute
Hey there! New ideas are welcome: open/close issues, fork the repo and share your code with a Pull Request.
Clone this project to your computer:
 
`git clone https://github.com/EricAlcaide/search.jl`
 
 By participating in this project, you agree to abide by the thoughtbot [code of conduct](https://thoughtbot.com/open-source-code-of-conduct)
 
## Meta
 
* **Author's GitHub Profile**: [Eric Alcaide](https://github.com/EricAlcaide/)
* **Twitter**: [@eric_alcaide](https://twitter.com/eric_alcaide)
* **Email**: ericalcaide1@gmail.com
