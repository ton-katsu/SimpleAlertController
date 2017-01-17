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
        tableView = UITableView(frame: tableView.frame, style: UITableViewStyle.grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.cancel, handler: {() -> Void in print("Cancel(;_;)")})
        let moveTab = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.default, handler: {() -> Void in
            self.tabBarController?.selectedIndex = 2
            print("Moved")
        })
        let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.destructive, handler: nil)
        
        switch indexPath.row {
        case 0:
            let alert = SimpleAlertController(title: "Cloud", message: "color scheme", colorScheme: SimpleAlertColorScheme.cloud)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
            
        case 1:
            let alert = SimpleAlertController(title: "Lime", message: "color scheme aaaaaaaaaaaaaaaaaaaaaaaa", colorScheme: SimpleAlertColorScheme.lime)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        case 2:
            let alert = SimpleAlertController(title: "Ocean", message: "color scheme", colorScheme: SimpleAlertColorScheme.ocean)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        case 3:
            let alert = SimpleAlertController(title: "Peach", message: "color scheme", colorScheme: SimpleAlertColorScheme.peach)
            alert.addAction(moveTab)
            alert.addAction(destructive)
            alert.addAction(cancel)
            tabBarController?.simplePresentViewController(alert, animated: true)
        default:
            break
        }
    }
}
