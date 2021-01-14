import UIKit


struct SportCar{
    enum SportCarEngineState: String{
        case on = "Двигатель запушен"
        case off = "двигатель выключен"
    }

    enum SportCarWindowsState: String{
        case open = "Окна открыты"
        case close = "Окна закрыты"
    }

    enum SportCarTrunkAction: String{
        case put = "Положить в багажник"
        case take = "Взять из багажника"
    }

    let mark: String
    let year: Int
    let trunkVolume: Int
    var engineState: SportCarEngineState
    var windowsState: SportCarWindowsState
    var trunkIn: Int
    
    mutating func startEngine(){
        self.engineState = .on
    }
    mutating func stopEngine(){
        self.engineState = .off
    }
    
    mutating func openWindows(){
        self.windowsState = .open
    }
    
    mutating func closeWindows(){
        self.windowsState = .close
    }
    
    mutating func trunkPut(w: Int){
        guard self.trunkIn + w <= self.trunkVolume else {
            return
        }
        self.trunkIn += w;
        
    }
    
    mutating func trunkTake(w: Int){
        if self.trunkIn - w > 0{
            self.trunkIn -= w
        }
        else {
            self.trunkIn = 0
        }
        
    }
}



var car1 = SportCar(mark: "Ferrari", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .open, trunkIn: 0)
var car2 = SportCar(mark: "Ferrari", year: 2018, trunkVolume: 15, engineState: .off, windowsState: .close, trunkIn: 10)
var car3 = SportCar(mark: "Maserati", year: 2021, trunkVolume: 35, engineState: .off, windowsState: .close, trunkIn: 5)
var car4 = SportCar(mark: "Maserati", year: 2019, trunkVolume: 35, engineState: .on, windowsState: .close, trunkIn: 15)

car1.closeWindows()
car2.startEngine()
car3.trunkPut(w: 10)
car3.trunkIn
car4.trunkTake(w: 20)
car4.trunkIn;
