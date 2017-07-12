//
//  PodsDataProvider.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 02.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation

enum OS {
    case iOS
    case MACOS
}

protocol PodsDataProvider {
    func getPods(forOS: OS, start_at: Int, complertionHandler: @escaping (_ pods: [Pod], _ error: String?) -> Void )
}

