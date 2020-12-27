import UIKit

func equation (a: Double, b: Double, c: Double){
    var d: Double;
    var x: Double;

    d = pow(b,2)-(4*a*c);
    print(String(Int(a)) + "x^2 + " + String(Int(b)) + "x + " + String(Int(c)) + " = 0");
    
    if d == 0 {
        x = -b/(2*a);
        x = round(100*x)/100;
        print("X = " + String(x));
    }
    else if (d > 0){
        x = (-b + sqrt(d))/(2*a);
        x = round(100*x)/100;
        print("X1 = " + String(x));
        
        x = (-b - sqrt(d))/(2*a);
        x = round(100*x)/100;
        print("X2 = " + String(x));
    }
    else{
        print("Нет решений. D<0")
    }
    
}


func triangle (a: Double, b: Double){
    var S: Double;
    var c: Double;
    var P: Double;
    print("Катет a = " + String(Int(a)));
    print("Катет a = " + String(Int(b)));
    
    S = (a * b)/2;
    c = sqrt(pow(a, 2) + pow(b, 2));
    c = round(10*c)/10;
    P = a + b + c;
    print("Площадь: " + String(S));
    print("Гипотенуза: " + String(c));
    print("Периметр: " + String(P));
}

func bank(sum:Double, percent: Double, year: Int) -> Double{
    print("Вы сделали вклад на сумму: " + String(sum));
    print("Срок: " + String(year))
    print("Годовой процент: " + String(percent) + "%");
    print("Накопления составят: ")
    var cap: Double = sum;
    let index: Double = 1 + (percent/100);
    
    for _ in 1...year {
        cap *= index;
    }
    return cap;
}

print("Уравнение")
equation(a: 1, b: -70, c: 600);
print("--");

print("Треугольник")
triangle(a: 4, b: 5);
print("--");

print("Банк");
print(String(format: "%.2f",bank(sum: 10000, percent: 2, year: 5)));


