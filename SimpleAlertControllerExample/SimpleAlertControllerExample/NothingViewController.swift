//
//  NothingViewController.swift
//  SimpleAlertViewControllerExample
//
//  Created by yoshihisa on 2015/04/13.
//  Copyright (c) 2015年 ton-katsu. All rights reserved.
//

import UIKit

class NothingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton()
        button.setTitle("SimpleAlertViewController", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        button.addTarget(self, action: "cloud:", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRectMake(0, 0, 200, 50)
        button.center = view.center
        view.addSubview(button)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cloud(button: UIButton) {
        let alert = SimpleAlertController(title: "Cloud", message: "color scheme", colorScheme: SimpleAlertColorScheme.Cloud)
        let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in println("Cancel(;_;)")})
        let moveTab = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in
            self.tabBarController?.selectedIndex = 2
            println("Moved")
        })
        let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
        alert.addAction(moveTab)
        alert.addAction(destructive)
        alert.addAction(cancel)
        tabBarController?.simplePresentViewController(alert, animated: true)
    }
}