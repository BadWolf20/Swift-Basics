import UIKit

struct Item{
    var price: Int
    var count: Int
    let product: Product
}

struct Product{
    let name: String
    var status: LegalityStatus
}

enum LegalityStatus{
    case legally
    case illegally
}

enum MarketError: Error{
    case outOfStuck
    case notFound
    case notEnoughMoney(price: Int)
}

class BlackMarket{
    private var stock = [
        "Pistol" : Item(price: 10, count: 2, product: Product(name: "Pistol", status: .illegally)),
        "Ice" : Item(price: 5, count: 4, product: Product(name: "Ice", status: .legally)),
        "Chips" : Item(price: 15, count: 3, product: Product(name: "Chips", status: .legally))
    ]
    
    private var depositAmount = 0
    
    func deposit(amount: Int) {
        depositAmount += amount
    }
    
    func showBalance() {
        print("You have: \(depositAmount) points")
    }
    
    func showCount(name: String){
        func chech(_ name: String) -> Result<Item, MarketError>{
        guard let item = stock[name] else {
            return .failure(.notFound)
        }
            return .success(item)
        }
        
        
        let result = chech(name)
        
        switch result {
        case let .failure(error):
            print("Ошибка: \(error)")
        case let .success(it):
            print("\(name): \(it.count) in stock")
            
        }
    }
    private func buy(_ name: String) -> Result<Product, MarketError> {
        
        guard var item = stock[name] else {
            return .failure(.notFound)
        }
        
        guard item.price <= depositAmount else {
            showBalance()
            return .failure(.notEnoughMoney(price: item.price))
        }
        
        guard item.count >= 1 else{
            return .failure(.outOfStuck)
        }
        
        depositAmount -= item.price
        item.count -= 1
        stock[name] = item
        
        return .success(item.product)
    }
    
    
    private func tryBuy(_ name: String) throws -> Product {
        guard var item = stock[name] else {
            throw MarketError.notFound
        }
        
        guard item.price <= depositAmount else {
            showBalance()
            throw MarketError.notEnoughMoney(price: item.price)
        }
        
        guard item.count >= 1 else{
            throw MarketError.outOfStuck
        }
        
        depositAmount -= item.price
        item.count -= 1
        stock[name] = item
        
        return item.product
    }
    
    //ниже две фукции с обработкой ошибок
    func order(name: String){
        let result = web.buy(name)

        switch result {
            case let .failure(error):
                print(error)
            case let .success(product):
                print("You order: \(product.name)")
        }
    }
    
    func tryOrder(name: String){
        do {
            print("You order: \(try web.tryBuy(name).name)")
            
        } catch MarketError.outOfStuck {
            print("Товар закончился")
        } catch MarketError.notFound{
            print(MarketError.notFound)
        } catch let error{
            print(error)
        }
    }
    
}


var web = BlackMarket()
web.deposit(amount: 10)

web.order(name: "Ice")
web.order(name: "Ice")
web.order(name: "Ice")

web.deposit(amount: 20)

web.order(name: "Ice")
web.order(name: "Ice")
web.order(name: "Ice")

web.showCount(name: "Ice")
web.showBalance()

web.deposit(amount: 5)

web.tryOrder(name: "Chips")
web.tryOrder(name: "Chips")

web.deposit(amount: 50)

web.tryOrder(name: "Chips")
web.tryOrder(name: "Chips")
web.tryOrder(name: "Chips")

web.showCount(name: "Ice")
web.showCount(name: "Chips")
web.showCount(name: "Pist")
