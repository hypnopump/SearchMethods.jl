# SearchMethods.jl

[![SearchMethods](http://pkg.julialang.org/badges/Example_0.6.svg)](http://pkg.julialang.org/?pkg=Example)
Linux/MacOS: [![Build Status](https://travis-ci.org/EricAlcaide/SearchMethods.jl.svg?branch=master)](https://travis-ci.org/EricAlcaide/SearchMethods.jl)
Windows: [![Build status](https://ci.appveyor.com/api/projects/status/rfctrj4w0t2wctr1?svg=true)](https://ci.appveyor.com/project/EricAlcaide/searchmethods-jl)
[![Coverage Status](https://coveralls.io/repos/github/EricAlcaide/SearchMethods.jl/badge.svg?branch=master)](https://coveralls.io/github/EricAlcaide/SearchMethods.jl?branch=master)

The Julia package for Search Methods algorithms.

## Examples

A minimal working example can be found at the [/test](https://github.com/EricAlcaide/SearchMethods.jl/tree/master/test/) folder.

## Proto-docs

We're actually working on the documentation for the project. A first (and incomplete) draft can be found at the [/docs](https://github.com/EricAlcaide/SearchMethods.jl/blob/master/docs/src/index.md) folder.

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
