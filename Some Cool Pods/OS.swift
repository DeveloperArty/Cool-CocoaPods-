//
//  OS.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 14.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation

enum OS {
    case iOS
    case MACOS
}

protocol SupportsOS {
    var currentOS: OS {get set}
}
