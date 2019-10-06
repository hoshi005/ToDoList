//
//  Task.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/06.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import Foundation

struct Task: Hashable, Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var tag: TaskTag
    var done: Bool = false
}


extension Task {
    
    static var dummyTask = [
        "ゴミ捨て",
        "洗濯する",
        "会社に電話する",
        "福岡に出張",
        "プレゼン資料を作成する",
        "洗剤を買って帰る",
        "プリンターを修理する"
    ]
    
    static func dummyData() -> Task {
        .init(name: dummyTask.randomElement()!, tag: .random)
    }
}
