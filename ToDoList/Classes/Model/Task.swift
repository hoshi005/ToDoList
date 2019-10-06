//
//  Task.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/06.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var tag: TaskTag
    var done: Bool = false
    
    static func dummyData() -> Task {
        .init(name: "AAA", tag: .random)
    }
}
