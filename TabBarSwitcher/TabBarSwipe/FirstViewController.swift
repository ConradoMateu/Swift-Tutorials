//
//  FirstViewController.swift
//  TabBarSwipe
//
//  Created by Conrado Mateu Gisbert on 19/08/16.
//  Copyright © 2016 conradomateu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, TabBarSwitcher {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initSwipe(.Left)
        self.view.backgroundColor = UIColor.cyanColor()
    }

    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            tabBarController?.selectedIndex = 1
        }
    }


}

