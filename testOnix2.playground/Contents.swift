import Cocoa

extension Vector: CustomStringConvertible {
    var description: String {
//        let newX = String(format: "%.2f", x)
//        let newY = String(format: "%.2f", y)
//        let newZ = String(format: "%.2f", z)
        return "(\(x), \(y), \(z))"
    }
}

class Vector {
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    func length() -> Double {
        return sqrt(pow(self.x, 2) + pow(self.y, 2) + pow(self.z, 2))
    }
    
    func scalar(v: Vector) -> Double {
        return (self.x * v.x) + (self.y * v.y) + (self.z * v.z)
    }
    
    func product(v: Vector) -> Vector {
        let newX = (self.y * v.z) - (self.z * v.y)
        let newY = (self.z * v.x) - (self.x * v.z)
        let newZ = (self.x * v.y) - (self.y * v.x)
        return Vector(x: newX, y: newY, z: newZ)
    }
    
    func angle(v: Vector) -> Double {
        return self.scalar(v: v) / (self.length() * v.length())
    }
    
    func sum(v: Vector) -> Vector {
        return Vector(x: self.x + v.x, y: self.y + v.y, z: self.z + v.z)
    }
    
    func diff(v: Vector) -> Vector {
        return Vector(x: self.x - v.x, y: self.y - v.y, z: self.z - v.z)
    }
    
    static func getVectors(N: Int) -> Array<Vector> {
        var vectors: [Vector] = []
        if N <= 0 {
            return vectors
        }
        var newX = 0.0
        var newY = 0.0
        var newZ = 0.0
        for _ in 1...N {
            newX = Double.random(in: 10.0 ..< 100.0)
            newY = Double.random(in: 20.0 ..< 110.0)
            newZ = Double.random(in: 30.0 ..< 120.0)
            vectors.append(Vector(x: newX, y: newY, z: newZ))
        }
        
        return vectors
    }
}

var vectors = Vector.getVectors(N: 2)
print("vectors:", vectors)
var v1 = vectors.first!
var v2 = vectors.last!

print("v1 length:", v1.length())
print("v2 length:", v2.length())
print("scalar:", v1.scalar(v: v2))
print("product v1:", v1.product(v: v2))
print("product v2:", v2.product(v: v1))
print("angle:", v1.angle(v: v2))
print("sum:", v1.sum(v: v2))
print("diff v1-v2:", v1.diff(v: v2))
print("diff v2-v1:", v2.diff(v: v1))
