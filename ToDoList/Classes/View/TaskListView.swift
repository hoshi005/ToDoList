//
//  TaskListView.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/03.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject(initialValue: TaskListViewModel()) var viewModel
    
    init() {
        // ダミーデータの作成.
        viewModel.createDummyData(count: 5)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // タスク入力ビュー.
                CreateTaskView(viewModel: viewModel)
                    .padding()
                
                // フィルタリング用.
                Toggle(isOn: $viewModel.showAllTasks) {
                    Text("完了済みのタスクも表示する")
                }
                .padding(.horizontal, 16)
                
                // タスク一覧.
                List {
                    ForEach(viewModel.taskList) { task in
                        // 全タスク表示 or 未完了タスク表示.
                        if self.viewModel.showAllTasks || !task.done {
                            TaskListRowView(viewModel: self.viewModel, task: task)
                        }
                    }
                    .onDelete(perform: viewModel.delete(at:)) // 削除.
                    .onMove(perform: viewModel.move(from:to:)) // 並び替え.
                }
            }
            .navigationBarTitle(.init("タスク一覧"))
            .navigationBarItems(trailing: EditButton()) // 編集ボタン.
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
