import Foundation

// Lazy Stored Property

class FetchListOfProductsViewModel {
    
    lazy var product : [String] = {
        print("Loading Products ...")
        return fetchProducts()
    }()
    
    func fetchProducts() -> [String]{
        
        // fetching data related to products from DB which require some delay
        return ["BasketBall","Cricket","Badminton","Football","Tennis"]
    }

}

let viewModel = FetchListOfProductsViewModel()

print(viewModel.product)
// Note : lazy stored property can only be intialized once when it is first accessed
print(viewModel.product)

// Example 2

struct Order
{
    static var orderId : Int = 1
    var price : Double = 10.00
    
    
}

//class Cart
//{
//    lazy var orders : Order = Order()
//    var customer : String = "Customer"
//}
//
//let cart = Cart()
//
//print(cart.orders)
//
//cart.orders.orderId = 2
//
//print(cart.orders)

class Cart
{
    lazy var orders : Int = {
        return Order.orderId
    }()
    
    var customer : String = "Customer"
}

let cart = Cart()

print(cart.orders)

Order.orderId = 2

print(cart.orders)



