//
//  WorkoutsViewController.swift
//  midProject
//
//  Created by TYLER MOK on 3/6/24.
//
import UIKit
class WorkoutsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    var delegate : viewControllerDelegate!
    
    var workoutsArray = ["Push/Pull", "Upper/Lower"]
    var selectedPlan = ""
    
    var upperMain = ["Bench Press", "Incline Bench"]
    var biceps = ["Cable Curls", "Hammer Curls",]
    var triceps = [""]
    var shoulders = [""]
    var back = ["Rows", "Pull-Ups"]
    
    var lowerMain = ["Squat", "Deadlift", "Front Squat"]
    
    
    
    @IBOutlet weak var pickerOutlet: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return workoutsArray.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectedPlan = workoutsArray[row]
            selectedLabel.text = selectedPlan
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return workoutsArray[row]
        }
        return ""
    }
    
    
    }
