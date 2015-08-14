import Foundation

public class Person
{   
    public init(name: String, age: Int)
    {
        _name = name
        _age = age
    };
    
    public func getName()->String
    {
        return _name
    }
    
    public func getAge()->Int
    {
        return _age;
    }

    private var _name: String
    private var _age: Int
}

public class File 
{    
    class func open (path: String, utf8: NSStringEncoding = NSUTF8StringEncoding) -> String?
    {
        var error: NSError?
        return NSFileManager().fileExistsAtPath(path) ?
            String(contentsOfFile: path, encoding: utf8, error: &error)! : nil
    }

    class func save (path: String, _ content: String, 
        utf8: NSStringEncoding = NSUTF8StringEncoding) -> Bool 
    {
        var error: NSError?
        return content.writeToFile(path, atomically: true, encoding: utf8, error: &error)
    }
}

func main()
{
    let args: [String] = Process.arguments
    let msgUsage: String = "Usage: swift person.swift [fileName]"
    var personStringArray: [String]
    var person2DArray = []

    // If we don't have at least one argument, then display error information
    // to the user, otherwise process the file given to retrieve all persons
    // stored in the file and output a list of all persons names, sorted, in
    // addition to the average age of all persons in the list.
    if (countElements(args) < 2)
    {
        // Inform the user of their error and display the usage message.
        println("Error: not enough arguments.")
        println(msgUsage)
    }
    else
    {
        // Attempt to open and read the file argument provided.
        let personFile = File.open(args[1])!
        println(personFile)
        
        // Read from the file to create our persons list.
        // Split our input up to the first comma and save that piece to our name
        // variable. Then split after the comma to the new line and save that
        // value as an Int to be the person's age. Then strip off that line and
        // move to the next line to read.
        personStringArray = personFile.componentsSeparatedByString("\n")
        //println("Sorted personStringArray:")
        //println(sorted(personStringArray))

        
        //println("\nUnsorted personStringArray:")
        //println(personStringArray)
        
        personStringArray = sorted(personStringArray)
        
        for i in 0..<personStringArray.count
        {
            if (personStringArray[i] != "")
            {
                println((personStringArray[i].componentsSeparatedByString(","))[0])
            }
        }
        
        var count = 0.0
        var someInt: Int
        var myReplacementString = " "
        var numOfAges = 0.0
        var ageString: String
        var ageOfPerson: Int
        
        println()
        println(personStringArray)

        // Iterate up to the length of the person array.
        for i in 0..<personStringArray.count
        {
            // If we don't have an empty element, attempt to process the person record.
            if (personStringArray[i] != "")
            {
                // Get the string representation of the age of the Person.
                ageString = personStringArray[i].componentsSeparatedByString(",")[1]
                
                // Strip the whitespace characters from the string representation of the age.
                ageString = ageString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                
                // Change the string age to an int and unwrap the optional return of an int with "!"
                ageOfPerson = ageString.toInt()!
                
                count = count + Double(ageOfPerson)
                numOfAges++
            }
        }
        
        println(count / numOfAges)
        
        personStringArray.removeAtIndex(0)
        
        for person in person2DArray
        {
            println(person)
        }
        


//        for person in personStringArray
//        {
//            //println(person.componentsSeparatedByString(","))
//            person2DArray.append(person.componentsSeparatedByString(","))
//        }
        
        //println("2DArray: \(person2DArray)")
        //println()
        
        //println(person2DArray[1])

        // Output a list of persons in sorted order.

        // Output the average age of all persons.

    }
}

main()
