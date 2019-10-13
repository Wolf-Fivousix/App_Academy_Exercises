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
}

anagrams();