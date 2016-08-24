//
//  CustomColorViewController.swift
//  SimpleAlertViewControllerExample
//
//  Created by yoshihisa on 2015/04/13.
//  Copyright (c) 2015年 ton-katsu. All rights reserved.
//

import UIKit

class CustomColorViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Custom Color"
        tableView = UITableView(frame: tableView.frame, style: UITableViewStyle.Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Custom color Pop"
        case 1:
            cell.textLabel?.text = "Custom color Metal"
        case 2:
            cell.textLabel?.text = "Button only"
        case 3:
            cell.textLabel?.text = "No title"
        default:
            break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
        case 0:
            let alert = SimpleAlertController(title: "Pop", message: "custom alert")
            alert.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 211/255, alpha: 0.7)
            alert.alertTableColor = UIColor(red: 51/255, green: 188/255, blue: 255/255, alpha: 1.0)
            alert.textColor = UIColor.whiteColor()
            
            let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
            move.buttonColor = UIColor(red: 100/255, green: 255/255, blue: 165/255, alpha: 1.0)
            move.buttonTextColor = UIColor.whiteColor()

            let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
            destructive.buttonColor = UIColor(red: 193/255, green: 255/255, blue: 6/255, alpha: 1.0)
            destructive.buttonTextColor = UIColor.redColor()
            
            let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Cancelled")})
            cancel.buttonColor = UIColor.whiteColor()
            cancel.buttonTextColor = UIColor(red: 51/255, green: 188/255, blue: 255/255, alpha: 1.0)
            
            
            alert.addAction(move)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
            
        case 1:
            let message = "We are not enemies, but friends. We must not be enemies. Though passion may have strained, it must not break our bonds of affection. The mystic chords of memory will swell when again touched, as surely they will be, by the better angels of our nature."
            let alert = SimpleAlertController(title: "Metal", message: message)
            alert.backgroundColor = UIColor(red: 5/255, green: 0, blue: 50/255, alpha: 0.7)
            alert.alertTableColor = UIColor(red: 5/255, green: 0, blue: 50/255, alpha: 1.0)
            alert.textColor = UIColor(red: 230/255, green: 255/255, blue: 31/255, alpha: 1.0)
            
            let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
            move.buttonColor = UIColor(red: 100/255, green: 40/255, blue: 70/255, alpha: 1.0)
            move.buttonTextColor = UIColor.whiteColor()
            
            let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
            destructive.buttonColor = UIColor(red: 94/255, green: 17/255, blue: 51/255, alpha: 1.0)
            destructive.buttonTextColor = UIColor.redColor()
            
            let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Cancelled")})
            cancel.buttonColor = UIColor.whiteColor()
            cancel.buttonTextColor = UIColor(red: 5/255, green: 0, blue: 50/255, alpha: 1.0)
            
            
            alert.addAction(move)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        case 2:
            let alert = SimpleAlertController(title: nil, message: nil, colorScheme: SimpleAlertColorScheme.Peach)
            
            let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
            
            let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
            
            let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Cancelled")})
            
            alert.addAction(move)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        case 3:
            let message = "I’m not interested in ordinary people. Those of you who are extraterrestrials, future-men, otherworldly beings and psychics, come to me. Period"
            let alert = SimpleAlertController(title: nil, message: message, colorScheme: SimpleAlertColorScheme.Ocean)
            
            let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
            
            let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Cancelled")})
            
            alert.addAction(move)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)

        default:
            break
        }
    }
}

