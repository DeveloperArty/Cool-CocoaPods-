//
//  PodDetailsDataProvider .swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 08.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation
protocol PodDetailsDataProvider  {
    func test(gitLink: String, completionHandler: @escaping (_ readme: String)-> Void)
}
