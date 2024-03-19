//
//  PmViewController.swift
//  midProject
//
import UIKit
class PmViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    var delegate : viewControllerDelegate!
    
    @IBOutlet weak var squatOutlet: UITextField!
    @IBOutlet weak var benchOutlet: UITextField!
    @IBOutlet weak var deadliftOutlet: UITextField!
    @IBOutlet weak var cleanOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.squatOutlet.delegate = self
        self.benchOutlet.delegate = self
        self.deadliftOutlet.delegate = self
        self.cleanOutlet.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if delegate.maxesValue() == true{
            squatOutlet.text = "\(delegate.accountAccess().squat)"
            benchOutlet.text = "\(delegate.accountAccess().bench)"
            deadliftOutlet.text = "\(delegate.accountAccess().deadlift)"
            cleanOutlet.text = "\(delegate.accountAccess().clean)"
        }
    }
    
    
    
    @IBAction func updateAction(_ sender: Any) {
        
        
        if let squat = Int(squatOutlet.text!){
            if let bench = Int(benchOutlet.text!){
                if let deadlift = Int(deadliftOutlet.text!){
                    if let clean = Int(cleanOutlet.text!){
                        
                        delegate.updateAccountMaxes(squat: squat, bench: bench, deadlift: deadlift, clean: clean)
                        delegate.maxesCreated(answer: true)
                        delegate.firebaseUpdate(userA: delegate.accountAccess())
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

