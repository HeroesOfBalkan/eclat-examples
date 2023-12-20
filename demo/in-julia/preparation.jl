# itemset1, itemset2 - Itemset in transaction database
# transaction_database - database of transactions

function support(itemset1::Itemset, transaction_database::Vector)::Number
    # |x| / |T|
    return length(itemset1.transaction_relations) / length(transaction_database)
end

function confidence(itemset1::Itemset, itemset2::Itemset, transaction_database::Vector)
    # support(x and y) / support(x)
    return support(itemset_union(itemset1, itemset2), transaction_database)
end

function verticalize_database(transaction_database::Vector{Vector{ItemTypes}})
    unique_items::Vector{ItemTypes} = []
    itemsets::Vector{Itemset} = []

    for transaction in transaction_database
        for item in transaction
            if !(item in unique_items)
                push!(unique_items, item)
            end
        end
    end
    sort!(unique_items)

    for (index, item) in enumerate(unique_items)
        push!(itemsets, Itemset([item], [], 1))
        for (tid, transaction) in enumerate(transaction_database)
            
            if item in transaction
                push!(itemsets[index].transaction_relations, tid)
                itemsets[index].length += 1
            end
        end
    end

    return itemsets
end

function vectorize_database_better(transaction_database::Vector{Vector{ItemTypes}})
    # itemsets::Vector{ItemTypes} = []
    # for (tid, transaction) in enumerate(transaction_database)
    #     for (iid, item) in enumerate(transaction)
    #         if [item] in itemsets
    #             # Update item
                
    #         else
    #             # Insert item
    #             # insert_item!(itemsets, item)
    #             push!(itemsets, Itemset([item], [tid], 1))
    #         end
    #     end
    # end
    # return itemsets
end