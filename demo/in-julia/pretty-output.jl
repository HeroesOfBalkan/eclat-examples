function show_itemsets(itemsets::Vector{Itemset})
    println("****** Itemsets ******")
    for (index, itemset) in enumerate(itemsets)
        println("--- Itemset #$(index) ---")
        println("Items:")
        for element in itemset.elements
            print(element, ", ")
        end
        println("\nTransaction relations/occurences:")
        for transaction_id in itemset.transaction_relations
            print(transaction_id, ", ")
        end
        println("\nItem length: $(itemset.length)")
        println("Itemset support: $(support(itemset, transactions))")
        println()
        println()
    end
    println("************")
end

function show_itemset_elements(itemsets)
    for itemset in itemsets
        println(itemset.elements)
    end
end