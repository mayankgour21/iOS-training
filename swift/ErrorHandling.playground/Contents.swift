import Foundation

// Error handling is the process of responding to and recovering from error conditions in your program.


// Food Delivery System
enum FoodDeliveryError : Error
{
    case restaurantClosed(reason : String)
    case outOfStock(item : String)
    case noDeliveryOption(reason : String)
    case itemNotAvailable(item : String)
    case itemNotFound(item : String)
    
}
class Restaurant
{
    var menu : [String : Int] // food item and its price
    var inventory : [String : Int] // inventory and its quantity
    var isOpen : Bool = true
    static var deliveryBoys = 3
    
    init (menu : [String : Int], inventory : [String : Int])
    {
        self.menu = menu
        self.inventory = inventory
    }
    
    func oderFood(item : String, quantity : Int) throws(FoodDeliveryError) -> String
    {
        // if res is closed
        guard isOpen else
        {
            throw FoodDeliveryError.restaurantClosed(reason: "Restaurant is currently closed !")
        }
        // if no delivery options
        guard Restaurant.deliveryBoys > 0 else
        {
            throw FoodDeliveryError.noDeliveryOption(reason: "Delivey boy is engaged...")
        }
        // item doesnt exist in menu
        guard var menuItem =  menu[item] else
        {
            throw FoodDeliveryError.itemNotFound(item: item)
        }
        
        // item available in the restaurant
        guard var foodItem =  inventory[item] else
        {
            throw FoodDeliveryError.itemNotAvailable(item: item)
        }
        
        
        // exceeds quantity
        var quan = inventory[item]
        guard quantity <= quan! else
        {
            throw FoodDeliveryError.outOfStock(item: item)
        }
        
        var cost = menuItem * quantity
        
        inventory[item]! -= quantity
        
        Restaurant.deliveryBoys -= 1
        print("----------------------------")
        print("Succesfully Order Placed ...")
        
        return "\(item) is ordered ..."
        
    }
    
}

var shriRamDhaba = Restaurant(menu: ["Aloo Paratha" : 100,"Panner Tikka Masala" : 320,"Lachha Paratha" : 100,"Kachori": 20], inventory: ["Aloo Paratha" : 3,"Panner Tikka Masala" : 2,"Lachha Paratha" : 4])
//shriRamDhaba.isOpen = false

func orderPlaced(restro : Restaurant, item : String, quantity : Int) throws
{
    do
    {
        let message = try restro.oderFood(item: item, quantity: quantity)
        print(message)
        print("Number of Delivery Boy Available : \(Restaurant.deliveryBoys)")
    }
    catch FoodDeliveryError.itemNotAvailable(let item)
    {
        print("Error: The item '\(item)' is not available in the inventory.")
    }
    catch FoodDeliveryError.itemNotFound(let item)
    {
        print("Error: The item '\(item)' is not available on the menu.")
    }
    catch FoodDeliveryError.noDeliveryOption(let reason)
    {
        print(reason)
    }
    catch FoodDeliveryError.outOfStock(let item)
    {
        print("Error \(item) out of stock")
    }
    catch FoodDeliveryError.restaurantClosed(let reason)
    {
        print(reason)
    }

}

do
{
    try orderPlaced(restro: shriRamDhaba, item: "Aloo Paratha", quantity: 2)
    try orderPlaced(restro: shriRamDhaba, item: "Panner Tikka Masala", quantity: 2)
    try orderPlaced(restro: shriRamDhaba, item: "Lachha Paratha", quantity: 2)
    try orderPlaced(restro: shriRamDhaba, item: "Aloo Paratha", quantity: 1)
}
