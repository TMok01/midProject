//
//  ViewController.swift
//  midProject
//
//  Created by TYLER MOK on 3/5/24.
//
import UIKit
protocol viewControllerDelegate {
    
    func accountCreated(answer: Bool)
        
    func updateCheck(string: String)
        
    func getCheck() -> String
    
    
}

class ViewController: UIViewController, viewControllerDelegate {
    func updateCheck(string: String) {
        check = string
    }
    
    func getCheck() -> String {
        return check
    }
    
    var delegate : viewControllerDelegate!
    
    func accountCreated(answer: Bool) {
        accountMade = answer
    }
    
    var check = ""
    var accountMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "accountSegue"{
           
        let nvc = segue.destination as! AccountViewController
            nvc.delegate = self
        }
        else if accountMade == true{
             if segue.identifier == "workoutSegue"{
                let nvc = segue.destination as! WorkoutsViewController
                nvc.delegate = self
            }
            else if segue.identifier == "dietSegue"{
                let nvc = segue.destination as! DietViewController
                nvc.delegate = self
            }
            else if segue.identifier == "maxesSegue"{
                
                let nvc = segue.destination as! PmViewController
                nvc.delegate = self
                
            }
            else if segue.identifier == "leaderboardSegue"{
                let nvc = segue.destination as! LeaderboardViewController
                nvc.delegate = self
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Create Account first", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    } //end preparefor
    
    
    
    
    
    
    
}

