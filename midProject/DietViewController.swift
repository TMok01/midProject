//
//  ViewController.swift
//  testMidApp
//
//  Created by OLIVER MURRAY on 3/6/24.
//
import UIKit
class DietViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var delegate: viewControllerDelegate!
    
    @IBOutlet weak var weightOutlet: UITextField!
    @IBOutlet weak var goalOutlet: UITextField!
    @IBOutlet weak var daysOutlet: UITextField!
    
    
    @IBOutlet weak var pickerOutlet: UIPickerView!
    
    @IBOutlet weak var maintenanceLabel: UILabel!
    
    @IBOutlet weak var proteinLabel: UILabel!
    
    var user = Diet(weight: 1, exercise: .none, goalWeight: 1, days: 1)
   // var user:
    var selectedType: ExerciseAmount = .none
    var exerciseLevels = [ExerciseAmount]()
    var show = ["none", "light", "active"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerOutlet.delegate = self
       // print(user.maintenance)
        exerciseLevels.append(.none)
        exerciseLevels.append(.light)
        exerciseLevels.append(.active)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return exerciseLevels.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectedType = exerciseLevels[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return show[row]
        }
        return ""
    }
    
    @IBAction func submitAction(_ sender: Any) {
        if let a = Double(weightOutlet.text!){
            if let b = Double(goalOutlet.text!){
                if let c = Double(daysOutlet.text!){
                    
                    
                    var d = selectedType
                    user = Diet(weight: a, exercise: d, goalWeight: b, days: c)
                    
                    if user.maintenance < 0{
                        maintenanceLabel.text = "Not possible"
                    }
                    else{
                        //maintenanceLabel.text = String(user.maintenance)
                        maintenanceLabel.text = "Calories Daily: \(user.maintenance)"
                    }
                    proteinLabel.text = "Protein Daily: \(user.protein)"
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "Enter Valid Days", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    
                    alert.addAction(okAction)
                    
                    present(alert, animated: true, completion: nil)
                }
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Enter Valid Goal", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
            }
            
            
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Enter Valid Weight", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        
       
        
        
        
        
    }
    
    
}
