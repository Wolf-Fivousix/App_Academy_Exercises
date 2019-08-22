def reverser (string, &block)
    block.call(string.reverse)
end

def word_changer (sentence, &block)
    sentence.split(" ").map {|word| block.call(word)} .join(" ")
end

def greater_proc_value (number, proc1, proc2)
    proc1.call(number) > proc2.call(number) ? proc1.call(number) : proc2.call(number)
end

def and_selector (array, proc1, proc2)
    array.select {|element| proc1.call(element) && proc2.call(element)}
end

def alternating_mapper (array, proc1, proc2)
    array.map.with_index do |element, index|
        if index.even?
            proc1.call(element)
        else
            proc2.call(element)
        end
    end
end