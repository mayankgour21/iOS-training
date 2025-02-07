import Foundation

@propertyWrapper
struct EmailPropertyWrapper
{
     private var _email : String
    
    var wrappedValue : String
    {
        get{
            print("Get is Called....")
            return isValidEmail(email: _email) ? _email : ""
        }
        set
        {
            print("Set is Called....")
            _email = isValidEmail(email: newValue) ? newValue : ""
        }
    }
    
    init (wrappedValue : String)
    {
        self._email = wrappedValue
    }
    
    private func isValidEmail(email : String)->Bool
    {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
                let pred = NSPredicate(format: "SELF MATCHES %@", regex)
                return pred.evaluate(with: email)
    }
}

struct User
{
    var name : String
    @EmailPropertyWrapper var email : String
    
    func register()
    {
//        print(email)
        if(email.isEmpty)
        {
            print("Invalid Email Address. Please Enter Again !")
        }else
        {
            print("Successfully Registered...")
            print("Email Address : \(email)")
        }
    }
    
    mutating func updateEmail(_ updatedEmail : String)
    {
        email = updatedEmail
    }
    

}

var user1 = User(name : "mayank gour",email : "mayankgour@gmail.com")

user1.register()
user1.updateEmail("mayankg3455gmail.com")

