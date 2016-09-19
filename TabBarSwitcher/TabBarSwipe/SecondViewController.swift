//
//  SecondViewController.swift
//  TabBarSwipe
//
//  Created by Conrado Mateu Gisbert on 19/08/16.
//  Copyright © 2016 conradomateu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, TabBarSwitcher {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initSwipe(.Right)
        self.view.backgroundColor = UIColor.greenColor()
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            tabBarController?.selectedIndex = 0
        }
    }

}




