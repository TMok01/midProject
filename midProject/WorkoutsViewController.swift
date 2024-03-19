//
//  WorkoutsViewController.swift
//  midProject
//
import UIKit
class WorkoutsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutToday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        let field = "\(workoutToday[indexPath.row])"
        cell.textLabel?.text = field
        return cell
    }
    
    
    
    
    var delegate : viewControllerDelegate!
    
    var workoutsArray = ["Push/Pull/Legs", "Upper/Lower"]
    var selectedPlan = ""
    var currentWeek = [String]()
    var upperMain = ["Bench Press", "Incline Bench"]
    var biceps = ["Cable Curls", "Hammer Curls",]
    var triceps = ["Tricep Extension", "Skull Crushers", "Dips"]
    var shoulders = ["Dumbell Flys", "Military Press"]
    var upperExtra = ["Pullover", "Dumbell Incline Bench", "Dumbell Bench"]
    
    var back = ["Lat Pull Down", "Pull-Ups"]
    var repsSets = ["4x6", "3x5", "4x12", "5x5"]
    var dayCount = 0
    
    var rows = ["Pendley Rows", "Dumbell Rows"]
    var pullExtra = ["Reverse Curls", "Barbell Wrist Curls", "Dumbell Shrugs", "Lateral Raise"]
    
    
    var pullMain = ["Deadlift"]
    var lowermainPPL = ["Squat", "Front Squat"]
    var lowerMain = ["Squat", "Deadlift", "Front Squat"]
    var lowersquats = ["Bulgarian Split Squats", "Reverse Bar-Bell Lunge"]
    var hamstrings = ["RDL's", "Hamstring Curl"]
    var hips = ["Hip Abductor", "Glute Bridges", "Hip Thrusts"]
    var extraLegs = ["Box jumps", "Knee Extensions"]
    var weeksWorkout = [Workout]()
    
    var workoutToday = [String]()
    
    
    @IBOutlet weak var pickerOutlet: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var dayOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        pickerOutlet.delegate = self
        // Do any additional setup after loading the view.
        currentWeek = getDaysOfTheWeekStartingFromToday()
        dayOutlet.text = "Day: \(currentWeek[dayCount])"
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
            //set workout in here
            selectedPlan = workoutsArray[row]
            selectedLabel.text = selectedPlan
            workoutToday.removeAll()
            generateWorkouts(selectedType: selectedPlan)
            
            workoutToday.append(weeksWorkout[dayCount].ex1)
            workoutToday.append(weeksWorkout[dayCount].ex2)
            workoutToday.append(weeksWorkout[dayCount].ex3)
            workoutToday.append(weeksWorkout[dayCount].ex4)
            workoutToday.append(weeksWorkout[dayCount].ex5)
            tableViewOutlet.reloadData()
        }
    }
    
    
    func generateWorkouts(selectedType: String){
        weeksWorkout.removeAll()
        var switcher = 1
        if selectedType == "Upper/Lower"{
            for i in 0...6{
                if i != 2 && i != 5 && i != 6{
                    if switcher == 1{
                        let rand1 = Int.random(in: 0...upperMain.count-1)
                        let rand2 = Int.random(in: 0...triceps.count-1)
                        let rand3 = Int.random(in: 0...biceps.count-1)
                        let rand4 = Int.random(in: 0...shoulders.count-1)
                        let rand5 = Int.random(in: 0...back.count-1)
                        let rand11 = Int.random(in: 0...repsSets.count-1)
                        let rand22 = Int.random(in: 0...repsSets.count-1)
                        let rand33 = Int.random(in: 0...repsSets.count-1)
                        let rand44 = Int.random(in: 0...repsSets.count-1)
                        let rand55 = Int.random(in: 0...repsSets.count-1)
                        weeksWorkout.append(Workout(day: currentWeek[i], ex1: "\(upperMain[rand1]), \(repsSets[rand11])", ex2: "\(triceps[rand2]), \(repsSets[rand22])", ex3: "\(biceps[rand3]), \(repsSets[rand33])", ex4: "\(shoulders[rand4]), \(repsSets[rand44])", ex5: "\(back[rand5]), \(repsSets[rand55])"))
                        
                    }//switcher 1
                    else if switcher == -1{
                        let rand1 = Int.random(in: 0...lowerMain.count-1)
                        let rand2 = Int.random(in: 0...lowersquats.count-1)
                        let rand3 = Int.random(in: 0...hamstrings.count-1)
                        let rand4 = Int.random(in: 0...hips.count-1)
                        let rand5 = Int.random(in: 0...extraLegs.count-1)
                        let rand11 = Int.random(in: 0...repsSets.count-1)
                        let rand22 = Int.random(in: 0...repsSets.count-1)
                        let rand33 = Int.random(in: 0...repsSets.count-1)
                        let rand44 = Int.random(in: 0...repsSets.count-1)
                        let rand55 = Int.random(in: 0...repsSets.count-1)
                        weeksWorkout.append(Workout(day: currentWeek[i], ex1: "\(lowerMain[rand1]), \(repsSets[rand11])", ex2: "\(lowersquats[rand2]), \(repsSets[rand22])", ex3: "\(hamstrings[rand3]), \(repsSets[rand33])", ex4: "\(hips[rand4]), \(repsSets[rand44])", ex5: "\(extraLegs[rand5]), \(repsSets[rand55])"))
                        
                    }
                } //end of checkI
                else{
                    weeksWorkout.append(Workout(day: currentWeek[i], ex1: "Rest Day", ex2: " ", ex3: " ", ex4: " ", ex5: " "))
                }
                
               switcher = switcher * -1
                
                
                
            }
            
        } //end selectedType
        else if selectedType == "Push/Pull/Legs"{
            
            for i in 0...6{
                
                
                
             
                
                if i != 3 && i != 1 && i != 5{
                    if switcher == 1{
                        let rand1 = Int.random(in: 0...upperMain.count-1)
                        let rand2 = Int.random(in: 0...triceps.count-1)
                        let rand3 = Int.random(in: 0...upperExtra.count-1)
                        let rand4 = Int.random(in: 0...shoulders.count-1)
                        var rand5 = 0
                        while(true){
                             rand5 = Int.random(in: 0...upperExtra.count-1)
                            if rand5 != rand3{
                                break
                            }
                        }
                        
                        let rand11 = Int.random(in: 0...repsSets.count-1)
                        let rand22 = Int.random(in: 0...repsSets.count-1)
                        let rand33 = Int.random(in: 0...repsSets.count-1)
                        let rand44 = Int.random(in: 0...repsSets.count-1)
                        let rand55 = Int.random(in: 0...repsSets.count-1)
                        weeksWorkout.append(Workout(day: currentWeek[i], ex1: "\(upperMain[rand1]), \(repsSets[rand11])", ex2: "\(triceps[rand2]), \(repsSets[rand22])", ex3: "\(upperExtra[rand3]), \(repsSets[rand33])", ex4: "\(shoulders[rand4]), \(repsSets[rand44])", ex5: "\(upperExtra[rand5]), \(repsSets[rand55])"))
                        switcher = switcher * -1
                    }//switcher 1
                    else if switcher == -1{
                        let rand1 = Int.random(in: 0...lowermainPPL.count-1)
                        let rand2 = Int.random(in: 0...lowersquats.count-1)
                        let rand3 = Int.random(in: 0...hamstrings.count-1)
                        let rand4 = Int.random(in: 0...hips.count-1)
                        let rand5 = Int.random(in: 0...extraLegs.count-1)
                        let rand11 = Int.random(in: 0...repsSets.count-1)
                        let rand22 = Int.random(in: 0...repsSets.count-1)
                        let rand33 = Int.random(in: 0...repsSets.count-1)
                        let rand44 = Int.random(in: 0...repsSets.count-1)
                        let rand55 = Int.random(in: 0...repsSets.count-1)
                        weeksWorkout.append(Workout(day: currentWeek[i], ex1: "\(lowermainPPL[rand1]), \(repsSets[rand11])", ex2: "\(lowersquats[rand2]), \(repsSets[rand22])", ex3: "\(hamstrings[rand3]), \(repsSets[rand33])", ex4: "\(hips[rand4]), \(repsSets[rand44])", ex5: "\(extraLegs[rand5]), \(repsSets[rand55])"))
                        switcher = switcher * -1
                    }
                } //end of checkI
                else if i == 3{
                    weeksWorkout.append(Workout(day: currentWeek[i], ex1: "Rest Day", ex2: " ", ex3: " ", ex4: " ", ex5: " "))
                }
                else{
                    
                    
                    let rand1 = Int.random(in: 0...pullMain.count-1)
                    let rand2 = Int.random(in: 0...back.count-1)
                    let rand3 = Int.random(in: 0...rows.count-1)
                    let rand4 = Int.random(in: 0...pullExtra.count-1)
                    let rand5 = Int.random(in: 0...biceps.count-1)
                    let rand11 = Int.random(in: 0...repsSets.count-1)
                    let rand22 = Int.random(in: 0...repsSets.count-1)
                    let rand33 = Int.random(in: 0...repsSets.count-1)
                    let rand44 = Int.random(in: 0...repsSets.count-1)
                    let rand55 = Int.random(in: 0...repsSets.count-1)
                    weeksWorkout.append(Workout(day: currentWeek[i], ex1: "\(pullMain[rand1]), \(repsSets[rand11])", ex2: "\(back[rand2]), \(repsSets[rand22])", ex3: "\(rows[rand3]), \(repsSets[rand33])", ex4: "\(pullExtra[rand4]), \(repsSets[rand44])", ex5: "\(biceps[rand5]), \(repsSets[rand55])"))
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
            }//end loop
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
    }//end generate workout
    
    
    
    @IBAction func rightAction(_ sender: Any) {
       
        if dayCount < 6{
            dayCount = dayCount + 1
            dayOutlet.text = currentWeek[dayCount]
            
            if weeksWorkout.count != 0{
                workoutToday.removeAll()
                
                
                workoutToday.append(weeksWorkout[dayCount].ex1)
                workoutToday.append(weeksWorkout[dayCount].ex2)
                workoutToday.append(weeksWorkout[dayCount].ex3)
                workoutToday.append(weeksWorkout[dayCount].ex4)
                workoutToday.append(weeksWorkout[dayCount].ex5)
            }
            
            
        }
        
        tableViewOutlet.reloadData()
    } //end right action
    
    
    @IBAction func leftAction(_ sender: Any) {
        
        if dayCount > 0{
            dayCount = dayCount - 1
            dayOutlet.text = currentWeek[dayCount]
            
            
            workoutToday.removeAll()
            workoutToday.append(weeksWorkout[dayCount].ex1)
            workoutToday.append(weeksWorkout[dayCount].ex2)
            workoutToday.append(weeksWorkout[dayCount].ex3)
            workoutToday.append(weeksWorkout[dayCount].ex4)
            workoutToday.append(weeksWorkout[dayCount].ex5)
            
            
        }
        
        tableViewOutlet.reloadData()
    } // end left action
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return workoutsArray[row]
        }
        return ""
    }
    
    
    
    
    
    
    
    func getCurrentDayOfWeek() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: Date())
        
        
    }
    
    
    
    func getDaysOfTheWeekStartingFromToday() -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        var daysOfTheWeek = [String]()
        let calendar = Calendar.current
        let currentDate = Date()
        let currentWeekday = calendar.component(.weekday, from: currentDate)
        
        for offset in 0..<7 {
            if let nextDate = calendar.date(byAdding: .day, value: offset, to: currentDate) {
                let dayOfWeek = dateFormatter.string(from: nextDate)
                daysOfTheWeek.append(dayOfWeek)
            }
        }
        
        return daysOfTheWeek
    }
    
    
    
    
    
    }



