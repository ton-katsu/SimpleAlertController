//
//  ColorSchemeViewController.swift
//  SimpleAlertViewControllerExample
//
//  Created by yoshihisa on 2015/04/13.
//  Copyright (c) 2015年 ton-katsu. All rights reserved.
//

import UIKit

class ColorSchemeViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Color Scheme"
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
            cell.textLabel?.text = "Cloud Color"
        case 1:
            cell.textLabel?.text = "Lime Color"
        case 2:
            cell.textLabel?.text = "Ocean Color"
        case 3:
            cell.textLabel?.text = "Peach Color"
        default:
            break
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Cancel(;_;)")})
        let moveTab = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in
            self.tabBarController?.selectedIndex = 2
            print("Moved")
        })
        let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
        
        switch indexPath.row {
        case 0:
            let alert = SimpleAlertController(title: "Cloud", message: "color scheme", colorScheme: SimpleAlertColorScheme.Cloud)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
            
        case 1:
            let alert = SimpleAlertController(title: "Lime", message: "color scheme aaaaaaaaaaaaaaaaaaaaaaaa", colorScheme: SimpleAlertColorScheme.Lime)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        case 2:
            let alert = SimpleAlertController(title: "Ocean", message: "color scheme", colorScheme: SimpleAlertColorScheme.Ocean)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        case 3:
            let alert = SimpleAlertController(title: "Peach", message: "color scheme", colorScheme: SimpleAlertColorScheme.Peach)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        default:
            break
        }
    }
}
