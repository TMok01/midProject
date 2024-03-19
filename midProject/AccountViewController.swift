//
//  AccountViewController.swift
//  midProject
//
import UIKit
class AccountViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var usernameLoginOutlet: UITextField!
    @IBOutlet weak var passwordLoginOutlet: UITextField!
    
    var check = ""
    var delegate : viewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameOutlet.delegate = self
        self.usernameOutlet.delegate = self
        self.passwordOutlet.delegate = self
        self.usernameLoginOutlet.delegate = self
        self.passwordLoginOutlet.delegate = self
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultOutlet.text = delegate.getCheck()
        nameOutlet.text = delegate.accountAccess().name
        usernameOutlet.text = delegate.accountAccess().username
        passwordOutlet.text = delegate.accountAccess().password
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func addedAction(_ sender: Any) {
        
       
        
       // delegate.updateAccountInfo(name: nameOutlet.text!, username: usernameOutlet.text!, password: passwordOutlet.text!)
       // delegate.accountCreated(answer: true)
       // resultOutlet.text = "Account Created!"
       // delegate.updateCheck(string: "Account Created")
       // delegate.firebaseAdd(userA: delegate.accountAccess())
        
        var cont = true
        if delegate.getUserList().count > 0{
            for i in 0...delegate.getUserList().count - 1{
                
                if usernameOutlet.text! == delegate.getUserList()[i].username{
                    cont = false
                    break
                }
                
                
            } //end for
        }
        
        
        
        
        
            if (cont == true) && (passwordOutlet.text!.count >= 10) && (usernameOutlet.text!.count >= 10) && (nameOutlet.text!.count != 0){
                
                
                delegate.updateAccountInfo(name: nameOutlet.text!, username: usernameOutlet.text!, password: passwordOutlet.text!)
                delegate.updateAccountMaxes(squat: 0, bench: 0, deadlift: 0, clean: 0)
                delegate.accountCreated(answer: true)
                resultOutlet.text = "Account Created!"
                delegate.updateCheck(string: "Account Created")
                delegate.firebaseAdd(userA: delegate.accountAccess())
                
                
            }
            else if (cont == false){
                
                let alert = UIAlertController(title: "Error", message: "Username taken", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
                
            }
            
            
            else if (passwordOutlet.text!.count <= 10){
                
                let alert = UIAlertController(title: "Error", message: "Password needs to be at least 10 characters", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
                
            }
            
            else if (usernameOutlet.text!.count <= 10){
                let alert = UIAlertController(title: "Error", message: "Username needs to be at least 10 characters", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
            }
            else if (nameOutlet.text!.count <= 0){
                let alert = UIAlertController(title: "Error", message: "Name needs to be at least 1 character", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
            }
         
        
        
        
        
    } //end add action
    
    
    @IBAction func logOutButton(_ sender: Any) {
     
        delegate.updateCheck(string: "Add Account")
        delegate.accountCreated(answer: false)
        delegate.maxesCreated(answer: false)
        delegate.logOut()
        resultOutlet.text = ""
        nameOutlet.text = delegate.accountAccess().name
        usernameOutlet.text = delegate.accountAccess().username
        passwordOutlet.text = delegate.accountAccess().password
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        let a = passwordLoginOutlet.text!
        let b = usernameLoginOutlet.text!
        var cont = false
        for i in 0...delegate.getUserList().count-1{
            
            if (a == delegate.getUserList()[i].password) && (b == delegate.getUserList()[i].username){
                let x = delegate.getUserList()[i]
                delegate.updateAccountInfo(name: x.name, username: x.username, password: x.password)
                delegate.updateAccountMaxes(squat: x.squat, bench: x.bench, deadlift: x.deadlift, clean: x.clean)
                delegate.setKey(Key: x.key)
                delegate.updateCheck(string: "Signed in")
                delegate.maxesCreated(answer: true)
                delegate.accountCreated(answer: true)
                resultOutlet.text = delegate.getCheck()
                nameOutlet.text = delegate.accountAccess().name
                usernameOutlet.text = delegate.accountAccess().username
                passwordOutlet.text = delegate.accountAccess().password
                cont = true
                break
            }
            
        }
        if cont == false{
            let alert = UIAlertController(title: "Error", message: "Invalid password or username", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            
        }
        
    } //end loginaction
    
    
    
    
    
    
    
} //end vc

