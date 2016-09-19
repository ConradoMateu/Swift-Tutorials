//
//  Swiper.swift
//  TabBarSwipe
//
//  Created by Conrado Mateu Gisbert on 21/08/16.
//  Copyright © 2016 conradomateu. All rights reserved.
//

import Foundation

import UIKit
@objc protocol TabBarSwitcher {
     func handleSwipes(sender:UISwipeGestureRecognizer)
}

extension TabBarSwitcher where Self: UIViewController {
    func initSwipe( direction:         UISwipeGestureRecognizerDirection){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(TabBarSwitcher.handleSwipes(_:)))
        swipe.direction = direction
        self.view.addGestureRecognizer(swipe)
    }
}