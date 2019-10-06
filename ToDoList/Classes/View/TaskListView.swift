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
                        if self.viewModel.showAllTasks || !task.done {
                            TaskListRowView(viewModel: self.viewModel, task: task)
                        }
                    }
                }
            }
            .navigationBarTitle(.init("タスク一覧"))
        }
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
