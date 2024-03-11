//
//  PmViewController.swift
//  midProject
//
//  Created by TYLER MOK on 3/6/24.
//
import UIKit
class PmViewController: UIViewController {
    var delegate : viewControllerDelegate!
    
    @IBOutlet weak var squatOutlet: UITextField!
    @IBOutlet weak var benchOutlet: UITextField!
    @IBOutlet weak var deadliftOutlet: UITextField!
    @IBOutlet weak var cleanOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if delegate.maxesValue() == true{
            squatOutlet.text = "Squat: \(delegate.accountAccess().squat)"
            benchOutlet.text = "bench: \(delegate.accountAccess().bench)"
            deadliftOutlet.text = "Deadlift: \(delegate.accountAccess().deadlift)"
            cleanOutlet.text = "Clean: \(delegate.accountAccess().clean)"
        }
    }
    
    
    
    @IBAction func updateAction(_ sender: Any) {
        
        
        if let squat = Int(squatOutlet.text!){
            if let bench = Int(benchOutlet.text!){
                if let deadlift = Int(deadliftOutlet.text!){
                    if let clean = Int(cleanOutlet.text!){
                        delegate.updateAccountMaxes(squat: squat, bench: bench, deadlift: deadlift, clean: clean)
                        delegate.maxesCreated(answer: true)
                    } //if let clean
                    else{
                        let alert = UIAlertController(title: "Error", message: "Enter Valid Clean", preferredStyle: .alert)
                        
                        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                        
                        alert.addAction(okAction)
                        
                        present(alert, animated: true, completion: nil)
                    }
                } //if let deadlift
                else{
                    let alert = UIAlertController(title: "Error", message: "Enter Valid Deadlift", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                    
                    alert.addAction(okAction)
                    
                    present(alert, animated: true, completion: nil)
                }
            } //if let bench
            else{
                let alert = UIAlertController(title: "Error", message: "Enter Valid Bench", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
            }
            
            
        } //if let squat
        else{
            let alert = UIAlertController(title: "Error", message: "Enter Valid Squat", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
   
    
    
    
} //end vc
