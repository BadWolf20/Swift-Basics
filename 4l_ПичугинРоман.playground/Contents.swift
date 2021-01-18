import UIKit



class car{
    static var numberOfAllCars: Int = 0 // количество машин всего
    
    // статус двигателя
    enum CarEngineState: String{
        case on = "Двигатель запушен"
        case off = "двигатель выключен"
    }

    // статус окон
    enum CarWindowsState: String{
        case open = "Окна открыты"
        case close = "Окна закрыты"
    }

    // возможности дейсвий с багажником
    enum CarTrunkAction{
        case put(Int)
        case take(Int)
    }
    
    var mark: String
    var year: Int
    var trunkVolume: Int
    var engineState: CarEngineState
    var windowsState: CarWindowsState
    var trunkIn: Int
    var plate: String = ""
    

    // инициализация параметров
    init(mark: String, year: Int, trunkVolume: Int, engineState: CarEngineState, windowsState: CarWindowsState, trunkIn: Int) {
        self.mark = mark
        self.year = year
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowsState = windowsState
        self.trunkIn = trunkIn
    }
    
    // запуск двигателя
    func changeEngineState(to state: CarEngineState) {
            self.engineState = state
    }
    
    // работа с окнами
    func changeWindowsState(to state: CarWindowsState){
        self.windowsState = state
    }

    // действия с багажником
    func performTrunkAction(action act: CarTrunkAction){
        switch act {
        case .put(let w):
            guard self.trunkIn + w <= self.trunkVolume else {
                return
            }
            self.trunkIn += w;
        case .take(let w):
            if self.trunkIn - w > 0{
                self.trunkIn -= w
            }
            else {
                self.trunkIn = 0
            }
            
        }
    }
    
    
    // выдача номерного знака, на основе общего количесва машин
    static func getCarPlate() -> String{ // метод для дальнейшего переопределения
        car.numberOfAllCars += 1
        return "C_\(numberOfAllCars)"
    }

    
    func printType() {    //не предумал какую функцию переопределить
        print("Класика")
    }
}

class sportCar: car{
    static var numberOfSportCars: Int = 0 // количество спортивных машин
    
    // статус системы подачи nitro
    enum NitroSystemState{
        case active
        case deactive
    }
    
    var nitroState: NitroSystemState
    
    // инициализация параметров
    init(nitroState: NitroSystemState, mark: String, year: Int, trunkVolume: Int, engineState: CarEngineState, windowsState: CarWindowsState,trunkIn: Int) {
        self.nitroState = nitroState
        super.init(mark: mark, year: year, trunkVolume: trunkVolume, engineState: engineState, windowsState: windowsState,trunkIn: trunkIn)
        
        sportCar.numberOfSportCars += 1
    }

    // управление системой nitro
    func changeNitroState(to state: NitroSystemState) {
        self.nitroState = state
    }

    // выдача номерного знака, на основе количесва спортивных машин
    static func getSportPlate() -> String{
        return "SC \(self.numberOfSportCars)"
    }
    
   override func printType() {
        print("Спортивные машины")
    }
}

class trunkCar: car{
    static var numberOfTrunkCar: Int = 0 // количесвто грузовых машин
    
    //статус прицена
    enum trailerState: String{
        case attracepted = "прицеплен"
        case unlinked = "отцеплен"
    }
    
    var trailer: trailerState
    
    // инициализация параметров
    init(trailer: trailerState, mark: String, year: Int, trunkVolume: Int, engineState: CarEngineState, windowsState: CarWindowsState,trunkIn: Int) {
        self.trailer = trailer
        super.init(mark: mark, year: year, trunkVolume: trunkVolume, engineState: engineState, windowsState: windowsState,trunkIn: trunkIn)
        trunkCar.numberOfTrunkCar += 1
    }

    //управление прицепом
    func changeTrailerState(to state: trailerState) {
        self.trailer = state
    }
    
    // выдача номерного знака, на основе количесва грузовых машин
    static func getSportPlate() -> String{ // метод для дальнейшего переопределения
        return "SC \(self.numberOfTrunkCar)"
    }
    
    override func printType() {
         print("Грузовые машины")
     }
}

var sCar = sportCar(nitroState: .deactive, mark: "Ferrari", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .close, trunkIn: 0)
sCar.plate = sportCar.getSportPlate()
sCar.plate

sCar.changeNitroState(to: .active)
sCar.nitroState

sCar.changeEngineState(to: .on)
sCar.windowsState.rawValue

var sCar1 = sportCar(nitroState: .deactive, mark: "Ferrari", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .close, trunkIn: 0)
sCar1.plate = sportCar.getSportPlate()
sCar1.plate





var car1 = car(mark: "Ford", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .open, trunkIn: 0)
car1.plate = car.getCarPlate()
car1.plate

var car2 = car(mark: "Ford", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .open, trunkIn: 0)
car2.plate = car.getCarPlate()
car2.plate


var tCar1 = trunkCar(trailer: .attracepted, mark: "Scania", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .open, trunkIn: 0)
tCar1.plate = car.getCarPlate()
tCar1.plate

var tCar2 = trunkCar(trailer: .unlinked, mark: "Scania", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .open, trunkIn: 0)
tCar2.plate = car.getCarPlate()
tCar2.plate

tCar2.changeTrailerState(to: .attracepted)
tCar2.trailer.rawValue


tCar2.printType()
sCar.printType()
car2.printType()

var car3 = car(mark: "Ford", year: 2020, trunkVolume: 15, engineState: .on, windowsState: .open, trunkIn: 0)
car3.plate = car.getCarPlate()
car3.plate
