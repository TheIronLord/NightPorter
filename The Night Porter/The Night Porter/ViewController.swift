//
//  ViewController.swift
//  The Night Porter
//
//  Created by Sajjad Patel on 2018-02-27.
//  Copyright © 2018 Sajjad Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    @IBAction func resetList(_ sender: Any) {
        let confirm = UIAlertController(title: "Are You Sure?", message: "Really reset the list?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
            action in
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            for i in 0..<self.monthlyTasks.count {
                self.monthlyTasks[i].completed = false
            }
            self.taskTableView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("That was a close one")
        }
        
        // add actions to controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        // show
        present(confirm, animated: true, completion: nil)
    }
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    // Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Print out the row selected
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView:UIView, actionPerformed:(Bool) -> Void) in
            
            // Find the right object to set to complete
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTasks[indexPath.row].completed = true
            default:
                break
            }
            
            // Reload tableView
            tableView.reloadData()
            
            // Tell iOS everything is okay
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    // Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        //Return the amount of sections in the table
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        // Returns the number of rows in each section
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Returns a UITableViewCell with the text from the specific indexPath section and row
        let cell = UITableViewCell()
        var currentTask: Task!

        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        // Set the cell text to the task name
        cell.textLabel?.text = currentTask.name
        
        // Change text color if task is completed
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        cell.backgroundColor = UIColor.clear
        return cell
        
//        print("Calling cellForRowAtIndexPath for row: \(indexPath.row)")
        
        //Use reusable cell
//        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
//        // Add image, text, subtitle, and assessory type
//        myCell.textLabel?.text = "This is row number \(indexPath.row)"
//        myCell.imageView?.image = UIImage(named: "clock")
//        myCell.accessoryType = .disclosureIndicator
//        myCell.detailTextLabel?.text = "This is some detail text"
        
//        return myCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Returns the header for each section
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    
    // Create [String] arrays of tasks
    var dailyTasks = [
        Task(name: "Check all Windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Checkk all doors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Is the boiler fueled?", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Document \"strange and unusual\" occurrences", type: .daily, completed: false, lastCompleted: nil)]
    
    var weeklyTasks = [
        Task( name: "Check inside all cabins", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Flush all lavatories in cabins", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Walk perimeter of property", type: .daily, completed: false, lastCompleted: nil)]
    
    var monthlyTasks = [
        Task(name: "Test security alarm", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Test motion detectors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .daily, completed: false, lastCompleted: nil)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

