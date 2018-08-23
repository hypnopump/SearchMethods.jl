using Documenter, SearchMethods
 
makedocs(modules=[SearchMethods],
        doctest=true)
 
deploydocs(deps   = Deps.pip("mkdocs", "python-markdown-math"),
    repo = "https://github.com/EricAlcaide/SearchMethods.jl.git",
    julia  = "0.6.2",
    osname = "windows")