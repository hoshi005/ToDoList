//
//  TaskListRowView.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/06.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import SwiftUI

struct TaskListRowView: View {
    
    @ObservedObject var viewModel: TaskListViewModel
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.tag.imageName)
                .imageScale(.large)
            Text(task.name)
            Spacer()
            Image(systemName: task.done ? "checkmark.square" : "square")
                .imageScale(.large)
                .onTapGesture { self.viewModel.done(self.task) }
        }
    }
}

struct TaskListRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListRowView(viewModel: TaskListViewModel(), task: Task.dummyData())
    }
}
