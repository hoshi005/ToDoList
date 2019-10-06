//
//  TaskListRowViewModel.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/06.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import Combine

final class TaskListRowViewModel: ObservableObject, Identifiable {
    
    @Published var task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    var id: String {
        task.id
    }
    
    var isDone: Bool {
        self.task.done
    }
    
    func done() {
        self.task.done.toggle()
    }
    
    /// ダミーデータの作成.
    static func createDummyData() -> TaskListRowViewModel {
        TaskListRowViewModel(task: Task.dummyData())
    }
}
