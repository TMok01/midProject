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
    
    func accountAccess() -> User
    
    func updateAccountInfo(name: String, username: String, password: String)
    
    func updateAccountMaxes(squat: Int, bench: Int, deadlift: Int, clean: Int)
    
    func maxesCreated(answer: Bool)
    
    func maxesValue() -> Bool
    
}
class ViewController: UIViewController, viewControllerDelegate {
    func maxesValue() -> Bool {
        return maxesLogged
    }
    
    
    func maxesCreated(answer: Bool) {
        maxesLogged = answer
    }
    
    
    func updateAccountInfo(name: String, username: String, password: String) {
        account.name = name
        account.password = password
        account.username = username
    }
    
    func updateAccountMaxes(squat: Int, bench: Int, deadlift: Int, clean: Int) {
        account.bench = bench
        account.squat = squat
        account.deadlift = squat
        account.clean = clean
    }
    
    func accountAccess() -> User {
        return account
    }
    
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
    
    var maxesLogged = false
    var check = ""
    var accountMade = false
    var account = User(name: "", bench: 0, squat: 0, deadlift: 0, clean: 0, username: "", password: "")
    @IBOutlet weak var loginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if accountMade == true{
            loginOutlet?.setTitle(account.name, for: .normal)
        }
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
    
    
    
    
    
    
    
}//end vc
