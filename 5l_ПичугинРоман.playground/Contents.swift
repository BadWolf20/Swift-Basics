import UIKit


enum Action {
    case openWindow
    case closeWindow
    case openDoor
    case closeDoor
    case loadTank
    case unloadTank
    case activateNitro
    case deactivateNitro
}
enum OpenClose {
    case open
    case close
}

// хранение переменных
struct DefaultStates {
    var stateWindows: OpenClose = .close
    var stateDoors: OpenClose = .close
}

// Протокол машин
protocol Car {

    var defaultStates: DefaultStates { get set }
    var stateWindows: OpenClose { get set }
    var stateDoors: OpenClose { get set }
    
    mutating func performAction(act action: Action)
}

extension Car {
    var stateWindows: OpenClose {
        get {
            return defaultStates.stateWindows
        }
        
        set {
            defaultStates.stateWindows = newValue
        }
    }
    var stateDoors: OpenClose {
        get {
            return defaultStates.stateDoors
        }
        
        set {
            defaultStates.stateDoors = newValue
        }
    }
    
    
    // открыть окна
    mutating func openWindows() {
        self.stateWindows = .open
    }

    //закрыть окна
    mutating func closeWindows() {
        self.stateWindows = .close
    }

    //открыть двери
    mutating func openDoors() {
        self.stateDoors = .open
    }

    //закрыть двети
    mutating func closeDoors() {
        self.stateDoors = .close
    }
    
    
    mutating func performAction(act action: Action) {

        switch action {
        case .openWindow:
            self.stateWindows = .open
        case .closeWindow:
            self.stateWindows = .close
        case .openDoor:
            self.stateDoors = .open
        case .closeDoor:
            self.stateDoors = .close
        default:
            break
        }
    }
}

// класс грузовика
class TrunkCar: Car {

    var defaultStates: DefaultStates = DefaultStates()
    
    enum StateTank {
        case empty
        case full
    }
 
    var stateTrunkTank: StateTank = .empty
    
    // загрузка / разгрузка
    func performAction(act action: Action) {
        switch action {
        case .loadTank:
            stateTrunkTank = .full
            print("Loading tank")
        case .unloadTank:
            stateTrunkTank = .empty
            print("Unloading tank")
        default:
            
        break
        }
    }
}


extension TrunkCar: CustomStringConvertible {
    
    var description: String {
        return "Tank (Empty/Full): \(self.stateTrunkTank)"
    }
}

// класс спортирной машины
class SportCar: Car {

    var defaultStates: DefaultStates = DefaultStates()
    
    enum NitroSystemState{
        case active
        case deactive
    }
    
    var nitroSystemState: NitroSystemState = .deactive

    // система ускорения
    func performAction(act action: Action) {
        switch action {
        case .activateNitro:
            nitroSystemState = .active
            print("Activating nitro")
        case .deactivateNitro:
            nitroSystemState = .deactive
            print("Deactivating nitro")
        default:
       
        break
        }
    }
}


extension SportCar: CustomStringConvertible {

    var description: String {
        return "Nitro System state (active/deactive): \(self.nitroSystemState)"
    }
}

var sportCar = SportCar()
sportCar.performAction(act: .activateNitro)
sportCar.openWindows()
sportCar.performAction(act: .deactivateNitro)
sportCar.description

var trunkCar = TrunkCar()
trunkCar.performAction(act: .openWindow)
trunkCar.stateDoors
trunkCar.performAction(act: .loadTank)
trunkCar.performAction(act: .unloadTank)
trunkCar.openWindows()
trunkCar.openDoors()
trunkCar.description


