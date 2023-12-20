function eclat_mine!(itemsets::Vector{Itemset})
    for (index, item) in enumerate(itemsets)
        candidates::Vector{Itemset} = []
        for current_item in itemsets
            if current_item == item
                continue
            end
            potential = itemset_union(item, current_item)
            if support(potential, transactions) >= MIN_SUP
                push!(candidates, potential)
            end
        end
        if candidates != []
            eclat_mine!(candidates)
        end
    end
    # println("\n\033[32m!GOTOVO!\033[0m")
end


















# --- Unstable ---

function eclat_algorithm(itemsets::Vector{Itemset})
    tmp_itemsets::Vector{Itemset} = filter(i -> support(i, transactions), itemsets)
    for (index, item) in enumerate(tmp_itemsets)
        candidates::Vector{Itemset} = []
        for current_item in tmp_itemsets
            if current_item == item
                continue
            end
            potential = itemset_union(item, current_item)
            if support(potential, transactions) >= MIN_SUP
                push!(candidates, potential)
            end
        end
        if candidates != []
            eclat_mine!(candidates)
        end
    end
    println("\n\033[32m!GOTOVO!\033[0m")
    return candidates
end






function eclat_mine(itemsets::Vector{Itemset})
    for (index, item) in enumerate(itemsets)
        candidates::Vector{Itemset} = []
        for current_item in itemsets
            if current_item == item
                continue
            end
            potential = itemset_union(item, current_item)
            push!(candidates, potential)
        end
        if candidates != []
            eclat_mine!(candidates)
        end
    end
    println("\n\033[32m!GOTOVO!\033[0m")
end