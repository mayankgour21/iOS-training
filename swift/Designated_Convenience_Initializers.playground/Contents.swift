import Foundation

enum Category : String
{
    case Sports,Fashion,Electronics,unowned
}

class Product
{
    var name : String
    var price : Double = 0.00
    var category : Category
    
    init ()
    {
        name = "[Untitled Product]"
        category = .unowned
    }
    
    init(name : String,category : Category)
    {
        self.name = name
        self.category = category
    }
    
     init(name : String,category : Category,price : Double)
    {
        self.name = name
        self.category = category
        self.price = price
    }
}

class CartItem : Product
{
    var addedToCart : Bool = false
    var cartItemDesc : String
    {
        return name + " Price : " + String(price) + " Category : " + category.rawValue + " is present in cart : \(addedToCart)"
    }
    init(name : String,category : Category,addToCart : Bool)
    {
        addedToCart = addToCart
        super.init(name: name, category: category)
    }
    override init(name : String, category : Category, price : Double)
    {
        super.init(name: name, category: category, price: price)
    }
    convenience init (name : String, category : Category, price : Double,addToCart : Bool)
    {
        self.init(name: name, category: category,addToCart: addToCart)
        super.price = price
    }
}

class OrderItem : CartItem
{
    var checkedOut : Bool = false
    
    var description : String
    {
        if !checkedOut && addedToCart
        {
            return "Item is not checked out.. It is in Cart"
        }
        
        return "Product checked out... " + name + " Price : " + String(price) + " Category : " + category.rawValue
    }
}

class Cart
{
    var cartList : Array<CartItem> = []
    func addToCart(product : CartItem)
    {
        if product.addedToCart
        {
            print("Adding to Cart ...")
            cartList.append(product)
            print("\(product.name) added to cart with price \(product.price) and category \(product.category)")
        }
        else
        {
            print("Not eligible to add to cart")
        }
    }
    
    func showCart()
    {
        print("------My Cart------")
        for cartItem in cartList
        {
            print(cartItem.cartItemDesc)
        }
    }
    
}

let myCart = Cart()

var item1 = CartItem(name: "Racquet", category: .Sports, price: 2324, addToCart: true)
var item2 = CartItem(name: "Shuttle", category: .Sports, price: 2000, addToCart: true)
var item3 = CartItem(name: "Shoes", category: .Sports,price: 1000)
var item4 = CartItem(name: "Racquet", category: .Sports, price: 2324, addToCart: true)

//print(item3.cartItemDesc)
//print(item4.cartItemDesc)

myCart.addToCart(product: item1)
myCart.addToCart(product: item2)
myCart.addToCart(product: item3)
myCart.addToCart(product: item4)

myCart.showCart()


var orderItem1 = OrderItem(name: "Phoen", category: .Electronics, price: 15000,addToCart: true)
print(orderItem1.description)
orderItem1.checkedOut = true
print(orderItem1.description)
