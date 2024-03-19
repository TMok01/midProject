//
//  ViewController.swift
//  midProject
//
import UIKit
import FirebaseCore
import FirebaseDatabase
protocol viewControllerDelegate {
    
    func setKey(Key: String)
    
    func logOut()
    
    func getUserList() -> [User]
    
    func getTopScores() -> (name: [String], total: [Int])
    
    func firebaseUpdate(userA: User)
    
    func firebaseAdd(userA: User)
    
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
    func setKey(Key: String) {
        accountKey = Key
        defaults.set(accountKey, forKey: "acc")
        account.key = accountKey
    }
    
    func logOut() {
        account = User(name: "", bench: 0, squat: 0, deadlift: 0, clean: 0, username: "", password: "")
        accountKey = ""
        defaults.set(accountKey, forKey: "acc")
        loginOutlet?.setTitle("Login", for: .normal)
    }
    
    
    func getUserList() -> [User] {
        return users
    }
    
    func getTopScores() -> (name: [String], total: [Int]) {
        
        var leaderboardAmount = 15
        
        if users.count < 15{
            leaderboardAmount = users.count
        }
        
        
        
        
        var arrayName = [String]()
        var arrayTotal = [Int]()
        //print(users.count)
        
        
        for i in users{
            arrayName.append(i.name)
            arrayTotal.append(i.bench + i.clean + i.squat + i.deadlift)
        }
        
        
        var tempName = [String]()
        var tempTotal = [Int]()
        var check = 0
        var position = 0
        for c in 0...leaderboardAmount-1{
            
            for i in 0...arrayName.count-1{
                
                if arrayTotal[i] > check{
                    check = arrayTotal[i]
                    position = i
                }
                
                
            }
            tempName.append(arrayName[position])
            tempTotal.append(arrayTotal[position])
            arrayName.remove(at: position)
            arrayTotal.remove(at: position)
            position = 0
            check = 0
        }
        
        arrayName = tempName
        arrayTotal = tempTotal
        
        
       return (arrayName, arrayTotal)
        
    } //end getTopScores
    
    
    func firebaseUpdate(userA: User) {
        let dict = ["squat": account.squat, "bench": account.bench, "deadlift": account.deadlift, "clean":account.clean]
        userA.updateFirebase(dict: dict)
    }
    
    func firebaseAdd(userA: User) {
        userA.saveToFireBase()
        defaults.set(userA.key, forKey: "acc")
        
        
    }
    
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
        account.deadlift = deadlift
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
    var ref: DatabaseReference!
    var users = [User]()
    let defaults = UserDefaults.standard
    var accountKey = ""
    @IBOutlet weak var loginOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        
        
        
        ref.child("user").observe(.childAdded, with: { (snapshot) in
            
            
            let n = snapshot.value as! [String: Any]
            let o = User(dict: n)
            o.key = snapshot.key
            self.users.append(o)
            
            
            
                if o.key == self.accountKey{
                    self.account = o
                    self.accountMade = true
                    self.maxesLogged = true
                    self.loginOutlet?.setTitle(self.account.name, for: .normal)
                    
                }
            
            
            
        })
        
        
        
        ref.child("user").observe(.childChanged, with: { (snapshot) in
            
            let n = snapshot.value as! [String: Any]
            let o = User(dict: n)
            o.key = snapshot.key
            
            for i in 0...self.users.count{
                if o.key == self.users[i].key{
                    self.users[i] = o
                    break
                }
                
            }
            
           
            
            
        })
        
        if let user = defaults.string(forKey: "acc"){
            accountKey = user
            
        }
       
        
        
       
        
        
        
    } //end viewdidload
    
    
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

