//
//  Pod.swift
//  Some Cool Pods
//
//  Created by Artem Pavlov on 08.07.17.
//  Copyright © 2017 Den prod. All rights reserved.
//

import Foundation

class Pod {
    
    let id: String
    let version: String
    let summary: String
    let authors: String
    let link: String
    let sourceGit: String
    
    init(id: String, version: String, summary: String, authors: String, link: String, sourceGit: String) {
        self.id = id
        self.version = version
        self.summary = summary
        self.authors = authors
        self.link = link
        self.sourceGit = sourceGit
    }
    
}
