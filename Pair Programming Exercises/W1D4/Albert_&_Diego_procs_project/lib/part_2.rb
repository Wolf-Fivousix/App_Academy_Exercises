def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(sent, &prc)
    sent.split(" ").map {|word| prc.call(word)}
        .join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    if prc_1.call(num) > prc_2.call(num)
        return prc_1.call(num)
    else
        return prc_2.call(num)
    end
end

def and_selector(array, prc_1, prc_2)
    array.select {|ele| prc_1.call(ele) && prc_2.call(ele)}
end

def alternating_mapper(array, prc_1, prc_2)
    array.map.with_index do |element, i|
        if i.even?
            prc_1.call(element)
        else
            prc_2.call(element)
        end
    end
end