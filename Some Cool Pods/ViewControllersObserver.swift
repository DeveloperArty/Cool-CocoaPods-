//
//  ViewControllersObserver.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 11.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
import UIKit

class ViewControllersObserver {
    
    static let sharedInstance = ViewControllersObserver()
    
    var podSelectionVC: UINavigationController?
    weak var infoVC: UINavigationController?
}
