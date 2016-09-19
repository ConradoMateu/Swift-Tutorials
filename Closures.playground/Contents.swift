//:Github: [Conradomateu](https://github.com/ConradoMateu)
/*: 
 ⎨⎬ Closures
 ============
 >usually enclosed in { }
 >
 >(argument) -> (return type)
 >
 >Anonimous functions -> blocks in Objective-C and lambda in other languages
 >
*/

func calculate(x:Int, _ y: Int, _ operation: (Int , Int) -> Int) -> Int{
    return operation(x,y)
}

func divide(x: Int, y: Int) -> Int { return x / y }

calculate(10, 5, divide)

//: 1- Inlining: passing the function as parameter

calculate(10, 5, {(x: Int, y: Int) -> Int in return x / y })

//: 2- Type inference

calculate(10, 5, {(x,y) in return x / y })

//: 3- Delete braces and the `return` statement.

calculate(10, 5, {a, b in a / b})

//: 4- Shorthand arguments

calculate(10, 5, {$0 / $1})
/*:
5- Trailing closures: last argument in the function call.

Closure argument just goes out of braces
 */
calculate(3, 7){$0 * $1}


//: Capturing values (Apple Sample)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()


/*:
⛔️🏃Nonescaping Closures:
----------------------
Adding @noescape guarantees that the closure will not be stored somewhere, used at a later time, or used asynchronously.
*/
var foo: (()->Void)?
func noEscapeClosure(@noescape preparations: () -> Void) {
/*:
>closure trying to scape
>
>  foo = preparations
>
>  tryToScape(){preparations}
>
*/
    preparations() //noescape
}

func tryToScape(closure: () -> ()){
    foo = closure
}
/*:
🤖Autoclosures:
--------------
If you pass expression as an argument of a function, it will be automatically wrapped by `autoclosure`, also applies @noescape for that closure parameter.
*/
func num(n: () -> Int) -> Int {
  return n()*2
}

var a = 10
var b = 15

num({a*b})
num(){a * b} //Trailing closures

func num(@autoclosure n: () -> Int) -> Int {
    return n()*2
}

num (a*b)

