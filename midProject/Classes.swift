//
//  Classes.swift
//  midProject
//
//  Created by TYLER MOK on 3/7/24.
//

import Foundation



public class User{
    
    var name: String
        var bench: Int
        var squat: Int
        var deadlift: Int
        var clean: Int
        var username: String
        var password: String
            
        public init(name: String, bench: Int, squat: Int, deadlift: Int, clean: Int, username: String, password: String) {
            self.name = name
            self.bench = bench
            self.squat = squat
            self.deadlift = deadlift
            self.clean = clean
            self.username = username
            self.password = password
        }
            
        }
         
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
