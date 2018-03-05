//
//  ViewController.swift
//  The Night Porter
//
//  Created by Sajjad Patel on 2018-02-27.
//  Copyright © 2018 Sajjad Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Print out the row selected
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    // Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        //Return the amount of sections in the table
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Returns the number of rows in each section
//        switch section {
//        case 0:
//            return dailyTasks.count
//        case 1:
//            return weeklyTasks.count
//        case 2:
//            return monthlyTasks.count
//        default:
//            return 0
//        }
        // Temporary return 5 rows
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Returns a UITableViewCell with the text from the specific indexPath section and row
//        let cell = UITableViewCell()
//
//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = dailyTasks[indexPath.row]
//        case 1:
//            cell.textLabel?.text = weeklyTasks[indexPath.row]
//        case 2:
//            cell.textLabel?.text = weeklyTasks[indexPath.row]
//        default:
//            break
//        }
//        return cell
        
        print("Calling cellForRowAtIndexPath for row: \(indexPath.row)")
        
        //Use reusable cell
        let myCell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        // Add image, text, subtitle, and assessory type
        myCell.textLabel?.text = "This is row number \(indexPath.row)"
        myCell.imageView?.image = UIImage(named: "clock")
        myCell.accessoryType = .disclosureIndicator
        myCell.detailTextLabel?.text = "This is some detail text"
        
        return myCell
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
    let dailyTasks = ["Check all windows", "Check all doors", "Is the boiler fueled?",
                      "Check the mailbox", "Empty trash containers", "If freezing check water pipes", "Document \"strange and unusual occurrences\" "]
    
    let weeklyTasks = ["Check inside all cabins", "Flush all lavatories in cabins",
                       "Walk perimeter of property"]
    
    let monthlyTasks = ["Test security alarm", "Test motion detectors",
                        "Test smoke alarms"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

