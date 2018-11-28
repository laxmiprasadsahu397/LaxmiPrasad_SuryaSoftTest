//
//  RootWireFrame.swift
//  LaxmiPrasad_SuryaSoft_Test
//
//  Created by LaxmiPrasad Sahu on 27/11/18.
//  Copyright © 2018 C1X. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {
    
    override init() {
        super.init()
    }
    
    func showRootViewController(viewController: UIViewController,  inWindow window: UIWindow) {
        let navigationController = self.navigationControllerFromWindow(window: window)
        navigationController.viewControllers = [viewController]
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.navigationBar.barTintColor = UIColor.init(red: 0/255, green: 188/255, blue: 212/255, alpha: 1)
        navigationController.navigationBar.tintColor = UIColor.white
        //        navigationController.navigationBar.isTranslucent = false
        return navigationController
    }
    
}
