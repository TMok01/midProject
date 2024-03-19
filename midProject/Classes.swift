//
//  Classes.swift
//  midProject
//
import Foundation
import FirebaseCore
import FirebaseDatabase
public class User{
    
    var name: String
        var bench: Int
        var squat: Int
        var deadlift: Int
        var clean: Int
        var username: String
        var password: String
        var key = ""
        var ref = Database.database().reference()
            
        public init(name: String, bench: Int, squat: Int, deadlift: Int, clean: Int, username: String, password: String) {
            self.name = name
            self.bench = bench
            self.squat = squat
            self.deadlift = deadlift
            self.clean = clean
            self.username = username
            self.password = password
        }
           
    
    init(dict: [String: Any]){
        
        if let c = dict["name"] as? String{
            name = c
        }
        else{
            name = ""
        }
        
        if let n = dict["bench"] as? Int{
            bench = n
        }
        else{
            bench = 0
        }
        
        if let x = dict["squat"] as? Int{
            squat = x
        }
        else{
            squat = 0
        }
        
        if let d = dict["deadlift"] as? Int{
            deadlift = d
        }
        else{
            deadlift = 0
        }
        
        if let o = dict["clean"] as? Int{
            clean = o
        }
        else{
            clean = 0
        }
        if let p = dict["password"] as? String{
            password = p
        }
        else{
            password = ""
        }
        
        if let u = dict["username"] as? String{
            username = u
        }
        else{
            username = ""
        }
        
    }
    
    
    
    
    func saveToFireBase(){
        let dict = ["name": name, "bench": bench, "squat": squat, "deadlift": deadlift, "clean": clean, "username": username, "password": password] as [String: Any]
        var blah = ref.child("user").childByAutoId()
        ref.child("user").child(blah.key!).setValue(dict)
        key = blah.key!
    }
    
    
    
    func updateFirebase(dict: [String: Any]){
      
            ref.child("user").child(key).updateChildValues(dict)
        }
    
    
    
        } //User end
         
            public enum ExerciseAmount {
                case none
                case light
                case active
        }
        func selectedExercise(type: ExerciseAmount) -> Double {
          switch type {
            case .light:
              return 1.2
            case .active:
              return 1.3
            case .none:
              return 1.1
            }
            
            
            
        }
        public class Diet {
            
            var days: Double
            var weight: Double
            var exercise: ExerciseAmount
            var goalWeight: Double
            var maintenance: Int
            var protein: Int
            
            public init(weight: Double, exercise: ExerciseAmount, goalWeight: Double, days: Double) {
                self.days = days
                self.weight = weight
                self.exercise = exercise
                self.goalWeight = goalWeight
                let maintenance1 = (weight * 10 * selectedExercise(type: exercise))
                let maintenace2 = ((weight - goalWeight) * 3500)/days
                let x = (maintenance1 - maintenace2)
                let y = Int(x)
                maintenance = Int(y)
                protein = Int((weight * selectedExercise(type: exercise)))
                
            }
        
   
        
    }

public class Workout {
    
    var day: String
    var ex1: String
    var ex2: String
    var ex3: String
    var ex4: String
    var ex5: String
    
    public init(day: String, ex1: String, ex2: String, ex3: String, ex4: String, ex5: String) {
        self.day = day
        self.ex1 = ex1
        self.ex2 = ex2
        self.ex3 = ex3
        self.ex4 = ex4
        self.ex5 = ex5
    }
    
    
    
    
    
}



