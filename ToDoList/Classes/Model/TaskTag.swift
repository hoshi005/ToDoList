//
//  TaskTag.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/03.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import SwiftUI

enum TaskTag: CaseIterable {
    case calendar
    case book
    case person
    case airplane
    case game
    
    var imageName: String {
        switch self {
        case .calendar: return "calendar"
        case .book: return "book"
        case .person: return "person.3"
        case .airplane: return "airplane"
        case .game: return "gamecontroller"
        }
    }
    
    static var `default`: TaskTag {
        .calendar
    }
    
    static var random: TaskTag {
        TaskTag.allCases.randomElement()!
    }
}
