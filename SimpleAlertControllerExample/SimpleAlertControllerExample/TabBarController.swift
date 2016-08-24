//
//  TabBarController.swift
//  SimpleAlertViewControllerExample
//
//  Created by yoshihisa on 2015/04/13.
//  Copyright (c) 2015年 ton-katsu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabControllers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTabControllers() {
        
        let colorSchemeNavigationController = UINavigationController(rootViewController: ColorSchemeViewController())
        let customColorNavigationController = UINavigationController(rootViewController: CustomColorViewController())
        let nothingNavigationController = UINavigationController(rootViewController: NothingViewController())
        colorSchemeNavigationController.tabBarItem = UITabBarItem(title: "Scheme", image: nil, tag: 1)
        customColorNavigationController.tabBarItem = UITabBarItem(title: "Custom", image: nil, tag: 2)
        nothingNavigationController.tabBarItem = UITabBarItem(title: "Nothing", image: nil, tag: 3)
        
        
        let viewControllers: Array = [
            colorSchemeNavigationController,
            customColorNavigationController,
            nothingNavigationController
        ]
        setViewControllers(viewControllers as [UIViewController], animated: false)
    }
}
