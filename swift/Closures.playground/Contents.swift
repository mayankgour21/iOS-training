import Foundation

// Production level simulation of the escaping Closure

struct User
{
    let id : Int
    let name : String
}

// typecasting alias for clousre passed inside the function parameter to increase the readablity
typealias userFetchClosure = (User?,Error?) -> Void


// Function to fetch user details with id asynchronously
func fetchUserDetails(id : Int,completionHandler : @escaping userFetchClosure )
{
    let url = URL(string: "https://api.example.com/users/\(id)")!
    
    DispatchQueue.global().async
    {
        print("Started fetching user details. Please wait for 2 seconds !")
        sleep(2) // simulating network delay
        
        // creating a user to return
        
        let user = User(id : id,name : "Mayank")
        
        completionHandler(user,nil)
    }
    
}

// usage of the fetchUserDetails

fetchUserDetails(id: 1)
{
    user, error  in
    if let error = error
    {
        print("Error occured")
        return
    }
    
    if let user = user
    {
        print("Fetch User Detail Successfully ! User Id : \(user.id) User Name :  \(user.name)")
    }
}


