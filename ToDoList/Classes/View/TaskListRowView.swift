//
//  TaskListRowView.swift
//  ToDoList
//
//  Created by Susumu Hoshikawa on 2019/10/06.
//  Copyright © 2019 SH Lab, Inc. All rights reserved.
//

import SwiftUI

struct TaskListRowView: View {
    
    @ObservedObject var viewModel: TaskListRowViewModel
    
    var body: some View {
        HStack {
            Image(systemName: viewModel.task.tag.imageName)
                .imageScale(.large)
            Text(viewModel.task.name)
            Spacer()
            Image(systemName: viewModel.task.done ? "checkmark.square" : "square")
            .onTapGesture {
                self.viewModel.done()
            }
        }
    }
}

struct TaskListRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListRowView(viewModel: TaskListRowViewModel.createDummyData())
    }
}
