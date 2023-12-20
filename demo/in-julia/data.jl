# Item types
@enum ItemTypes begin
    ITEM1 = 1
    ITEM2 = 2
    ITEM3 = 3
    ITEM4 = 4
    ITEM5 = 5
end

# Minsup Threashold
const MIN_SUP = 0.2

# Transaction database
transactions = [[ITEM1, ITEM3, ITEM4],
                [ITEM2, ITEM4],
                [ITEM1, ITEM2],
                [ITEM1, ITEM2, ITEM3],
                [ITEM5],
                [ITEM3, ITEM4],
                [ITEM2, ITEM3, ITEM4, ITEM5]
                ]



# Itemset (set of items)
mutable struct Itemset
    elements::Vector{ItemTypes}
    transaction_relations::Vector{UInt64}
    length::UInt64
end

function itemtype_into_uint(item::ItemTypes)::UInt64
    if item == ITEM1
        return 1
    elseif item == ITEM2
        return 2
    elseif item == ITEM3
        return 3
    elseif item == ITEM4
        return 4
    elseif item == ITEM5
        return 5
    end
    return 0
end

function find_index_itemsets(itemsets::Vector{Itemset}, itemset::Itemset)
    for i in eachindex(itemsets)
        if itemsets[i].elements == itemset.elements
            return i
        end
    end
    return 0
end

function itemset_union(itemset1::Itemset, itemset2::Itemset)
    new_elements::Vector{ItemTypes} = deepcopy(itemset1.elements)
    new_relations::Vector{UInt64} = []
    len::UInt64 = itemset1.length

    for el in itemset2.elements
        if !(el in new_elements)
            push!(new_elements, el)
            len += 1
        end
    end

    sort!(new_elements) # Optional; done just for visually prettier output

    for (i, el) in enumerate(new_elements)
        if el in itemset1.transaction_relations && el in itemset2.transaction_relations
            push!(new_relations, i)
        end
    end

    return Itemset(new_elements, new_relations, len)
end

function itemset_intersection(itemset1::Itemset, itemset2::Itemset)
    new_elements::Vector{ItemTypes} = []
    new_relations::Vector{UInt64} = []
    tmp_itemset::Itemset = deepcopy(itemset2)

    for el in itemset1.elements
        if el in tmp_itemset.elements
            push!(new_elements, el)
            index_found_in_other = findfirst(==(el), tmp_itemset.elements)
            popat!(tmp_itemset.elements, index_found_in_other)
        end
    end

    for el in new_elements
        if el in itemset1.transaction_relations && el in itemset2.transaction_relations
            push!(new_relations, el)
        end
    end

    return Itemset(new_elements, el, 0)
end



# --- Unstable ---

function insert_item!(itemset::Vector{Itemset}, item::Itemset)
    push!(itemset.elements, item)
    itemset.length += 1
end

function update_item_in_itemset!(itemset::Vector{Itemset}, index::UInt64)
    # TODO: This should update relations of the itemset
end
