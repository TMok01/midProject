//
//  AccountViewController.swift
//  midProject
//
//  Created by TYLER MOK on 3/6/24.
//
import UIKit
class AccountViewController: UIViewController {
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var resultOutlet: UILabel!
    
    var check = ""
    var delegate : viewControllerDelegate!
    
    var account = Classes(name: "John Doe", bench: 0, squat: 0, deadlift: 0, clean: 0, username: "", password: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultOutlet.text = delegate.getCheck()
        print(delegate.getCheck())
    }
    
    
    
    @IBAction func addedAction(_ sender: Any) {
        
        account = Classes(name: nameOutlet.text!, bench: 0, squat: 0, deadlift: 0, clean: 0, username: usernameOutlet.text!, password: passwordOutlet.text!)
        delegate.accountCreated(answer: true)
        resultOutlet.text = "Account Created!"
        delegate.updateCheck(string: "Account Created")
         
    }
    
   
}
