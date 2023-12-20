include("data.jl")
include("preparation.jl")
include("pretty-output.jl")
include("algorithm.jl")

initial_itemsets = verticalize_database(transactions)

show_itemsets(initial_itemsets)

eclat_mine!(initial_itemsets)
# results = eclat_algorithm(initial_itemsets)

# show_itemsets(results)
show_itemsets(initial_itemsets)

println()
show_itemset_elements(initial_itemsets)