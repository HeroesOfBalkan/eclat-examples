include("data.jl")
include("preparation.jl")
include("pretty-output.jl")
include("algorithm.jl")

initial_itemsets = verticalize_database(transactions)

show_itemsets(initial_itemsets)

