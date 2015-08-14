import Foundation

func aFactorial(value: Int)->Int
{
    var result: Int
    
    if (value == 1)
    {
        result = value
    }
    else
    {
        result = aFactorial(value - 1) * value
    }
    
    return result
}

func main()
{

    var argv: [String] = Process.arguments
    var num: Int = argv[1].toInt()!
    var number = aFactorial(num)

    println("Result:")
    println(number)
}

main()
