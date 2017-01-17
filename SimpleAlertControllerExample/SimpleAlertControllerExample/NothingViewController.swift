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
        button.setTitle("SimpleAlertController", for: UIControlState())
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(NothingViewController.cloud(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        view.addSubview(button)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cloud(_ button: UIButton) {
        let alert = SimpleAlertController(title: "Cloud", message: "color scheme", colorScheme: SimpleAlertColorScheme.cloud)
        let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.cancel, handler: {() -> Void in print("Cancel(;_;)")})
        let moveTab = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.default, handler: {() -> Void in
            self.tabBarController?.selectedIndex = 2
            print("Moved")
        })
        let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.destructive, handler: nil)
        alert.addAction(moveTab)
        alert.addAction(destructive)
        alert.addAction(cancel)
        tabBarController?.simplePresentViewController(alert, animated: true)
    }
}
