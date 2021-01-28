import UIKit


func even (x: Int) -> Bool{
    if x%2 == 0 {
        return true
    }
    else{
        return false
    }
    
}

func checkThree (_ x: Int) -> Bool{
    if x%3 == 0 {
        return true
    }
    else{
        return false
    }
    
}

var arrUp: [Int] = [];

for i in 0..<100 {
    arrUp.append(i);
}

arrUp

for i in stride(from: arrUp.count - 1, through: 0, by: -1){
    if even(x: arrUp[i]) || !checkThree(arrUp[i]){
        arrUp.remove(at:i)
    }
}

arrUp


//Быстро написано но тупо
func fib(_ x: Int) -> Int{
    if x < 2 {
        return x
    }
    return fib(x - 1) + fib(x - 2)
}

func fibS(x:Int) -> Double{
    //F(n)
    var a: Double = 1;
    //F(n-1)
    var b: Double = 0;
    
    for _ in 0..<x{
        a += b;
        b = a - b;
    }
    return b;
}

var arrFib: [Double] = [];
for i in 0..<100 {

    arrFib.append(fibS(x: i))
}
arrFib



