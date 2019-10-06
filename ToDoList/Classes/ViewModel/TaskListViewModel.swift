//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/06.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import Foundation
import Combine

final class TaskListViewModel: ObservableObject {
    
    @Published var taskName: String = ""
    @Published var taskTag: TaskTag = .default
    @Published var taskList = [Task]()
    @Published var showAllTasks = true
    
    /// 入力情報のクリア.
    func clear() {
        self.taskName = ""
        self.taskTag = .default
    }
    
    /// 新しいタスクの生成.
    func createNewTask() {
        let task = Task(name: taskName, tag: taskTag, done: false)
        taskList.insert(task, at: 0)
        
        clear()
    }
    
    /// 指定されたタスクの完了ステータスを切り替える。.
    /// - Parameter task: 対象のタスク.
    func done(_ task: Task) {
        taskList[index(of: task)].done.toggle()
    }
    
    /// タスクの削除.
    /// - Parameter offsets: 削除したいタスクのindexSet.
    func delete(at offsets: IndexSet) {
        taskList.remove(atOffsets: offsets)
    }
    
    /// タスクの並び替え.
    /// - Parameter source: 移動したいタスクのindexSet.
    /// - Parameter destination: 移動先.
    func move(from source: IndexSet, to destination: Int) {
        taskList.move(fromOffsets: source, toOffset: destination)
    }
    
    /// 指定されたタスクのインデックスを返す.
    /// - Parameter task: 対象のタスク.
    private func index(of task: Task) -> Int {
        taskList.firstIndex { $0.id == task.id }!
    }
}


extension TaskListViewModel {
    
    /// ダミーデータの作成.
    /// - Parameter count: ダミーデータ件数.デフォルトは10件.
    func createDummyData(count: Int = 10) {
        self.taskList = (0..<count).map { _ in
            Task.dummyData()
        }
    }
}
