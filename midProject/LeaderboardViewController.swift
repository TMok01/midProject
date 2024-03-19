//
//  LeaderboardViewController.swift
//  midProject
//
import UIKit
class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        var field = "Name: \(nameArray[indexPath.row]), Maxes: \(totalArray[indexPath.row])"
        cell.textLabel?.text = field
        return cell
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    
    var delegate : viewControllerDelegate!
    var nameArray = [String]()
    var totalArray = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
       
       
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameArray = delegate.getTopScores().name
        totalArray = delegate.getTopScores().total
        tableViewOutlet.reloadData()
       
        
        
        
    }
    
    
    
        
    
    
    
    
    
    
    
}

