function outside (outer)
{
    outer += 10;
    console.log(outer);
}

function anagrams() {
    let outer = 5;
    console.log(outer);
    {
        console.log("In scope: ", outer);
        outer++;
        const inner1 = 10;
        console.log("In scope: ", inner1);
    }
    console.log(outer);
    outer++;
    // console.log("Outer scope: ", inner1);    // This errors out as inner1 is not defined.
    console.log("------------------------")
    function func() {
        console.log("Inside function: ", outer);
    };
    func();
    console.log("------------------------ Outdefined function call")
    outside(outer);
    console.log("Yet, our local variable was not modified: ");
    console.log(outer);
}

// anagrams();
references();

function references ()
{
    let original = 10;
    let copy = original;
    copy++;
    console.log(original, copy);
}