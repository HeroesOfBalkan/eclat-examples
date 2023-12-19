include("data.jl")
include("preparation.jl")

# println(transactions)

initial_itemsets = verticalize_database(transactions)

println(initial_itemsets)