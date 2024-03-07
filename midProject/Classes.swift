//
//  Classes.swift
//  midProject
//
//  Created by TYLER MOK on 3/7/24.
//

import Foundation

public class Classes {
    
    var name: String
    var weight: Double
    var bench: Int
    var squat: Int
    var deadlift: Int
    var clean: Int
        
    public init(name: String, weight: Double, bench: Int, squat: Int, deadlift: Int, clean: Int) {
            self.name = name
            self.weight = weight
            self.bench = bench
            self.squat = squat
            self.deadlift = deadlift
            self.clean = clean
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
        var maintenance: Double
        
        public init(weight: Double, exercise: ExerciseAmount, goalWeight: Double, days: Double) {
            self.days = days
            self.weight = weight
            self.exercise = exercise
            self.goalWeight = goalWeight
            var maintenance1 = (weight * 10 * selectedExercise(type: exercise))
            var maintenace2 = ((weight - goalWeight) * 3500)/days
            
            maintenance = round(maintenance1 - maintenace2)
            
            
        }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
